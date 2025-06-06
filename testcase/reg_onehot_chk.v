task run_test();      
	integer pass_cnt;
	begin
	pass_cnt = 0;
	    $display("======================================");	
  	    $display("============ Check ONE HOT  ============");
  	    $display("======================================");	
	test_bench.sys_rst_n = 1'b0;
	#10;
	test_bench.sys_rst_n = 1'b1;
	#10;
	test_bench.write(12'h18,32'h1111_1111, 4'hf);
	test_bench.write(12'h0,32'h2222_2222, 4'hf);
	test_bench.write(12'h4,32'h3333_3333, 4'hf);
	test_bench.write(12'h8,32'h4444_4444, 4'hf);
	test_bench.write(12'hc,32'h5555_5555, 4'hf);
	test_bench.write(12'h10,32'h6666_6666, 4'hf);
	test_bench.write(12'h14,32'h7777_7777, 4'hf);
	test_bench.write(12'h18,32'h8888_8888, 4'hf);


	test_bench.read(12'h18);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h0);
	if (test_bench.tim_prdata == 32'h0000_0202) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h0000_0202	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h4);
	if (test_bench.tim_prdata == 32'h3333_3333) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h3333_3333	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h8);
	if (test_bench.tim_prdata == 32'h4444_4444) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h4444_4444	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'hc);
	if (test_bench.tim_prdata == 32'h5555_5555) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h5555_5555	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h10);
	if (test_bench.tim_prdata == 32'h6666_6666) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h6666_6666	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h14);
	if (test_bench.tim_prdata == 32'h0000_0001) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h0000_0001	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	test_bench.read(12'h1c);
	if (test_bench.tim_prdata == 32'h0000_0000) begin  
		$display(" %t : Check ONE HOT PASSED, ADDR = %h ", $time, test_bench.tim_paddr);
		$display("-------------------------------------------------------");	
		pass_cnt = pass_cnt + 1;
	end else begin
		$display(" %t :Check ONE HOT FAILED, ADDR = %h", $time, test_bench.tim_paddr); 
		$display("Exp: 32'h0000_0000	Actual: %h", test_bench.tim_prdata);
		$display("-------------------------------------------------------");
	end
	test_bench.tim_psel = 1'b0;
	test_bench.tim_penable = 1'b0;
	#100;

	if (pass_cnt == 8) begin
		$display(" Test_result PASSED");
		$display("------------------------------------------");
	end else begin
		$display(" Test_result FAILED");
		$display("------------------------------------------");
	end

    end


endtask
