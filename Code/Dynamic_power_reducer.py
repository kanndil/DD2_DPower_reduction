import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

#test tests

######################################################
rtl = "Code/test1(1).v"
ast,_ = parse([rtl])
# get the root node of the tree (Description)
desc = ast.description
# get the ModuleDef node
definition = desc.definitions[0]
# get the portlist
# loop over all items with type InstanceList
# print the cell ports and their corresponding arguments

newrtl= []
################################################
new_clk = vast.Wire('new_clk')
new_enable= vast.Reg('new_enable')
newrtl.append(new_clk)

newrtl.append(new_enable)

####################################################




for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "Always":
        
        print('x')


    else:

        newrtl.append(itemDeclaration)


definition.items = tuple(newrtl)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("testUpdated.v", "w+")
f.write(rslt)
f.close()
