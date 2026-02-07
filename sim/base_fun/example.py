# File       : example.py
# Author     : Python-UVM Integration
# Description: Example usage of DUTrob driving Rename, WriteBack, and Mem interfaces concurrently
# Version    : v0.4

import ctypes
import os
import sys
import random

# Set dlopen flags to use RTLD_GLOBAL
sys.setdlopenflags(sys.getdlopenflags() | ctypes.RTLD_GLOBAL)

from PyRob import DUTrob

if __name__ == "__main__":
    print("=" * 80)
    print(" Hybrid Agent Concurrent Verification (Detailed Logging) ".center(80))
    print("=" * 80 + "\n")

    # Enable verbose UVM logging for detailed debug
    os.environ["UVM_VERBOSITY"] = "UVM_LOW"

    def monitor_callback(dut):
        """
        Callback for monitor updates.
        This prints what Python receives BACK from the SystemVerilog monitors.
        """
        print(f"  >>> [Python Recv] Cycle {dut.GetCycleCount()}:")
        if dut.io_enq_req_0_valid.value:
            print(f"      - Rename: PC=0x{dut.io_enq_req_0_bits_pc.value:x} robIdx={dut.io_enq_req_0_bits_robIdx_value.value}")
        if dut.io_writeback_24_valid.value:
            print(f"      - WB24: Data=0x{dut.io_writeback_24_bits_data_0.value:x}")
        if dut.io_lsq_mmio_0.value:
            print(f"      - Mem: MMIO_0 active")

    # Initialize DUT
    print("[Python] Initializing DUT...")
    dut = DUTrob()
    dut.InitClock()
    dut.SetUpdateCallback(monitor_callback)
    print("[Python] DUT initialized successfully\n")

    # Wait for UVM environment
    print("[Python] Waiting for UVM environment start (100 cycles)...")
    dut.Step(100)
    
    print("\n" + "-" * 80)
    print(" Starting Traffic Generation ".center(80))
    print("-" * 80)
    
    for i in range(20):
        cycle = dut.GetCycleCount()
        
        # --- 1. Prepare Traffic ---
        rename_valid_0 = 1 # Keep it valid for consistent logging
        rename_pc_0 = random.getrandbits(50)
        rename_rob_0 = i % 128
        
        wb_valid_24 = random.randint(0, 1)
        wb_data_24 = random.getrandbits(64)
        
        mem_mmio = random.randint(0, 1)
        
        # --- 2. Set Values ---
        dut.io_enq_req_0_valid.value = rename_valid_0
        dut.io_enq_req_0_bits_pc.value = rename_pc_0
        dut.io_enq_req_0_bits_robIdx_value.value = rename_rob_0
        
        dut.io_writeback_24_valid.value = wb_valid_24
        dut.io_writeback_24_bits_data_0.value = wb_data_24
        
        dut.io_lsq_mmio_0.value = mem_mmio
        
        # --- 3. Log Driven Values ---
        print(f"\n[Python Send] Cycle {cycle}:")
        print(f"      - Rename: PC=0x{rename_pc_0:x} robIdx={rename_rob_0}")
        if wb_valid_24:
            print(f"      - WB24: Data=0x{wb_data_24:x}")
        if mem_mmio:
            print(f"      - Mem: MMIO_0 active")

        # --- 4. Step Simulation ---
        # This will trigger the monitor_callback when SV sends data back
        dut.Step(1)
        
        # --- 5. Verify local mirror ---
        assert dut.io_enq_req_0_bits_pc.value == rename_pc_0
        if wb_valid_24:
            assert dut.io_writeback_24_bits_data_0.value == wb_data_24

    print("\n" + "=" * 80)
    print(" Concurrent Verification Completed Successfully ".center(80))
    print("=" * 80)