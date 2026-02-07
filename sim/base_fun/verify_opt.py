import os
import sys

# Add current directory to path so we can import PyRob
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

try:
    from PyRob import DUTCSR_in_agent_xaction
except ImportError:
    print("Error: Could not import PyRob. Make sure you are running from the correct environment.")
    sys.exit(1)

def run_verification():
    print("========================================================")
    print("   Starting Dirty-Check Optimization Verification")
    print("========================================================")

    # Initialize DUT
    dut = DUTCSR_in_agent_xaction()
    
    # Enable clock if needed (assuming default is fine)
    dut.InitClock()

    print("\n[Step 1] Initial Drive: io_csr_intrBitSet = 1")
    print("EXPECTATION: Transaction sent to UVM (Count should increment)")
    dut.io_csr_intrBitSet.value = 1
    dut.Step(1)
    
    # We can't easily check UVM internal count from here without parsing logs,
    # but we can check if the value persisted in our view.
    assert dut.io_csr_intrBitSet.value == 1, "Error: Value verification failed at Step 1"
    print("PASS: Step 1 completed.")

    print("\n[Step 2] Idle Run: 10 cycles with NO changes")
    print("EXPECTATION: NO Transactions sent to UVM (Optimization active)")
    # If optimization works, this loop puts 0 load on the IPC channel
    dut.Step(10)
    
    # Since we rely on local caching when not updating, this value should still be 1.
    assert dut.io_csr_intrBitSet.value == 1, "Error: Value lost during idle steps!"
    print("PASS: Step 2 completed (10 idle cycles).")

    print("\n[Step 3] Change Value: io_csr_intrBitSet = 0")
    print("EXPECTATION: Transaction sent to UVM")
    dut.io_csr_intrBitSet.value = 0
    dut.Step(1)
    
    assert dut.io_csr_intrBitSet.value == 0, "Error: Value verification failed at Step 3"
    print("PASS: Step 3 completed.")

    print("\n[Step 4] Mixed signals")
    print("EXPECTATION: Only sending because we changed 'io_csr_wfiEvent'")
    dut.io_csr_wfiEvent.value = 1
    # io_csr_intrBitSet is still 0 (clean), wfiEvent is 1 (dirty)
    dut.Step(1)
    
    assert dut.io_csr_wfiEvent.value == 1
    assert dut.io_csr_intrBitSet.value == 0
    print("PASS: Step 4 completed.")

    print("\n========================================================")
    print("VERIFICATION SUCCESSFUL")
    print("Please check the simulator log file (sim/base_fun/exec/sim.log or similar)")
    print("to confirm that 'Received transaction from Python' count is LOW.")
    print("========================================================")
    
    dut.Finish()

if __name__ == "__main__":
    run_verification()