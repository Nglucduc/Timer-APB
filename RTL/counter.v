module counter(
	input wire clk,
	input wire rst_n,
	input wire cnt_en,
	input wire halt_en,
	input wire timer_en,
	input wire [31:0] tdr0,tdr1,
	input wire tdr0_wr_sel,tdr1_wr_sel,
	output reg [63:0] cnt
);
wire pulse;
reg timer_en_pre;
reg tdr0_sel, tdr1_sel; 

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		timer_en_pre <= 1'b0;
	end else 
		timer_en_pre <= timer_en;
end

assign pulse = !timer_en && timer_en_pre;

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		tdr0_sel <= 1'b0;
		tdr1_sel <= 1'b0;
	end else begin
		tdr0_sel <= tdr0_wr_sel;
		tdr1_sel <= tdr1_wr_sel;
	end
end

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		cnt <= 64'h0;
	end else begin
		 if (pulse) begin
		cnt <= 64'h0;
	end else if (tdr0_sel) begin
		cnt[31:0] <= tdr0;
	end else if (tdr1_sel) begin
		cnt[63:32] <= tdr1;
	end else if (halt_en) begin
		cnt <= cnt;
	end else if (cnt_en) begin
		cnt <= cnt + 1;
	end else cnt <= cnt;
	end
	
end

endmodule

