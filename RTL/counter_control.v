module counter_control (
	input wire clk,
	input wire rst_n,
	input wire div_en,
	input wire timer_en,
	input wire halt_req,
	input wire dbg_mode,
	input wire tim_int,
	input wire [3:0] div_val,
	output wire cnt_en,
	output wire halt_en,
	output reg halt_ack
);
	reg [7:0] int_cnt;
	reg [7:0] limit;
	wire [7:0] int_cnt_pre;
	wire cnt_rst, int_cnt_condition;
assign cnt_rst = (~timer_en) | (~div_en) | ((int_cnt == limit) & (~halt_en));
assign halt_en = dbg_mode & halt_req;
assign cnt_en = (~halt_en) & ((timer_en & !div_en)) | (timer_en & div_val & (div_val == 4'b0000)) | (timer_en & div_en & (int_cnt == limit));
assign int_cnt_condition = (~halt_en) & (div_en & timer_en & (limit != 4'b0000));
assign int_cnt_pre = int_cnt_condition ? (int_cnt + 1) : int_cnt;

always @(*) begin
		case (div_val)
		       	4'b0000: limit = 8'd0;	
			4'b0001: limit = 8'd1;
			4'b0010: limit = 8'd3;
			4'b0011: limit = 8'd7;
			4'b0100: limit = 8'd15;
			4'b0101: limit = 8'd31;
			4'b0110: limit = 8'd63;
			4'b0111: limit = 8'd127;
			4'b1000: limit = 8'd255;
			default: limit = 8'd1;
		endcase
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		halt_ack <= 1'b0;
	end else begin
		halt_ack <= halt_en;
		end	

end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		int_cnt <= 8'b0;
	end else begin
		if (cnt_rst) begin
			int_cnt <= 8'b0;
		end else begin
			int_cnt <= int_cnt_pre;
		end
	end
end



endmodule
