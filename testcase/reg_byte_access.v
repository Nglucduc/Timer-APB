task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Test REG BYTE ACCESS ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;

	/////////////////// REG TCR/////////////////

	$display("============  REG TCR   ============");	
	test_bench.write(12'h0,32'hFFFF_FFFF, 4'h1);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0103) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0103	Actual: %h Pslverr = %h ", test_bench.tim_prdata,test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;


	test_bench.write(12'h0,32'hFFFF_F5FF, 4'h2);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0500) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0500	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;


	test_bench.write(12'h0,32'hFFFF_FFFF, 4'h4);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  Pslverr = %h", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;

	test_bench.write(12'h0,32'hFFFF_FFFF, 4'h8);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  Pslverr = %h", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;

	test_bench.write(12'h0,32'h5555_5555, 4'h3);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0501) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0501	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;

	test_bench.write(12'h0,32'hFFFF_FFFF, 4'hc);
	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	test_bench.write(12'h0,32'h0000_0000, 4'hf);
	#100;

	/////////////////////// REG TDR0 ///////////////////
	$display(" ============= REG TDR0 ============");
	test_bench.write(12'h4,32'h1111_1111, 4'h1);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0011) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0011	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h4,32'h2222_2222, 4'h2);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h4,32'h3333_3333, 4'h4);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0033_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0033_2211	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h4,32'h4444_4444, 4'h8);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h4433_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h4,32'h5555_5555, 4'h3);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h4433_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_5555	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h4,32'h6666_6666, 4'hc);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h6666_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h6666_5555	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG TDR1 ///////////////////
	$display("============= REG TDR1===============");
	test_bench.write(12'h8,32'h1111_1111, 4'h1);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0011) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0011	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h8,32'h2222_2222, 4'h2);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h8,32'h3333_3333, 4'h4);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0033_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0033_2211	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h8,32'h4444_4444, 4'h8);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h4433_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h8,32'h5555_5555, 4'h3);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h4433_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_5555	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h8,32'h6666_6666, 4'hc);
	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h6666_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h6666_5555	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG TCMP0  ///////////////////
	$display(" =========== REG TCMP0 === ===========");
	test_bench.write(12'hc,32'h0000_0000, 4'hf);
	#30;
	test_bench.write(12'h10,32'h0000_0000, 4'hf);
	#30;
	test_bench.write(12'hc,32'h1111_1111, 4'h1);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h0000_0011) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0011	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'hc,32'h2222_2222, 4'h2);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h0000_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'hc,32'h3333_3333, 4'h4);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h0033_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0033_2211	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'hc,32'h4444_4444, 4'h8);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h4433_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'hc,32'h5555_5555, 4'h3);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h4433_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_5555	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'hc,32'h6666_6666, 4'hc);
	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h6666_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h6666_5555	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG TCMP1  ///////////////////
	$display(" =========== REG TCMP1 === ===========");
	test_bench.write(12'h10,32'h1111_1111, 4'h1);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h0000_0011) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0011	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'h2222_2222, 4'h2);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h0000_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'h3333_3333, 4'h4);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h0033_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0033_2211	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'h4444_4444, 4'h8);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h4433_2211) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_2211	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'h5555_5555, 4'h3);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h4433_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h4433_5555	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h10,32'h6666_6666, 4'hc);
	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h6666_5555) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h6666_5555	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG TIER  ///////////////////
	$display(" =========== REG TIER  ==============");
	test_bench.write(12'h14,32'h1111_1111, 4'h1);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h14,32'h2222_2222, 4'h2);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h14,32'h3333_3333, 4'h4);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h14,32'h4444_4444, 4'h8);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h14,32'h6666_6666, 4'h3);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h14,32'h7777_7777, 4'hc);
	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		if (test_bench.tim_pslverr == 0) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
			end
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG TISR  ///////////////////
	
	$display(" =========== REG TISR  ==============");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	#30;
	test_bench.write(12'h4,32'h0000_ffff,4'hf);
	#30;
	test_bench.write(12'h0c,32'h0001_0005,4'h1);
	#30;
	test_bench.write(12'h14,32'h0000_0001,4'h1);
	#100;
	test_bench.write(12'h18,32'hFFFF_FFFF, 4'h2);
	test_bench.read(12'h18);
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h18,32'hFFFF_FFFF, 4'h4);
	test_bench.read(12'h18);
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h18,32'hFFFF_FFFF, 4'h8);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h18,32'hFFFF_FFFF, 4'hC);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h18,32'h0000_0001, 4'h1);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	#30;
	test_bench.write(12'h4,32'h0000_ffff,4'hf);
	#30;
	test_bench.write(12'h0c,32'h0001_0005,4'h1);
	#30;
	test_bench.write(12'h14,32'h0000_0001,4'h1);
	#100;
	
	test_bench.write(12'h18,32'h0000_0001, 4'h1);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h tim_int = %h ", test_bench.tim_prdata, test_bench.tim_int);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	/////////////////////// REG THCSR  ///////////////////
	$display(" =========== REG THCSR  ==============");
	test_bench.write(12'h1c,32'h1111_1111, 4'h1);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#1000;

	test_bench.write(12'h1c,32'h2222_2222, 4'h2);
	#30;
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h1c,32'h3333_3333, 4'h4);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h1c,32'h4444_4444, 4'h8);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h1c,32'h6666_6666, 4'h3);
	#10;
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.write(12'h1c,32'h7777_7777, 4'hc);
	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check byte access  PASSED", $time); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check byte access value Failed", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h Pslverr = %h ", test_bench.tim_prdata, test_bench.tim_pslverr);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;


	if ( pass_cnt == 48 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED, Passed is %d",pass_cnt);
		$display("------------------------------------");
	end







    end


endtask
