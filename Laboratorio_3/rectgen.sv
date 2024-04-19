module rectgen(input logic on, input logic [9:0] x, y, left, right, top, bot,
output logic inrect);
assign inrect = on & (x >= left & x < right & y >= top & y < bot);
endmodule