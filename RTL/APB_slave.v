module APB_slave (
	input wire clk,
	input wire rst_n,
	input wire penable,
	input wire pwrite,psel,
	//input wire [31:0] pwdata,
	//input wire [11:0] paddr,
	output wire  pready,
	output wire rd_en,wr_en
);

assign wr_en = psel & penable & pwrite ;
assign rd_en = psel & penable & !pwrite;

reg pready_reg;

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) 
	begin
		pready_reg <= 1'b0;
	end else
	begin
		if (psel & penable) begin
		pready_reg <= 1'b1;
		end else begin
		pready_reg <= 1'b0;
		end
	end
end

assign pready = pready_reg && penable ;

endmodule

