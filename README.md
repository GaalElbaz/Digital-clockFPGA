# Digital Clock Implementation on Basys3 FPGA Board

This project showcases a digital clock implemented on the Basys3 FPGA board using SystemVerilog and Xilinx Vivado. The clock displays hours and minutes on four seven-segment displays in HH:MM format, with seconds shown on eight LEDs. Users can easily adjust the time using dedicated buttons.

**Inputs:**
1. **clk:** Main clock signal
2. **en:** Active high enable signal
3. **rst:** Resets all outputs when in logic level 1
4. **hrup:** Adjust hours
5. **minup:** Adjust minutes

The repository includes design files, simulation files, and constraint files.
