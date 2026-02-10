import pytest
import os
import sys
import random

from PyRob import DUTrob

@pytest.fixture
def dut():
    """Fixture to initialize and return the DUT instance."""
    print("\n[Pytest] Initializing DUT...")
    d = DUTrob()
    d.InitClock()
    # Wait for UVM environment start
    d.Step(100)
    return d

def test_dut_cycle_count(dut):
    """Test that the cycle count increases correctly."""
    start_cycle = dut.GetCycleCount()
    dut.Step(10)
    assert dut.GetCycleCount() == start_cycle + 10
    print(f"[Pytest] Cycle count test passed: {start_cycle} -> {dut.GetCycleCount()}")

def test_dut_drive_rename(dut):
    """Test driving the Rename interface."""
    pc = 0xabcdef1234
    rob_idx = 42
    
    dut.io_enq_req_0_valid.value = 1
    dut.io_enq_req_0_bits_pc.value = pc
    dut.io_enq_req_0_bits_robIdx_value.value = rob_idx
    
    dut.Step(1)
    
    # Verify values are maintained in the local mirror
    assert dut.io_enq_req_0_bits_pc.value == pc
    assert dut.io_enq_req_0_bits_robIdx_value.value == rob_idx
    print(f"[Pytest] Rename interface drive test passed: PC=0x{pc:x}")

def test_dut_drive_writeback(dut):
    """Test driving the WriteBack interface."""
    data = random.getrandbits(64)
    
    dut.io_writeback_24_valid.value = 1
    dut.io_writeback_24_bits_data_0.value = data
    
    dut.Step(1)
    
    assert dut.io_writeback_24_bits_data_0.value == data
    print(f"[Pytest] WriteBack interface drive test passed: Data=0x{data:x}")

if __name__ == "__main__":
    # Allow running this file directly with python3
    pytest.main([__file__])
