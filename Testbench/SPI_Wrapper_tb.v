

// SPI Wrapper Testbench


module SPI_Wrapper_tb();

reg MOSI,SS_n,clk,rst_n;
wire MISO;

integer i;

SPI_Wrapper DUT(MISO,MOSI,SS_n,clk,rst_n);

initial begin
	clk=0;
	forever
	#5 clk=~clk;
end

initial begin

    $readmemh("memory.mem",DUT.ram.mem);

	rst_n=0; SS_n=1; MOSI=0;
	#10
	rst_n=1; SS_n=0;

	// Write Address Test Case

	#10
	MOSI=0;
	#10
	MOSI=0;
	#10
    MOSI=0;
	#10
	for(i=0;i<7;i=i+1) begin
		MOSI=$random;
		#10;
	end
	#10
	SS_n=1;

	// Write Data Test Case
	#10
    SS_n=0;
    #10
	MOSI=0;
	#10
    MOSI=0;
	#10
	MOSI=1;
	#10
	for(i=0;i<7;i=i+1) begin
		MOSI=$random;
		#10;
	end
	#10
    SS_n=1;
    
    DUT.ram.mem[172]=123;

	// Read Address Test Case
	#10
	SS_n=0;
	#10
	MOSI=1;
	#10
	MOSI=1;
	#10
	MOSI=0;
	#10
	for(i=0;i<7;i=i+1) begin
		MOSI=$random;
		#10;
	end
    #10
	SS_n=1;

	// Read Data Test Case
	#10
	SS_n=0;
	#10
	MOSI=1;
	#10
	MOSI=1;
	#10
	MOSI=1;
	for(i=0;i<7;i=i+1) begin
		MOSI=$random;
		#10;
	end

    #100
    SS_n=1;
    $writememh("final_memory.mem",DUT.ram.mem);
	#20
	$stop;
end

endmodule
