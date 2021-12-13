# DD2_DPower_reduction
A utility to reduce the dynamic power consumption by performing automatic clock gating for registers.

# Contributers:
    - Youssef Ashraf Kandil
    - Adham Meligy


# references
    -https://github.com/marwanH1998/AutomaticClockGatingDD2/blob/master/main.py
    

# dependencies
    - Python3: 3.7 or later
    - Icarus Verilog: 10.1 or later
        + sudo apt install iverilog
        + brew install icarus-verilog (for MacOS)

    - PLY: 3.4 or later
    - Jinja2: 2.10 or later
        + pip3 install jinja2 ply
        
    - pyverilog 
        + pip3 install pyverilog


# how to use the tool
to run the tool you must first download the source code called ICG_gatelevel.py and give it the test case verilog code that you want to generate its netlist from within the code itself. 


# how to complie the code 
Open the terminal from within the file that has both the code and the test case and write python ICG_gatelevel.py and the code should run.
