module mimas (gpio);

output [31:0] gpio;

wire [31:0] gpio;
reg [31:0] sreg;
wire osc_dis, tmr_rst, clk, tmr_clk;
reg rstn;

defparam I1.TIMER_DIV = "1048576";
osctimer I1 (.DYNOSCDIS(osc_dis), .TIMERRES(tmr_rst), .OSCOUT(clk), .TIMEROUT(tmr_clk));

assign osc_dis = 0;
assign tmr_rst = 0;

always @ (posedge tmr_clk or negedge rstn) 
begin
	if (rstn == 0) begin
		sreg <= 32'hFFFF_FFFE;
	end else begin
		sreg <= sreg << 1;
		sreg[0] <= sreg[31];
	end
end

assign gpio = sreg;

always @ (posedge tmr_clk)
begin
	rstn <= 1;
end

endmodule

// ======================= //

module osctimer(DYNOSCDIS, TIMERRES, OSCOUT, TIMEROUT);

parameter TIMER_DIV = "1048576";

input DYNOSCDIS;
input TIMERRES;
output OSCOUT;
output TIMEROUT;

endmodule
