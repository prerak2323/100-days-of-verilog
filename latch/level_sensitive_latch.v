module level_sensitive_latch(d,q,enb);

input d,enb;
output q;

assign q=en?d:q;
endmodule

// A SIMPLE D LATCH WILL BE GENERATED
