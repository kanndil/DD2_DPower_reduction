import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator




######################################################
rtl = "/Users/youssef/Downloads/test1.gl(1).v"
ast,_ = parse([rtl])
# get the root node of the tree (Description)
desc = ast.description
# get the ModuleDef node
definition = desc.definitions[0]
# get the portlist
# loop over all items with type InstanceList
# print the cell ports and their corresponding arguments

newrtl= []


#definition.show()
for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "InstanceList":
        instance = itemDeclaration.instances[0]
        if(instance.module == "sky130_fd_sc_hd__dfxtp_1"):
            D_input=None
            clk= None
            for hook in instance.portlist:
                if hook.portname == "CLK": #CLK
                    clk= hook
                if hook.portname == "D": #output
                    D_input= hook
            
            for itemDeclaration_two in definition.items:
                item_type_two = type(itemDeclaration_two).__name__
                if item_type_two == "InstanceList":
                    instance_two = itemDeclaration_two.instances[0]
                    if(instance_two.module == "sky130_fd_sc_hd__a21oi_1"):
                        #print("in sky130_fd_sc_hd__a21oi_1  ifstatement ")
                        A1_input=None
                        A2_input=None
                        for hook in instance_two.portlist:
                            if hook.portname == "A1":
                                A1_input=hook
                            if hook.portname == "A2":
                                A2_input=hook                        
                            if hook.portname == "Y": #CLK
                                #print("in portname = Y ifstatement ")
                                if hook.argname==D_input.argname :
                                    print("in hook d_input ifstatement ")
                                    # do connect inputs of this aoi to ICG  and append the ICG 
                                    # because thois is the matching hook
                                    GCLK=vast.PortArg("GCLK", vast.Identifier("_clockgate_output_gclk"))

                                    clkgateArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                    GCLK,
                                    vast.PortArg("GATE",A1_input.argname ),
                                    vast.PortArg("CLK", vast.Identifier("CLK")) # match names later##########
                                    ]

                                    clkgate_cell = vast.Instance(
                                    "sky130_fd_sc_hd__dlclkp",
                                    "_clockgate_cell_",
                                    tuple(clkgateArgs),
                                    tuple()
                                    )
                                    #do not forget wire
<<<<<<< HEAD
                                    clockgate_output_gclk = vast.Wire('_clockgate_output_gclk') # match names\
                                    newrtl.append(clockgate_output_gclk)
=======
                                    clockgate_output_gclk = vast.Wire('_clockgate_output_gclk') # match names
>>>>>>> 75db610358a2134f7dfc134e475ac22dcb2bbe93
                                    ICG=vast.InstanceList("sky130_fd_sc_hd__dlclkp", tuple(), tuple([clkgate_cell]))
                                    newrtl.append(ICG)
                                    #ICG created


                                    #create the connection between iCG and dff and append dff 
                                    # _clockgate_output_gclk -->> clk dff
                                    #  (~A2) inversion of sum --> d dff

                                    # creating inverter
                                    #sky130_fd_sc_hd__inv_1
<<<<<<< HEAD
                                    inv_out= vast.PortArg("Y", vast.Identifier("_inv_D"))
                                    invArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                    inv_out,
                                    vast.PortArg("A",A2_input.argname )
                                    ]



                                    inv_output_gclk = vast.Wire('_inv_D') # match names\


                                    newrtl.append(inv_output_gclk)



                                    inv_cell = vast.Instance(
                                    "sky130_fd_sc_hd__inv_1",# add counter to the identifier string to identify different clk gate outputs
                                    "_inv_D",
                                    tuple(invArgs),
                                    tuple()
                                    )
=======
                                    inv_out= vast.PortArg("A", vast.Identifier("_inv_Gclk"))
                                    invArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                    inv_out,
                                    vast.PortArg("Y",A2_input.argname )
                                    ]

                                    inv_cell = vast.Instance(
                                    "sky130_fd_sc_hd__inv_1",
                                    "_inv_Gclk",
                                    tuple(invArgs),
                                    tuple()
                                    )
                                    
                                    # inverter needs completion

                                    #dff
                                    dff= itemDeclaration
                                    instance_dff = dff.instances[0]
                                    for port in instance_dff.portlist:
                                        if port.portname == "CLK": #CLK
                                            port.argname= GCLK.argname
                                        if port.portname == "D": #output
                                            D_input.argname= A2_input.argname
                                    newrtl.append(dff)




>>>>>>> 75db610358a2134f7dfc134e475ac22dcb2bbe93
                                    
                                    # inverter needs completion



                                    newrtl.append(inv_cell)



                                    #dff
                                    dff= itemDeclaration
                                    instance_dff = dff.instances[0]
                                    for port in instance_dff.portlist:
                                        if port.portname == "CLK": #CLK
                                            port.argname= GCLK.argname
                                        if port.portname == "D": #output
                                            D_input.argname= inv_out.argname

                                    newrtl.append(dff)   


         
         
         
        else:
            newrtl.append(itemDeclaration)                                 



    else:

        newrtl.append(itemDeclaration)


definition.items = tuple(newrtl)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("test_2_Updated.v", "w+")
f.write(rslt)
f.close()