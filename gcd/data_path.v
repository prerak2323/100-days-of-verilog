module data_path(lt,gt,eq,ldA,ldB,sel1,sel2,sel_load,clk,data_in);
input clk,sel1,sel2,sel_load,ldA,ldB;
input [15:0]data_in;
output lt,gt,eq;

wire [15:0]Aout,Bout,x,y,subout,Bus;

PIPO A(Aout,Bus,clk,ldA);
PIPO B(Bout,Bus,clk,ldB);
MUX MUX1(x,Bout,Aout,sel1);
MUX MUX2(y,Bout,Aout,sel2);
MUX MUX_load(Bus,subout,data_in,sel_load);
SUB SUBTRACTOR(subout,x,y);
comparator COMP(lt,gt,eq,Aout,Bout);
endmodule




