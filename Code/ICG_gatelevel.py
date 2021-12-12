import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator



"""
- multiple enables

- support muxes

- support different sizez of muxes and aois         ****done****

- remove unneeded cells    **** done ****

- test cases

- simulate test cases

- readme

- originnal clk    ***done****

"""


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

newrtl_out= []
newrtl= []
aoi_out_list=[]
inserted_before=0
D_input=None
clk= None
GCLK=None
inv_counter=0
#definition.show()
for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "InstanceList":
        instance = itemDeclaration.instances[0]
        if("sky130_fd_sc_hd__dfxtp" in instance.module):
            for hook in instance.portlist:
                if hook.portname == "CLK": #CLK
                    clk= hook
                if hook.portname == "D": #output
                    D_input= hook
            
            for itemDeclaration_two in definition.items:
                item_type_two = type(itemDeclaration_two).__name__
                if item_type_two == "InstanceList":
                    instance_two = itemDeclaration_two.instances[0]
                    if( "sky130_fd_sc_hd__a21oi" in instance_two.module ):
                        aoi_name= instance_two.module
                        aoi_name_arr=aoi_name.split('-')
                        aoi_size= aoi_name[-1]
                        print(aoi_size)
                        #print("in sky130_fd_sc_hd__a21oi_1  ifstatement ")
                        A1_input=None
                        A2_input=None
                        for hook in instance_two.portlist:
                            if hook.portname == "A1":
                                A1_input=hook
                            if hook.portname == "A2":
                                A2_input=hook                        
                            if hook.portname == "Y": 
                                #print("in portname = Y ifstatement ")
                                if hook.argname==D_input.argname :
                                    aoi_out_list.append(hook)
                                    print("in hook d_input ifstatement ")
                                    # do connect inputs of this aoi to ICG  and append the ICG 
                                    if inserted_before==0:
                                        inserted_before=1
                                        # because thois is the matching hook
                                        GCLK=vast.PortArg("GCLK", vast.Identifier("_clockgate_output_gclk"))

                                        clkgateArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                        GCLK,
                                        vast.PortArg("GATE",A1_input.argname ),
                                        vast.PortArg("CLK", clk.argname) # match names later##########
                                        ]

                                        clkgate_cell = vast.Instance(
                                        "sky130_fd_sc_hd__dlclkp",
                                        "_clockgate_cell_",
                                        tuple(clkgateArgs),
                                        tuple()
                                        )
                                        #do not forget wire
                                        clockgate_output_gclk = vast.Wire('_clockgate_output_gclk') # match names\
                                        newrtl.append(clockgate_output_gclk)
                                        ICG=vast.InstanceList("sky130_fd_sc_hd__dlclkp_"+str(aoi_size), tuple(), tuple([clkgate_cell]))
                                        newrtl.append(ICG)
                                        #ICG created


                                    #create the connection between iCG and dff and append dff 
                                    # _clockgate_output_gclk -->> clk dff
                                    #  (~A2) inversion of sum --> d dff

                                    # creating inverter
                                    #sky130_fd_sc_hd__inv_1
                                    inv_out= vast.PortArg("Y", vast.Identifier("_inv_D_"+str(inv_counter)))
                                    invArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                    inv_out,
                                    vast.PortArg("A",A2_input.argname )
                                    ]



                                    inv_output_gclk = vast.Wire("_inv_D_"+str(inv_counter)) # match names\


                                    newrtl.append(inv_output_gclk)


                                    # add counter to the identifier string to identify different clk gate outputs
                                    inv_cell = vast.Instance(
                                    "sky130_fd_sc_hd__inv_1",
                                     "_inv_D_"+str(inv_counter),
                                    tuple(invArgs),
                                    tuple()
                                    )
                                    inverterr=vast.InstanceList("sky130_fd_sc_hd__inv", tuple(), tuple([inv_cell]))
                                    # inverter needs completion



                                    newrtl.append(inverterr)
                                    inv_counter+=1



                                    #dff
                                    dff= itemDeclaration
                                    instance_dff = dff.instances[0]
                                    for port in instance_dff.portlist:
                                        if port.portname == "CLK": #CLK
                                            port.argname= GCLK.argname
                                        if port.portname == "D": #output
                                            D_input.argname= inv_out.argname

                                    newrtl.append(dff)   


         
         

for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "InstanceList": 
        instance = itemDeclaration.instances[0]
        if("sky130_fd_sc_hd__dfxtp" in instance.module):
            print("disregard dff")
        elif("sky130_fd_sc_hd__a21oi" in instance.module):
            temp= itemDeclaration
            instance_temp = temp.instances[0]
            for port in instance_temp.portlist:
                if port.portname == "Y":
                    flag=False
                    for output in aoi_out_list:
                        if (output.argname == port.argname):
                            flag=True

            if flag == False:
                newrtl_out.append(itemDeclaration)
                            

                
        else:
            newrtl_out.append(itemDeclaration)                                 



    else:

        newrtl_out.append(itemDeclaration)



newrtl_out+= newrtl



definition.items = tuple(newrtl_out)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("test_2_Updated.v", "w+")
f.write(rslt)
f.close()