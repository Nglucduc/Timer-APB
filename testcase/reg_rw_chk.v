task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Test Register ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("===================Test RW chk  ====================");	
	$display("=============== READ WRITE CHECK ===============");	
	//////////////////////////// Test TCR  //////////////////////
	$display("============        Test TCR        ============");	
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
	// Test write read
	test_bench.write(12'h0,32'h0000_0000,4'b1111);
	#20;
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display("----------------------------------");	       
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h0,32'hFFFF_FFFF,4'b1111);
	#20;
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h0,32'h5555_5555,4'b1111);
	#20;
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0501) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0501	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h0,32'haaaa_aaaa,4'b1111);
	#20;
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0501) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0501	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h0,32'h5aa5_a55a,4'b1111);
	#20;
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0501) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0501	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.write(12'h0,32'h0000_0000,4'hf);
	#100;

	////////////////////////// Test TDR ////////////////////////

	$display("============== Test TDR0  ================");	
	#100;
	test_bench.write(12'h4,32'h0000_0000,4'b1111);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h4,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h4,32'h5555_5555,4'b1111);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h4,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'haaaa_aaaa) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'haaaa_aaaa	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h4,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h5aa5_a55a) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5aa5_a55a	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TDR1  ================");	
	#100;
	test_bench.write(12'h8,32'h0000_0000,4'b1111);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h8,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h8,32'h5555_5555,4'b1111);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h8,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'haaaa_aaaa) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'haaaa_aaaa	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h8,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h5aa5_a55a) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5aa5_a55a	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	///////////////////// Test TCMP //////////////////////////

	$display("============== Test TCMP0  ================");	
	#100;
	test_bench.write(12'hc,32'h0000_0000,4'b1111);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'hc,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'hc,32'h5555_5555,4'b1111);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'hc,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'haaaa_aaaa) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'haaaa_aaaa	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'hc,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h5aa5_a55a) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5aa5_a55a	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TCMP1  ================");	
	#100;
	test_bench.write(12'h10,32'h0000_0000,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'h5555_5555,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'haaaa_aaaa) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'haaaa_aaaa	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h5aa5_a55a) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5aa5_a55a	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	//////////////////////// Test TIER //////////////////

	$display("============== Test TIER  ================");	
	#100;
	test_bench.write(12'h14,32'h0000_0000,4'b1111);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h14,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h14,32'h5555_5555,4'b1111);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h14,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h14,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	/////////////////////// Test TISR ////////////////////

	$display("============== Test TISR  ================");	
	#100;
	test_bench.write(12'h18,32'h0000_0001,4'b1111);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h18,32'h0000_0000,4'b1111);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'hffff_ffff) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'h5555_5555,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'haaaa_aaaa) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'haaaa_aaaa	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h10,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h5aa5_a55a) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h5aa5_a55a	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	/////////////////////// Test THCSR ///////////////////

	$display("============== Test THCSR  ================");	
	#100;
	test_bench.write(12'h1c,32'h0000_0000,4'b1111);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h1c,32'hFFFF_FFFF,4'b1111);
       	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h", test_bench.tim_prdata);
	       	$display("-------------------------------------------------------");
       	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h1c,32'h5555_5555,4'b1111);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h1c,32'haaaa_aaaa,4'b1111);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h1c,32'h5aa5_a55a,4'b1111);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	///////////////////// Check all REG /////////////////////

	$display("============== Test ALL REG reset  ================");	
	#10;
	test_bench.sys_rst_n = 1'b0;
	$display("============== Test TCR reset  ================");	
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0100) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TDR0 reset  ================");	
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TDR1 reset  ================");	
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TCMP0 reset  ================");	
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'hFFFF_FFFF) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TCMP1 reset  ================");	
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'hFFFF_FFFF) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'hFFFF_FFFF	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TIER reset  ================");	
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test TISR reset  ================");	
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("============== Test THCSR reset  ================");	
	test_bench.read(12'h1C);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t :Check write read PASSED", $time); pass_cnt = pass_cnt +1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check write read FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	if (pass_cnt == 50)  begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
