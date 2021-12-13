
![the_american_university_in_cairo_0](https://user-images.githubusercontent.com/63082375/145812500-c4416b84-b1f0-4c99-b2f5-39622d864d2b.jpg)



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
to run the tool you must first download the source code called ICG_gatelevel.py and give it a gate level netlist that you want to generate its modified version from within the code itself. 


# how to complie the code 
Open the terminal from within the file that has both the code and the test case and write 
- python3 ICG_gatelevel.py 
and the code should run.

# how the code works 
- first approach 

![new_system_without_mux](https://user-images.githubusercontent.com/63082375/145812282-56d5ec1a-b665-4e85-9c8b-435088a78689.png)


    + this utility takes a gate-level netlist that is produced from a synthesizer like yosys
    + it searches for flipflop modules in the netlist 
    + then from their inputs it detects the preceding cell
    + if the preceding cell is a mux 
        - replace it with an ICG cell that correspondes to the size of the mux
    + else if the preceding cell is an AOI 
        - check if one of the cell's inputs is connected to an enable 
        - remove the AOI mux
        - take the other input of the AOI, invert it and connect it to the flipflop refer to the diagrams in the diagrams folder)
        - insert the ICG cell
    + write the cells into a new file

    + a better Idea would be inserting the ICG cells within the intermediate language produced by yosys

- second approach 

<img width="462" alt="refenced_image" src="https://user-images.githubusercontent.com/63082375/145812148-8c9b64ed-bbdb-44ca-a263-b8632cf30081.png">


    + this utility takes a RTL verilog code
    + it detects an always statement
    + checks if it has an if condition that checks the module's enable
        - removes the if statement
        - inserts a latch and an and gate 
        - creating an ICG logic  (refer to the diagrams in the diagrams folder)
        - for example:
    
        <!--assign new_clk = (new_enable & clk);
                always @(clk or s) begin
                    if(~clk) new_enable <= s; 
                    else new_enable <= new_enable;
                 end
            always @(posedge new_clk) r <= x;-->

     + a better Idea would be inserting an ICG cell corresponding to the mapping technology



# what works?
    - test case (1-2-3)
    - normal 2x1 muxes of any size
    - a21oi mux circuits of any size
    - modules of combinational logic within sequential logic
    - multiple enables modules
    - single enable modules with multiple flipflops (creates only one ICG unit)--> fanout is not considered (requires modification for real use)

# what does not work?
    - test case (4)
    - other form of muxes than the specified above
    - more than two input muxes
    - the utility does not show any messages if it does not work correctly
    - needs verification before use 



