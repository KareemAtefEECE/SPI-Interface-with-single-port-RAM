
// SPI SLAVE

module SPI_SLAVE(MOSI,tx_valid,tx_data,rst_n,SS_n,clk,MISO,rx_valid,rx_data);

// states encoding

parameter IDLE = 3'b000;
parameter CHK_CMD = 3'b001;
parameter WRITE = 3'b010;
parameter READ_DATA = 3'b011;
parameter READ_ADD = 3'b100;


input clk,rst_n,tx_valid,MOSI,SS_n;
input[7:0] tx_data;
output reg MISO;
output rx_valid;
output reg[9:0] rx_data;

reg[3:0] counter_1,counter_2;
reg stop,read_data;
reg[2:0] cs,ns;

// state memory

always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
	       cs<=IDLE;
	       read_data<=0;
	end
	else cs<=ns;
end

// next state logic

always @(*) begin
	case(cs)
	IDLE : begin
		ns=SS_n?IDLE:CHK_CMD;
	end 
	CHK_CMD : begin
	    if(SS_n) ns=IDLE;
		else if(~MOSI) ns=WRITE;
		else if(~read_data) begin
			ns=READ_ADD;
		end
		else begin
			ns=READ_DATA;
		end 
	end
	WRITE: ns=SS_n?IDLE:WRITE;
    READ_ADD: ns=SS_n?IDLE:READ_ADD;
    READ_DATA: ns=SS_n?IDLE:READ_DATA;
    default : ns=IDLE;
    endcase  
end

// output logic

always @(posedge clk) begin
	case(cs)
	IDLE: begin 
	    counter_1<=1;
	    counter_2<=1;
	end
	WRITE: begin
	if(counter_1<=10) begin
		rx_data[10-counter_1]<=MOSI;
	    counter_1<=counter_1+1;
	    end
	end
	READ_ADD: begin
		if(counter_1<=10) begin
		read_data<=1;
		rx_data[10-counter_1]<=MOSI;
	    counter_1<=counter_1+1;
	    end
	end
    READ_DATA: begin
    	if(counter_1<=10) begin
    	rx_data[10-counter_1]<=MOSI;
	    counter_1<=counter_1+1;
	    end
	    if(tx_valid) begin
	    	MISO<=tx_data[8-counter_2];
	    	counter_2<=counter_2+1;
	    end
    end
    default: begin
    	counter_1<=1;
	    counter_2<=1;
    end
    endcase
end

assign rx_valid = ((cs==WRITE || cs==READ_DATA || cs==READ_ADD) && counter_1>10)?1:0;
endmodule 

