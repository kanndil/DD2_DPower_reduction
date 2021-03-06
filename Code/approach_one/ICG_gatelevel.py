import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator



"""

- test cases

- simulate test cases

- readme

"""


######################################################
rtl = "/Users/youssef/Documents/Academics/semester_vi/DD2/DD2_DPower_reduction/Testing/approach_one/test_four/test4.gl.v"
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
mux_out_list=[]
enable_list=[["",""]]
inserted_before=0
D_input=None
clk= None
Gclk_counter=0
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
                    if( "sky130_fd_sc_hd__a21oi" in instance_two.module):
                        aoi_name= instance_two.module
                        aoi_name_arr=aoi_name.split('-')
                        aoi_size= aoi_name[-1]
                        print(aoi_size)
                        A1_input=None
                        A2_input=None
                        for hook in instance_two.portlist:
                            if hook.portname == "A1":
                                A1_input=hook
                            if hook.portname == "A2":
                                A2_input=hook                        
                            if hook.portname == "Y": 
                                if hook.argname==D_input.argname :
                                    aoi_out_list.append(hook)
                                    print("in hook d_input ifstatement ")
                                    # do connect inputs of this aoi to ICG  and append the ICG 
                                    GCLK=None
                                    for enable in enable_list:
                                        if (enable[0] == A1_input.argname):
                                            GCLK=enable[1]
                                            
                                    if (GCLK==None):

                                        
                                        # because thois is the matching hook
                                        GCLK=vast.PortArg("GCLK", vast.Identifier("_clockgate_output_gclk_"+str(Gclk_counter)))

                                        enable_list.append([A1_input.argname,GCLK])
                                        

                                        clkgateArgs = [ # add counter to the identifier string to identify different clk gate outputs
                                        GCLK,
                                        vast.PortArg("GATE",A1_input.argname ),
                                        vast.PortArg("CLK", clk.argname) # match names later##########
                                        ]

                                        clkgate_cell = vast.Instance(
                                        "sky130_fd_sc_hd__dlclkp",
                                        "_clockgate_cell_"+str(Gclk_counter)+"_",
                                        tuple(clkgateArgs),
                                        tuple()
                                        )
                                        #do not forget wire
                                        clockgate_output_gclk = vast.Wire('_clockgate_output_gclk_'+str(Gclk_counter)) # match names\
                                        newrtl.append(clockgate_output_gclk)
                                        ICG=vast.InstanceList("sky130_fd_sc_hd__dlclkp_"+str(aoi_size), tuple(), tuple([clkgate_cell]))
                                        newrtl.append(ICG)
                                        Gclk_counter+=1
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
                                     "_inv_D_"+str(inv_counter)+"_",
                                    tuple(invArgs),
                                    tuple()
                                    )
                                    inverterr=vast.InstanceList("sky130_fd_sc_hd__inv_1", tuple(), tuple([inv_cell]))
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
                    elif ("sky130_fd_sc_hd__mux" in instance_two.module) :
                        mux_name = instance_two.module
                        mux_name_arr = mux_name.split('-')
                        mux_size = mux_name[-1]
                        print(mux_size)

                        S_input = None
                        A1_input = None
                        for hook in instance_two.portlist:
                            if hook.portname == "S" :
                                S_input = hook
                            if hook.portname == "A1" :
                                A1_input = hook
                            if hook.portname == "X" :
                                if hook.argname == D_input.argname :
                                    mux_out_list.append(hook)
                                    print("in hook d_input ifstatement ")

                                    GCLK=None
                                    for enable in enable_list:
                                        if (enable[0] == S_input.argname):
                                            GCLK=enable[1]
                                            
                                    if (GCLK==None):

                                        
                                        # because thois is the matching hook
                                        GCLK=vast.PortArg("GCLK", vast.Identifier("_clockgate_output_gclk_"+str(Gclk_counter)))

                                        enable_list.append([S_input.argname,GCLK])


                                        clkgateArgs = [# add counter to the identifier string to identify different clk gate outputs
                                        GCLK,
                                        vast.PortArg("GATE", S_input.argname),
                                        vast.PortArg("CLK", clk.argname) # match names later##########
                                        ]

                                        clkgate_cell = vast.Instance(
                                            "sky130_fd_sc_hd__dlclkp",
                                            "_clockgate_cell_"+str(Gclk_counter)+"_",
                                            tuple(clkgateArgs),
                                            tuple()
                                        )
                                        #do not forget wire
                                        clockgate_output_gclk = vast.Wire('_clockgate_output_gclk_'+str(Gclk_counter)) # match names\
                                        newrtl.append(clockgate_output_gclk)
                                        ICG = vast.InstanceList("sky130_fd_sc_hd__dlclkp_" + str(mux_size), tuple(), tuple([clkgate_cell]))
                                        newrtl.append(ICG)
                                        Gclk_counter+=1
                                        #ICG created



                                    #dff
                                    dff = itemDeclaration
                                    instance_dff = dff.instances[0]
                                    for port in instance_dff.portlist:
                                        if port.portname == "CLK" : #CLK
                                            port.argname = GCLK.argname
                                        if port.portname == "D": #output
                                            D_input.argname = A1_input.argname
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

        elif("sky130_fd_sc_hd__mux" in instance.module):
            temp= itemDeclaration
            instance_temp = temp.instances[0]
            for port in instance_temp.portlist:
                if port.portname == "X":
                    flag=False
                    for output in mux_out_list:
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
f = open("/Users/youssef/Documents/Academics/semester_vi/DD2/DD2_DPower_reduction/Testing/approach_one/test_four/test4.gl.updated.v", "w+")
f.write(rslt)
f.close()
