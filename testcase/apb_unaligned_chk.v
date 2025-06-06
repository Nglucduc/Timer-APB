task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Check APB Unaligned  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	test_bench.write(12'h4,32'hffff_ffff,4'hf);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check rw PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check rw FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("========== Un-aligned offset 0x1 =========");
	test_bench.write(12'h5,32'h55555_5555,4'hf);

	test_bench.read(12'h5);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check Unaligned APB PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB Unaligned FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check rw PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check rw FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
		
	$display("========== Un-aligned offset 0x2 =========");
	test_bench.write(12'h6,32'h55555_5555,4'hf);

	test_bench.read(12'h6);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check Unaligned APB PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB Unaligned FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check rw PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check rw FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("========== Un-aligned offset 0x3 =========");
	test_bench.write(12'h7,32'h55555_5555,4'hf);

	test_bench.read(12'h7);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check Unaligned APB PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check APB Unaligned FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin
		$display(" %t :  Check rw PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check rw FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	



	if ( pass_cnt == 7 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
