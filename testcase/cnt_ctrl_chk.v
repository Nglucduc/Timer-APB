task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============ CNT Ctrl Check============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check default  mode =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0200) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0200	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Check control  mode =========");
	$display("========== div val = 0 =========");

	test_bench.write(12'h0,32'h0000_0003,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0200) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0200	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 1 =========");
	test_bench.write(12'h0,32'h0000_0103,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0100) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0100	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 2 =========");
	test_bench.write(12'h0,32'h0000_0203,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0080) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0080	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 3 =========");
	test_bench.write(12'h0,32'h0000_0303,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0040) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0040	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 4 =========");
	test_bench.write(12'h0,32'h0000_0403,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0020) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0020	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 5 =========");
	test_bench.write(12'h0,32'h0000_0503,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0010) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0010	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 6 =========");
	test_bench.write(12'h0,32'h0000_0603,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0008) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0008	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 7 =========");
	test_bench.write(12'h0,32'h0000_0703,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0004) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0004	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== div val = 8 =========");
	test_bench.write(12'h0,32'h0000_0803,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0002) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0002	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== det div_val but not set div_en  =========");
	test_bench.write(12'h0,32'h0000_0201,4'hf);
	$display("Waiting 510 CLK");
	repeat (510) @(posedge test_bench.sys_clk);
	test_bench.read(12'h4);

	if (test_bench.tim_prdata == 32'h0000_0200) begin
		$display(" %t :  Check counting  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check counting FAILED", $time); 
		$display("Exp: 32'h0000_0200	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	if ( pass_cnt == 11 ) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
