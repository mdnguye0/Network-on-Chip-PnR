
module system(
    input       clk,
    input       rst_n,
    input [7:0] load_mem_addr_i,
    input [8:0] load_mem_tile_select_i, //one hot tile select when loading memory
    input [7:0] load_dmem_data_i, 
    input [7:0] load_imem_data_i
);
   
   
   parameter 
             ID0 = 4'b0000, 
             ID1 = 4'b0001, 
             ID2 = 4'b0010, 
             ID3 = 4'b0100, 
             ID4 = 4'b0101, 
             ID5 = 4'b0110, 
             ID6 = 4'b1000, 
             ID7 = 4'b1001, 
             ID8 = 4'b1010;

   wire [12:0] cpu2router_0, router2cpu_0; 
   wire [12:0] cpu2router_1, router2cpu_1; 
   wire [12:0] cpu2router_2, router2cpu_2; 
   wire [12:0] cpu2router_3, router2cpu_3; 
   wire [12:0] cpu2router_4, router2cpu_4; 
   wire [12:0] cpu2router_5, router2cpu_5; 
   wire [12:0] cpu2router_6, router2cpu_6; 
   wire [12:0] cpu2router_7, router2cpu_7; 
   wire [12:0] cpu2router_8, router2cpu_8; 

   
   wire [12:0] data_1w_0e;
   wire [12:0] data_3n_0s;

   wire [12:0] data_2w_1e;
   wire [12:0] data_4n_1s;
   wire [12:0] data_0e_1w;

   wire [12:0] data_5n_2s;
   wire [12:0] data_1e_2w;

   wire [12:0] data_4w_3e;
   wire [12:0] data_6n_3s;
   wire [12:0] data_0s_3n;
   
   wire [12:0] data_5w_4e;
   wire [12:0] data_7n_4s;
   wire [12:0] data_3e_4w;
   wire [12:0] data_1s_4n;

   wire [12:0] data_8n_5s;
   wire [12:0] data_4e_5w;
   wire [12:0] data_2s_5n;
   
   wire [12:0] data_7w_6e;
   wire [12:0] data_3s_6n;

   wire [12:0] data_8w_7e;
   wire [12:0] data_6e_7w;
   wire [12:0] data_4s_7n;

   wire [12:0] data_7e_8w;
   wire [12:0] data_5s_8n;

   
   tile tile0(
      .clk(clk), .rst_n(rst_n), .TileID(ID0),
      .init_mem_en(   load_mem_tile_select_i[0]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_1w_0e),  .indata_s(data_3n_0s),  .indata_w(  13'b0   ),  .indata_n(  13'b0   ),  
      .outdata_e(data_0e_1w), .outdata_s(data_0s_3n), .outdata_w(          ), .outdata_n(          ), 
      .cpu2router(cpu2router_0), .router2cpu(router2cpu_0)
   );    // (0, 0)

   tile tile1(
      .clk(clk), .rst_n(rst_n), .TileID(ID1),
      .init_mem_en(   load_mem_tile_select_i[1]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_2w_1e),  .indata_s(data_4n_1s),  .indata_w(data_0e_1w),  .indata_n(  13'b0   ), 
      .outdata_e(data_1e_2w), .outdata_s(data_1s_4n), .outdata_w(data_1w_0e), .outdata_n(          ), 
      .cpu2router(cpu2router_1), .router2cpu(router2cpu_1)
   );    // (0, 1)

   tile tile2(
      .clk(clk), .rst_n(rst_n),.TileID(ID2),
      .init_mem_en(   load_mem_tile_select_i[2]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e(   13'b0   ),  .indata_s(data_5n_2s),  .indata_w(data_1e_2w),  .indata_n(  13'b0   ), 
      .outdata_e(          ), .outdata_s(data_2s_5n), .outdata_w(data_2w_1e), .outdata_n(          ), 
      .cpu2router(cpu2router_2), .router2cpu(router2cpu_2)
   );    // (0, 2)

   tile tile3(
      .clk(clk), .rst_n(rst_n),.TileID(ID3),
      .init_mem_en(   load_mem_tile_select_i[3]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_4w_3e),  .indata_s(data_6n_3s),  .indata_w(  13'b0   ),  .indata_n(data_0s_3n), 
      .outdata_e(data_3e_4w), .outdata_s(data_3s_6n), .outdata_w(          ), .outdata_n(data_3n_0s), 
      .cpu2router(cpu2router_3), .router2cpu(router2cpu_3)
   );    // (1, 0)

   tile tile4(
      .clk(clk), .rst_n(rst_n), .TileID(ID4),
      .init_mem_en(   load_mem_tile_select_i[4]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_5w_4e),  .indata_s(data_7n_4s),  .indata_w(data_3e_4w),  .indata_n(data_1s_4n), 
      .outdata_e(data_4e_5w), .outdata_s(data_4s_7n), .outdata_w(data_4w_3e), .outdata_n(data_4n_1s), 
      .cpu2router(cpu2router_4), .router2cpu(router2cpu_4)
   );    // (1, 1)

   tile_ps tile5(
      .clk(clk), .rst_n(rst_n), .TileID(ID5),
      .init_mem_en(   load_mem_tile_select_i[5]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e(   13'b0   ),  .indata_s(data_8n_5s),  .indata_w(data_4e_5w),  .indata_n(data_2s_5n), 
      .outdata_e(          ), .outdata_s(data_5s_8n), .outdata_w(data_5w_4e), .outdata_n(data_5n_2s), 
      .cpu2router(cpu2router_5), .router2cpu(router2cpu_5)
   );    // (1, 2)

   tile tile6(
      .clk(clk), .rst_n(rst_n), .TileID(ID6),
      .init_mem_en(   load_mem_tile_select_i[6]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_7w_6e),  .indata_s(  13'b0   ),  .indata_w(  13'b0   ),  .indata_n(data_3s_6n), 
      .outdata_e(data_6e_7w), .outdata_s(          ), .outdata_w(          ), .outdata_n(data_6n_3s), 
      .cpu2router(cpu2router_6), .router2cpu(router2cpu_6)
   );    // (2, 0)   

   tile tile7(
      .clk(clk), .rst_n(rst_n), .TileID(ID7),
      .init_mem_en(   load_mem_tile_select_i[7]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e( data_8w_7e),  .indata_s(  13'b0   ),  .indata_w(data_6e_7w),  .indata_n(data_4s_7n), 
      .outdata_e(data_7e_8w), .outdata_s(          ), .outdata_w(data_7w_6e), .outdata_n(data_7n_4s), 
      .cpu2router(cpu2router_7), .router2cpu(router2cpu_7)
   );    // (2, 1)
   
   tile tile8(
      .clk(clk), .rst_n(rst_n), .TileID(ID8),
      .init_mem_en(   load_mem_tile_select_i[8]), 
      .init_mem_addr( load_mem_addr_i), 
      .init_mem_dval( load_dmem_data_i), 
      .init_mem_ival( load_imem_data_i), 
      .indata_e(   13'b0   ),  .indata_s(  13'b0   ),  .indata_w(data_7e_8w),  .indata_n(data_5s_8n), 
      .outdata_e(          ), .outdata_s(          ), .outdata_w(data_8w_7e), .outdata_n(data_8n_5s), 
      .cpu2router(cpu2router_8), .router2cpu(router2cpu_8)
   );    // (2, 2)


endmodule
