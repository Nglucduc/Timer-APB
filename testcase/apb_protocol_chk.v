task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Check APB Protocol  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Normal APB  =========");
	test_bench.write(12'h4,32'hffff_ffff,4'hf);

	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check APB  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	

	$display("========== wrong write APB  =========");
	
	test_bench.tim_pwrite = 1;
	test_bench.tim_paddr = 12'hc;
	test_bench.tim_pwdata = 32'haaaa_aaaa;
	test_bench.tim_pstrb = 4'hf;
	test_bench.tim_psel = 1;
	test_bench.tim_penable = 0;
	$display("Write with penable = 0 at %h, Data = %h", test_bench.tim_paddr, test_bench.tim_pwdata);
	repeat(2) @(posedge test_bench.sys_clk);
	test_bench.tim_pwrite = 0;

	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check APB  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	
	$display("========== wrong write APB  =========");
	
	test_bench.tim_pwrite = 1;
	test_bench.tim_paddr = 12'hc;
	test_bench.tim_pwdata = 32'haaaa_aaaa;
	test_bench.tim_pstrb = 4'hf;
	test_bench.tim_psel = 0;
	#1;
	test_bench.tim_penable = 1;
	$display("Write with psel = 0 at %h, Data = %h", test_bench.tim_paddr, test_bench.tim_pwdata);
	repeat(2) @(posedge test_bench.sys_clk);
	test_bench.tim_penable = 0;
	test_bench.tim_pwrite = 0;

	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check APB  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	



	if ( pass_cnt == 3 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
