task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============  APB read write check  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Pready is not high when penable High  =========");

	test_bench.tim_penable = 1;
	@(posedge test_bench.sys_clk);

	if (test_bench.tim_pready == 32'h0000_0000) begin
		$display(" %t :  Check Pready  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pready FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_pready);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Write wrong div_val  =========");
	test_bench.write(12'h0, 32'h0000_0900,4'hf);
		
	if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0a00,4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0b00, 4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0c00, 4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0d00,4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0e00,4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
		
	test_bench.write(12'h0, 32'h0000_0f00, 4'hf);
		if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	test_bench.write(12'h0, 32'h0000_0800,4'hf);
		if (test_bench.tim_pslverr== 32'h0000_0000) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0800) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0800	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	
	$display("-----Write div_val and div_en when timer_en High ----------------");
	test_bench.write(12'h0, 32'h0000_0001,4'hf);
	
	if (test_bench.tim_pslverr == 32'h0000_0000) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	#100;
		test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;


	test_bench.write(12'h0, 32'h0000_0103, 4'hf);
	if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	#100;
		test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;

	test_bench.write(12'h0, 32'h0000_0100, 4'hf);
	if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
		test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;

	test_bench.write(12'h0, 32'h0000_0002, 4'hf);
	if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
		test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check TCR  PASSED: exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check TCR FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;
	

	$display(" -----------Check Pslverr and Pready--------------");
	
	test_bench.write(12'h0, 32'h0000_000a, 4'hf);
	if (test_bench.tim_pslverr == 32'h0000_0001) begin
		$display(" %t :  Check Pslverr  PASSED: exp value: %h ", $time, test_bench.tim_pslverr); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pslverr FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	if (test_bench.tim_pready == 32'h0000_0001) begin
		$display(" %t :  Check Pready  PASSED: exp value: %h ", $time, test_bench.tim_pready); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check Pready FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_pready);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_penable = 0;
	test_bench.tim_psel = 0;
	#100;







	if ( pass_cnt == 27 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
