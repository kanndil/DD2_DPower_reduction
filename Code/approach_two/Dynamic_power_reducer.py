import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator




######################################################
rtl = "test2.v"
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

port_list=definition.portlist.ports


for itemDeclaration in definition.items:
    item_type = type(itemDeclaration).__name__
    if item_type == "Always":
        for port in port_list:
                if(str(port.first.name) == str(itemDeclaration.statement.statements[0].statement.cond)):
                    print("in")
                    #designing latch statement
                    
                    if0_true = vast.NonblockingSubstitution(
                    vast.Lvalue(vast.Identifier('new_enable')),
                    vast.Rvalue(itemDeclaration.statement.cond))

                    if0_false = vast.NonblockingSubstitution(
                    vast.Lvalue(vast.Identifier('new_enable')),
                    vast.Rvalue(vast.Identifier('new_enable')))
                    if0 = vast.IfStatement(vast.Identifier('~'+str(itemDeclaration.sens_list.list[0].sig)), if0_true, if0_false)
                    statement_latch = vast.Block([ if0 ])
                    

                    #designing latch senslist
                    sens_latch_clk = vast.Sens(itemDeclaration.sens_list.list[0].sig, type='') 
                    sens_latch_en= vast.Sens(itemDeclaration.statement.cond, type='') ####
                    senslist_latch = vast.SensList([ sens_latch_clk, sens_latch_en])

                    always_latch = vast.Always(senslist_latch, statement_latch)
                   

                    right_assign=vast.And(vast.Identifier('new_enable'),itemDeclaration.sens_list.list[0].sig )
                    
                    assign_nw_clk= vast.Assign(vast.Lvalue(vast.Identifier('new_clk')), right_assign)



                    sens_alw = vast.Sens(vast.Identifier('new_clk'), type='posedge')
                    senslist_alw = vast.SensList([ sens_alw ])
                    statement=itemDeclaration.statement.true_statement
                    always = vast.Always(senslist_alw, statement)
                    newrtl.append(assign_nw_clk)
                    newrtl.append(always_latch)
                    newrtl.append(always)
    else:

        newrtl.append(itemDeclaration)


definition.items = tuple(newrtl)
codegen = ASTCodeGenerator()
rslt = codegen.visit(ast)
f = open("test_2_Updated.v", "w+")
f.write(rslt)
f.close()