task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Check Reserved ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("============ Write Read into  REG 0x4000_1FFC   ============");	
	test_bench.write(32'h4000_1FFC, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h4000_1FFC);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	$display("============ Write Read into  REG 0x4000_0020   ============");	
	test_bench.write(32'h4000_0020, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h4000_0020);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	$display("============ Write Read into  REG 0x0000_0040   ============");	
	test_bench.write(32'h0000_0040, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0040);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	$display("============ Write Read into  REG 0x0000_0080   ============");	
	test_bench.write(32'h0000_0080, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0080);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	$display("============ Write Read into  REG 0x0000_0100   ============");	
	test_bench.write(32'h0000_0100, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0100);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	$display("============ Write Read into  REG 0x0000_0200   ============");	
	test_bench.write(32'h0000_0200, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0200);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	$display("============ Write Read into  REG 0x0000_0400   ============");	
	test_bench.write(32'h0000_0400, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0400);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	$display("============ Write Read into  REG 0x0000_0800   ============");	
	test_bench.write(32'h0000_0800, 32'hFFFF_FFFF, 4'hf);
	#100;
	test_bench.read(32'h0000_0800);
	if (test_bench.tim_prdata == 32'h0) begin
		$display(" %t Check Reserved PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------");
	end else begin 
		$display(" %t Check Reserved FAILED", $time);
		$display(" Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	if (pass_cnt == 8)  begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end






    end


endtask
