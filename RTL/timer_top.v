module timer_top (
   input wire sys_clk,
   input wire sys_rst_n,
   input wire tim_psel,
   input wire tim_penable,
   input wire tim_pwrite,
   input wire [11:0] tim_paddr,
   input wire [31:0] tim_pwdata,
   input wire [3:0] tim_pstrb,
   input wire dbg_mode,
   output wire [31:0] tim_prdata,
   output wire tim_pready,
   output wire tim_pslverr,
   output wire tim_int
);

wire wr_en_d, rd_en_d;
wire [63:0] cnt_value_d;
wire div_en_d, timer_en_d;
wire [3:0] div_val_d;
wire cnt_en_d;
wire halt_req_d, halt_ack_d;
wire halt_en;
wire tdr0_wr_sel_d, tdr1_wr_sel_d;
wire [31:0] tdr0_d, tdr1_d;

APB_slave dut_APB_slave(
	.clk(sys_clk),
	.rst_n(sys_rst_n),
	.penable(tim_penable),
	.psel(tim_psel),
	.pwrite(tim_pwrite),
	//.paddr(tim_paddr),
	//.pwdata(tim_pwdata),
	.pready(tim_pready),
	.rd_en(rd_en_d),
	.wr_en(wr_en_d)
);

counter dut_counter(
	.clk(sys_clk),
	.rst_n(sys_rst_n),
	.timer_en(timer_en_d),
	.cnt_en(cnt_en_d),
	.tdr0_wr_sel(tdr0_wr_sel_d),
	.tdr1_wr_sel(tdr1_wr_sel_d),
	.tdr0(tdr0_d),
	.tdr1(tdr1_d),
	.halt_en(halt_en),
	.cnt(cnt_value_d)
);

counter_control dut_counter_control(
	.clk(sys_clk),
	.rst_n(sys_rst_n),
	.div_en(div_en_d),
	.div_val(div_val_d),
	.cnt_en(cnt_en_d),
	.tim_int(tim_int),
	.timer_en(timer_en_d),
	.halt_req(halt_req_d),
	.dbg_mode(dbg_mode),
	.halt_ack(halt_ack_d),
	.halt_en(halt_en)
);

register dut_register(
	.clk(sys_clk),
	.rst_n(sys_rst_n),
	.pstrb(tim_pstrb),
	.addr(tim_paddr),
	.wdata(tim_pwdata),
	.wr_en(wr_en_d),
	.rd_en(rd_en_d),
	.cnt_value(cnt_value_d),
	.halt_ack(halt_ack_d),
	.pready(tim_pready),
	.rdata(tim_prdata),
	.div_val(div_val_d),
	.div_en(div_en_d),
	.timer_en(timer_en_d),
	.tdr0_wr_sel(tdr0_wr_sel_d),
	.tdr1_wr_sel(tdr1_wr_sel_d),
	.timer_int(tim_int),
	.TDR0(tdr0_d),
	.TDR1(tdr1_d),
	.halt_req(halt_req_d),
	.pslverr(tim_pslverr)
);

endmodule
