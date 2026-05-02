//-------------------------------------------------------------------------------
//-- This is a generic memory module and is used as both the instruction and data
//-- memory in the single cycle MIPS processor.
//--
//-- Kekai Hu
//-- ECE 232
//-------------------------------------------------------------------------------

module memory (
    input clk,
    input [7:0] addr_i,  //address of 32-bit data blocks
    input [7:0] data_i,
    input write_en_i,
    input read_en_i,
    output reg [31:0] data_o
);

  parameter MEM_SIZE = 256;  //Memory size

  reg [7:0] mem[0:MEM_SIZE-1];

  always @(posedge clk) begin
    //Read data
    if (read_en_i == 1'b1) begin  //Read 4 bytes of data
      data_o[31:24] <= mem[addr_i+3];
      data_o[23:16] <= mem[addr_i+2];
      data_o[15:8]  <= mem[addr_i+1];
      data_o[7:0]   <= mem[addr_i+0];
    end else begin
      data_o <= 0;
    end

    //Write data
    if (write_en_i == 1'b1) begin
      mem[addr_i] <= data_i;
    end

  end

endmodule

