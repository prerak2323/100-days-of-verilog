module comparator(lt,gt,eq,in0,in1);
input [15:0]in0,in1;
output lt,gt,eq;

assign lt=in0<in1;
assign gt=in0>in1;
assign eq=in0==in1;

endmodule
