
// SPI Wrapper

module SPI_Wrapper(MISO,MOSI,SS_n,clk,rst_n);

parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

input MOSI,SS_n,clk,rst_n;
output MISO;
wire[9:0] rx_data;
wire[7:0] tx_data;
wire tx_valid,rx_valid;

RAM #(MEM_DEPTH,ADDR_SIZE) ram(rx_data,clk,rst_n,rx_valid,tx_data,tx_valid);
SPI_SLAVE spi(MOSI,tx_valid,tx_data,rst_n,SS_n,clk,MISO,rx_valid,rx_data);

endmodule