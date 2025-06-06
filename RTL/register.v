module register(
	input wire rd_en,wr_en,
	input wire clk,
	input wire pready,
	input wire rst_n,
	input wire [31:0] wdata,
	input wire [3:0] pstrb,
	input wire [11:0] addr,
	input wire halt_ack,
	input wire [63:0] cnt_value,
	
	output wire [31:0] rdata,
	output reg div_en, timer_en,
	output reg [3:0] div_val,
	output wire pslverr, 
	output reg halt_req,
	output reg [31:0] TDR0, TDR1,
	output wire tdr0_wr_sel,tdr1_wr_sel,
	output wire timer_int
);

reg int_en;
reg int_st;

parameter TCR_ADD 	= 12'h0;
parameter TDR0_ADD 	= 12'h4;
parameter TDR1_ADD 	= 12'h8;
parameter TCMP0_ADD 	= 12'hC;
parameter TCMP1_ADD 	= 12'h10;
parameter TIER_ADD 	= 12'h14;
parameter TISR_ADD 	= 12'h18;
parameter THCSR_ADD 	= 12'h1C;

reg [31:0] TCR, TCMP0, TCMP1;
wire [31:0] TISR, THCSR, TIER;

wire tcr_wr_sel, tcmp0_wr_sel, tcmp1_wr_sel, tier_wr_sel, tisr_wr_sel, thcsr_wr_sel;
assign tcr_wr_sel	= wr_en  & (addr == TCR_ADD);
assign tdr0_wr_sel	= wr_en  & (addr == TDR0_ADD);
assign tdr1_wr_sel 	= wr_en  & (addr == TDR1_ADD);
assign tcmp0_wr_sel 	= wr_en  & (addr == TCMP0_ADD);
assign tcmp1_wr_sel 	= wr_en  & (addr == TCMP1_ADD);
assign tier_wr_sel 	= wr_en  & (addr == TIER_ADD);
assign tisr_wr_sel 	= wr_en  & (addr == TISR_ADD);
assign thcsr_wr_sel 	= wr_en  & (addr == THCSR_ADD);

//////////////////////////////// TCR ///////////////////////

assign tcr_wr_sel_check = tcr_wr_sel & !pslverr;

always@(posedge clk or negedge rst_n ) begin
	if (!rst_n) begin
		timer_en <= 1'b0;
		div_en <= 1'b0;
		div_val <= 4'b0001;
		TCR = {20'h0,div_val,6'h0,div_en, timer_en};
	end else if (tcr_wr_sel_check) begin
		if (pstrb[0] ) begin
			timer_en <= wdata[0];
			div_en <= wdata[1];
		end
		div_val <= (pstrb[1] ? wdata[11:8] : div_val);
	end else
		TCR = {20'h0,div_val,6'h0,div_en, timer_en};
end


/////////////////////////// TDR //////////////////////////

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		TDR0 <= 32'h0000_0000;
		TDR1 <= 32'h0000_0000;
	end 
	else begin
	TDR0[7:0] 	<= (tdr0_wr_sel& pstrb[0]) ? wdata[7:0]  	: cnt_value[7:0];
	TDR0[15:8] 	<= (tdr0_wr_sel& pstrb[1]) ? wdata[15:8] 	: cnt_value[15:8];
	TDR0[23:16] 	<= (tdr0_wr_sel& pstrb[2]) ? wdata[23:16] 	: cnt_value[23:16];
	TDR0[31:24] 	<= (tdr0_wr_sel& pstrb[3]) ? wdata[31:24] 	: cnt_value[31:24];

	TDR1[7:0] 	<= (tdr1_wr_sel& pstrb[0]) ? wdata[7:0]  	: cnt_value[39:32];
	TDR1[15:8] 	<= (tdr1_wr_sel& pstrb[1]) ? wdata[15:8] 	: cnt_value[47:40];
	TDR1[23:16] 	<= (tdr1_wr_sel& pstrb[2]) ? wdata[23:16] 	: cnt_value[55:48];
	TDR1[31:24] 	<= (tdr1_wr_sel& pstrb[3]) ? wdata[31:24] 	: cnt_value[63:56];
	end
end

////////////////////// TCMP0 - TCMP1 /////////////////

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		TCMP0 <= 32'hFFFF_FFFF;
		TCMP1 <= 32'hFFFF_FFFF;
	end
	else begin 
	TCMP0[7:0] 	<= (tcmp0_wr_sel & pstrb[0]) ? wdata[7:0] 	: TCMP0[7:0];
	TCMP0[15:8] 	<= (tcmp0_wr_sel & pstrb[1]) ? wdata[15:8] 	: TCMP0[15:8];
	TCMP0[23:16] 	<= (tcmp0_wr_sel & pstrb[2]) ? wdata[23:16] 	: TCMP0[23:16];
	TCMP0[31:24] 	<= (tcmp0_wr_sel & pstrb[3]) ? wdata[31:24] 	: TCMP0[31:24];

	TCMP1[7:0] 	<= (tcmp1_wr_sel & pstrb[0]) ? wdata[7:0] 	: TCMP1[7:0];
	TCMP1[15:8] 	<= (tcmp1_wr_sel & pstrb[1]) ? wdata[15:8] 	: TCMP1[15:8];
	TCMP1[23:16] 	<= (tcmp1_wr_sel & pstrb[2]) ? wdata[23:16] 	: TCMP1[23:16];
	TCMP1[31:24] 	<= (tcmp1_wr_sel & pstrb[3]) ? wdata[31:24] 	: TCMP1[31:24];
	end
end


//////////////////// TIER ////////////////////////
always @(posedge clk or negedge rst_n) begin 
	if (!rst_n) begin
		int_en <= 1'b0;
	end else if (tier_wr_sel) begin 
		int_en <= pstrb[0] ? wdata[0] : int_en;
	end
end
assign TIER = ({31'h0, int_en});
////////////////// TISR ////////////////////////
wire int_st_set;
wire int_st_clear;
wire [63:0] counter, compare;
assign counter = {TDR1, TDR0};
assign compare = {TCMP1, TCMP0};
assign int_st_clear	= (tisr_wr_sel && pstrb[0] && wdata[0]);
assign int_st_set 	= (counter == compare);
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		int_st <= 1'b0;
	end else if (int_st_clear) begin
		int_st <= 1'b0;
	end else if (int_st_set) begin
		int_st <= 1'b1;
	end else begin
		int_st <= int_st;
	end
end

assign TISR =  ({31'h0, int_st}) ;
assign timer_int = int_st && int_en;
//////////////// THCSR ////////////////////
wire halt_req_pre;
assign halt_req_pre = (thcsr_wr_sel & pstrb [0]) ? wdata[0] : halt_req;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		halt_req <= 1'b0;
	end else begin
		halt_req <= halt_req_pre;
	end
end

assign THCSR =  ({ 30'h0, halt_ack, halt_req});

////////////// Halding Error///////////////

assign pslverr = (tcr_wr_sel & ((pstrb[1] & (wdata[11:8] > 4'd8)) || (pstrb[0] & (timer_en & (wdata[1] != div_en))) || (pstrb[1] & timer_en & (wdata[11:8] != div_val))));


/////////////  Read Register/////////////// 
reg [31:0] rd;
always @(*) begin
	if (rd_en ) begin
		case (addr)
			TCR_ADD 	: rd = TCR;
			TDR0_ADD	: rd = TDR0;
			TDR1_ADD	: rd = TDR1;
			TCMP0_ADD	: rd = TCMP0;
			TCMP1_ADD	: rd = TCMP1;
			TIER_ADD 	: rd = TIER;
			TISR_ADD	: rd = TISR;
			THCSR_ADD 	: rd = THCSR;
			default: rd = 32'h0;
		endcase
	end else begin
		rd = 32'h0;
	end
end


assign rdata = rd;
endmodule
