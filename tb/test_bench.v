module test_bench;

reg sys_clk;
reg sys_rst_n;
reg tim_psel;
reg tim_pwrite;
reg tim_penable;
reg [11:0] tim_paddr;
reg [31:0] tim_pwdata;
reg dbg_mode;
reg [3:0] tim_pstrb;

wire [31:0] tim_prdata;
wire tim_pready;
wire tim_int;
wire tim_pslverr;

timer_top dut (.*);

`include "run_test.v"

initial begin
	sys_clk = 0;
	forever #5 sys_clk = ~sys_clk;
end

initial begin
	sys_rst_n = 0;
	tim_psel = 0;
	tim_pwrite = 0;
	tim_penable = 0;
	tim_paddr = 12'h0;
	tim_pwdata = 0;
	dbg_mode = 0;
	tim_pstrb = 4'b0000;
	#20;
	sys_rst_n = 1;
end

task write;
		input [11:0] addr;
		input [31:0] data;
		input [3:0] pstrb;
	begin
		tim_psel = 1;
		tim_pwrite = 1;
		tim_paddr = addr;
		tim_pwdata = data;
		tim_pstrb = pstrb;
		@(posedge sys_clk);
		#1;
		tim_penable = 1;
		$display(" %t :Write Data = %h, Addr = %h ",$time, data, addr );
		repeat (2) @(posedge sys_clk);
		tim_penable = 0;
		tim_pwrite = 0;
	end
endtask

task read;
		input [11:0] addr;
	begin
		tim_psel = 1;
		tim_pwrite = 0;
		tim_paddr = addr;
		@(posedge sys_clk);
		#1;
		tim_penable = 1;
		repeat (2) @(posedge sys_clk);
		$display(" %t :Read Data = %h, Addr = %h",$time, tim_prdata, addr);

	end
endtask

		

initial begin
	#100;



	run_test();
	#100;
	$finish;
end

endmodule
