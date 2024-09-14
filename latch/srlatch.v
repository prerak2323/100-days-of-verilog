module srlatch(s,r,enb,q,qbar);

input enb,s,r;
output q,qbar;

assign q=~(r&qbar);
assign qbar=~(s&q);

endmodule
