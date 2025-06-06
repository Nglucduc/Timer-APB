task run_test();
	integer pass_cnt;
	reg [31:0] save_cnt;
       begin
	pass_cnt = 0;
	save_cnt = 32'h0;
	    $display("======================================");	
  	    $display("============Check Halt counting ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check control all mode =========");
	test_bench.write(12'h0,32'h0000_0102,4'hf);
	test_bench.write(12'h0,32'h0000_0103,4'hf);
	test_bench.dbg_mode = 1'b1;

	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);
	test_bench.write(12'h1c,32'h0000_0001,4'h1);
	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);
	test_bench.read(12'h1C);

	if (test_bench.tim_prdata == 32'h0000_0003) begin
		$display(" %t :  Check halt_ack  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check halt_ack FAILED", $time); 
		$display("Exp: 32'h0000_0003	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.read(12'h4);
	save_cnt = test_bench.tim_prdata;
	$display("Waiting 1 CLK");
	 @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == save_cnt) begin
		$display(" %t :  Check halt cnt  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check halt cnt FAILED", $time); 
		$display("Exp: cnt > %h	Actual: %h  ",save_cnt, test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);
	$display(" Set halt_req = 0");
	test_bench.write(12'h1c,32'h0000_0000,4'h1);
	$display("Waiting 2 CLK");
	repeat (2) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == save_cnt + 2) begin
		$display(" %t :  Cnt is counting normal  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Cnt is wrong FAILED", $time); 
		$display("Exp: cnt = %h	Actual: %h  ",save_cnt + 2, test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Debug mode = 0  =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	$display("Timer en = 1, Waiting 20 CLK");
	repeat (20) @(posedge test_bench.sys_clk);
	$display(" halt_req = 1");
	
	test_bench.write(12'h1c,32'h0000_0001,4'h1);
	test_bench.dbg_mode = 1'b0;
	test_bench.read(12'h4);

	save_cnt = test_bench.tim_prdata;
	$display(" Waiting 20 CLK");
	repeat (20) @(posedge test_bench.sys_clk);
	
	if (test_bench.tim_prdata != save_cnt ) begin
		$display(" %t :  Cnt is counting normal  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Cnt is wrong FAILED", $time); 
		$display("Exp: cnt > %h	Actual: %h  ",save_cnt , test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	




	if ( pass_cnt == 4 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
