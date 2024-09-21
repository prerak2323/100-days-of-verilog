module COMPARE(lt, gt, eq, data1,data2);
  input [15:0] data1,data2;
  output lt, gt, eq;

  assign lt = data1< data2;  // Correct: lt should be assigned for v1 < v2
  assign gt = data1>data2;  // Correct: gt should be assigned for v1 > v2
  assign eq = data1 == data2; // Correct: eq should be assigned for v1 == v2

endmodule

