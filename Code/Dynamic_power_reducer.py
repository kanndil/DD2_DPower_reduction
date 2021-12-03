import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator






rtl = "test2.gl.v"
ast,_ = parse([rtl])
# get the root node of the tree (Description)
desc = ast.description
# get the ModuleDef node
definition = desc.definitions[0]
# get the portlist
# loop over all items with type InstanceList
# print the cell ports and their corresponding arguments

newrtl= []
inputlist = []
outputlist= [] 
clkgateArgs = [
 vast.PortArg("GCLK", vast.Identifier("__clockgate_output_gclk_")),
 vast.PortArg("GATE", vast.Identifier("EN")),
 vast.PortArg("CLK", vast.Identifier("CLK"))
]

clkgate_cell = vast.Instance(
 "sky130_fd_sc_hd__dlclkp",
 "__clockgate_cell__",
 tuple(clkgateArgs),
 tuple()
)
clockgate_output_gclk = vast.Wire('__clockgate_output_gclk_')


k=0
insertedbefore=0;
newrtl.append(clockgate_output_gclk)
for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "InstanceList":
        instance = itemDeclaration.instances[0]
        if(instance.module == "sky130_fd_sc_hd__mux2_1"):
            print(instance.module)
            if insertedbefore ==0:
                newrtl.append(vast.InstanceList("sky130_fd_sc_hd__dlclkp", tuple(), tuple([clkgate_cell])))
                insertedbefore=1
            for hook in instance.portlist:
                if hook.portname == "A1": #input
                    inputlist.append(hook.argname)
                if hook.portname == "A0": #output
                    outputlist.append(hook.argname)
            continue
       # print("cell-name: ", instance.module, "instance-name: ", instance.name)
        for hook in instance.portlist:
            if hook.portname == "CLK":
                print("change to clk input which is __clockgate_output_gclk_",hook.argname)
                hook.argname=vast.Identifier('__clockgate_output_gclk_')
            if hook.portname == "D":
                    hook.argname=inputlist[k]
            if hook.portname == "Q":
                    hook.argname=outputlist[k]
        k = k + 1
       # print("portname: ", hook.portname, "argname: ", hook.portname)
    newrtl.append(itemDeclaration)


definition.items = tuple(newrtl)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("testUpdated.v", "w+")
f.write(rslt)
f.close()