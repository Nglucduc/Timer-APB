task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Cnt Control chk  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check control all mode =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h0,32'h0000_0000,4'hf);
	test_bench.write(12'h0,32'h0000_0001, 4'hf);
	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0102) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0102	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	


	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#30;
	test_bench.write(12'h0,32'h0000_0802, 4'hf);
	test_bench.write(12'h0,32'h0000_0803, 4'hf);

	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);
	
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	
	



	if ( pass_cnt == 2 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
