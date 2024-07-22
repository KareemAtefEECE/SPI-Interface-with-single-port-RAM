module RAM(din,clk,rst_n,rx_valid,dout,tx_valid);

parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

reg[ADDR_SIZE-1:0] mem[MEM_DEPTH-1:0];

input clk,rst_n,rx_valid;
input[9:0] din;
output reg[ADDR_SIZE-1:0] dout;
output reg tx_valid;
reg[ADDR_SIZE-1:0] addr_wr;
reg[ADDR_SIZE-1:0] addr_rd;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin 
            dout<=0;
            addr_rd<=0;
            addr_wr<=0;
            tx_valid<=0;
	            end
	else begin

         tx_valid<=(din[9:8]==2'b11 && rx_valid)?1:0;

        if(rx_valid) begin
		case(din[9:8])
		2'b00 : addr_wr<=din[7:0];
		2'b01 : mem[addr_wr]<=din[7:0];
		2'b10 : addr_rd<=din[7:0];
        2'b11 : dout<=mem[addr_rd];
          endcase
        end
	end
end

endmodule