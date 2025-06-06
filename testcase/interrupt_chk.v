task run_test();
	integer pass_cnt;
       begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============= Interrupt Check  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Set Interrut Asserted =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h4,32'h0000_fff0,4'hf);
	test_bench.write(12'hc,32'h0001_0000,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== System reset  =========");
	
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	$display("========== Set Interrut Asserted =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h4,32'h0000_fff0,4'hf);
	test_bench.write(12'hc,32'h0001_0000,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);


	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted Normal PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	$display("========== Inpterrupt spending  =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'hc,32'h0001_00ff,4'hf);
	
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Check tim_int PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
		test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Clear Interrut  =========");
	
	$display("========== Set Interrut Asserted =========");
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'hc,32'h0000_00ff,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	if (test_bench.tim_int == 32'h0000_0000) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
		
	test_bench.write(12'h18,32'h0000_0000,4'hf);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Clear tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Clear tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
		
	test_bench.write(12'h18,32'h0000_0001,4'hf);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Clear tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Clear tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Max value =========");
	
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h4,32'hffff_ffff,4'hf);
	test_bench.write(12'h8,32'hffff_ffff,4'hf);
	if (test_bench.tim_int == 32'h0000_0000) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
		
	$display("========== Set interrupt enable =========");
	
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'hc,32'h0000_00ff,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
		
	$display("========== Set interrupt and clear  =========");
	
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'hc,32'h0000_00ff,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end

	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.write(12'h18,32'h0000_0000,4'hf);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Clear tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Clear tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
		
	test_bench.write(12'h18,32'h0000_0001,4'hf);
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin
		$display(" %t :  Clear tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Clear tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	if (test_bench.tim_int == 32'h0000_0000) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Max value =========");
	
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'h4,32'hffff_ffff,4'hf);
	test_bench.write(12'h8,32'hffff_ffff,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	
	$display("========== Mask condition =========");
	
	test_bench.write(12'h0,32'h0000_0001,4'hf);
	test_bench.write(12'hc,32'h0000_00ff,4'hf);
	test_bench.write(12'h10,32'h0000_0000,4'hf);
	test_bench.write(12'h14,32'h0000_0001,4'hf);
	$display("========== waiting 256 clk =========");
	repeat(256) @(posedge test_bench.sys_clk);
	
	if (test_bench.tim_int == 32'h0000_0001) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	test_bench.write(12'h14,32'h0000_0000,4'hf);
	
	if (test_bench.tim_int == 32'h0000_0000) begin
		$display(" %t :  Check tim_int  PASSED: cnt is exp value: %h ", $time, test_bench.tim_int); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int FAILED", $time); 
		$display("Exp: 32'h0000_0000	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0001) begin
		$display(" %t :  Check tim_int is Asserted PASSED: cnt is exp value: %h ", $time, test_bench.tim_prdata); pass_cnt = pass_cnt + 1;
		$display("-------------------------------------------------------");	
	end else begin
		$display(" %t : Check tim_int is Asserted FAILED", $time); 
		$display("Exp: 32'h0000_0001	Actual: %h  ", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;
	






	if ( pass_cnt == 23) begin
		$display(" Test result PASSED");
		$display("------------------------------------");
	end
	else begin
		$display(" Test result FAILED");
		$display("------------------------------------");
	end







    end


endtask
