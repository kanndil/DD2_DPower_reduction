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


definition.show()
for itemDeclaration in definition.items:
    item_type = type(itemDeclaration)._name_
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
                item_type_two = type(itemDeclaration_two)._name_
                if item_type_two == "InstanceList":
                    instance_two = itemDeclaration_two.instances[0]
                    if(instance_two.module == "sky130_fd_sc_hd__a21oi_1"):
                        A1_input=None
                        A2_input=None
                        for hook in instance.portlist:
                            if hook.portname == "A1":
                                A1_input=hook
                            if hook.portname == "A2":
                                A2_input=hook                        
                            if hook.portname == "Y": #CLK
                                if hook == D_input:

                                    # do connect inputs of this aoi to ICG  and append the ICG 
                                    # because thois is the matching hook
                                    
                                    clkgateArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                    vast.PortArg("GCLK", vast.Identifier("_clockgate_output_gclk")),
                                    vast.PortArg("GATE",A1_input.argname ),
                                    vast.PortArg("CLK", vast.Identifier("CLK")) # match names later##########
                                    ]

                                    clkgate_cell = vast.Instance(
                                    "sky130_fd_sc_hd__dlclkp",
                                    "_clockgate_cell_",
                                    tuple(clkgateArgs),
                                    tuple()
                                    )
                                    clockgate_output_gclk = vast.Wire('_clockgate_output_gclk') # match names
                                    newrtl.append(vast.InstanceList("sky130_fd_sc_hd__dlclkp", tuple(), tuple([clkgate_cell])))
                                    #ICG created
                                    





                



    else:

        newrtl.append(itemDeclaration)


definition.items = tuple(newrtl)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("test_2_Updated.v", "w+")
f.write(rslt)
f.close()