task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============Check CNT COUNTING ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check counting bounddary at TDR0 =========");
	test_bench.write(12'h4,32'hFFFF_FF00,4'hf);
	test_bench.write(12'h8,32'h0000_0000,4'hf);
	test_bench.write(12'h0,32'h0000_0001, 4'hf);
	$display("Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h8);

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
	
	test_bench.read(12'h4);

	if (test_bench.tim_prdata <= 32'h0000_0010) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt < 32'h0000_0010	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check counting bounddary at TDR0 =========");
	test_bench.write(12'h4,32'hFFFF_FF00,4'hf);
	test_bench.write(12'h8,32'hFFFF_FFFF,4'hf);
	test_bench.write(12'h0,32'h0000_0001, 4'hf);
	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h8);

	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	
	test_bench.read(12'h4);

	if (test_bench.tim_prdata <= 32'h0000_0010) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt < 32'h0000_0010	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	/////////////////////// Check counting boundary TDR0/1/////////////
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Check counting boundary at TDR0/TDR1 ===========");
	test_bench.write(12'h4,32'hFFFF_FF00,4'hf);
	test_bench.write(12'h8,32'hFFFF_FFFF,4'hf);
	test_bench.write(12'h0,32'h0000_0001, 4'hf);
	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h8);

	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	
	test_bench.read(12'h4);

	if (test_bench.tim_prdata <= 32'h0000_0010) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt < 32'h0000_0010	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	////////////////////////// Update when counting/////////////////

	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
 	$display("========== Update TDR0/TDR1 when counting ===========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);

	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	test_bench.read(12'h8);

	test_bench.write(12'h4,32'hFFFF_FF00,4'hf);
	test_bench.write(12'h8,32'h0000_0000, 4'hf);

	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata <= 32'h0000_0010) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt <  32'h0000_0010	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;

	test_bench.read(12'h8);

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
	#100;
	
	///////////////////// Timer_en High -> Low ///////////////////
	
	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
 	$display("========== Reset Timer_en H-> L  ===========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);

	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);

	test_bench.write(12'h0,32'h0000_0000,4'hf);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;

	///////////////////// Timer_en High -> Low and can set TDR0/1   ///////////////////
	
	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
 	$display("========== Reset Timer_en H-> L  ===========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);

	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);

	test_bench.write(12'h0,32'h0000_0000,4'hf);
	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	////// write to TDR
	test_bench.write(12'h4,32'h1234_5678,4'hf);
	#100;
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h1234_5678) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h1234_5678	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.write(12'h8,32'h1234_5678,4'hf);
	#100;
	test_bench.read(12'h8);

	if (test_bench.tim_prdata == 32'h1234_5678) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h1234_5678	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	///////////////////// Timer_en High -> Low change Div_en, div_val -> counting normal   ///////////////////
	
	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
 	$display("========== Reset Timer_en H-> L Change div_en div_val -> counting ===========");
	test_bench.write(12'h0,32'h0000_0000,4'hf);

	$display(" Waiting 256 CLK");
	repeat (256) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;

	////////////////// SET overflow ///////////////
	
	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
 	$display("========== Set Overflow  TDR0  ===========");
	test_bench.write(12'h4, 32'hFFFF_FFF0,4'hf);
	test_bench.write(12'h0, 32'h0000_0003,4'hf);

	$display(" Waiting 16 CLK");
	repeat (16) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0002) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0002	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;

	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;
	test_bench.sys_rst_n = 0;
	#10;
	test_bench.sys_rst_n = 1;
	#10;
	test_bench.write(12'h0,32'h0000_0000,4'hf);
	#100;
	$display("========== Set Overflow  TDR1  ===========");
	test_bench.write(12'h4, 32'hFFFF_FFF0,4'hf);
	test_bench.write(12'h8, 32'hFFFF_FFFF,4'hf);
	test_bench.write(12'h0, 32'h0000_0003,4'hf);

	$display(" Waiting 16 CLK");
	repeat (16) @(posedge test_bench.sys_clk);

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h0000_0002) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0002	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;

	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp:cnt = 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#10;




	if ( pass_cnt == 17 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
