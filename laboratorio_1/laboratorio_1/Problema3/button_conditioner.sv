module button_conditioner (input logic clk, btn, output logic out);
 
  logic [19:0] ctr_d, ctr_q;
  logic [1:0] sync_d, sync_q;
 
  assign out = ctr_q == {20{1'b1}};
 
  always_comb begin
    sync_d[0] = btn;
    sync_d[1] = sync_q[0];
    ctr_d = ctr_q + 1'b1;
 
    if (ctr_q == {20{1'b1}}) begin
      ctr_d = ctr_q;
    end
 
    if (!sync_q[1])
      ctr_d = 20'd0;
  end
 
  always_ff @(posedge clk) begin
    ctr_q <= ctr_d;
    sync_q <= sync_d;
  end
 
endmodule