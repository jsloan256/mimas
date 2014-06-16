module mimas (gpio);

output [31:0] gpio;

wire [31:0] gpio;
wire osc_dis, tmr_rst, osc_out, tmr_out;


defparam I1.TIMER_DIV = "1048576";
osctimer I1 (.DYNOSCDIS(osc_dis), .TIMERRES(tmr_rst), .OSCOUT(osc_out), .TIMEROUT(tmr_out));

assign osc_dis = 0;
assign tmr_rst = 0;
assign gpio = 32'h55555555;

endmodule


module osctimer(DYNOSCDIS, TIMERRES, OSCOUT, TIMEROUT);

parameter TIMER_DIV = "128";

input DYNOSCDIS;
input TIMERRES;
output OSCOUT;
output TIMEROUT;

endmodule
