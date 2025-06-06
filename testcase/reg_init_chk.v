task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Check Init Register  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("============  REG TCR   ============");	
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	$display("============  REG TDR0  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	$display("============  REG TDR1  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============  REG TCMP0  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'hFFFF_FFFF) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============  REG TCMP1 ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'hFFFF_FFFF) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============  REG TIER  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============  REG TISR  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============  REG THCSR  ============");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.read(12'h1C);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check default PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t :Check default value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	

	if (pass_cnt == 8) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end






    end


endtask
