module PE(D7,D6,D5,D4,D3,D2,D1,D0,A2,A1,A0);

input D7,D6,D5,D4,D3,D2,D1,D0;
output A2,A1,A0;

assign A2=D7|D6|D5|D4;
assign A1=D7|D6|D3|D2;
assign A0=D7|D3|D5|D1;

endmodule

