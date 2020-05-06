/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module cyclefsm_13 (
    input clk,
    input rst,
    input button,
    input btn,
    input [15:0] score,
    output reg [5:0] alufn,
    output reg cyclestate,
    output reg [15:0] pnum,
    output reg [4:0] we,
    output reg [1:0] asel,
    output reg [1:0] bsel,
    input [1:0] lanelasttwo,
    input [15:0] alu
  );
  
  
  
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  
  
  localparam IDLE_cycle = 3'd0;
  localparam SHIFTLANE_cycle = 3'd1;
  localparam ADDSCORE_cycle = 3'd2;
  localparam COMPSCORE_cycle = 3'd3;
  localparam COMPTRI_cycle = 3'd4;
  localparam GAMEOVER_cycle = 3'd5;
  
  reg [2:0] M_cycle_d, M_cycle_q = IDLE_cycle;
  
  wire [32-1:0] M_p1_num;
  reg [1-1:0] M_p1_next;
  reg [32-1:0] M_p1_seed;
  pn_gen_34 p1 (
    .clk(clk),
    .rst(rst),
    .next(M_p1_next),
    .seed(M_p1_seed),
    .num(M_p1_num)
  );
  
  wire [1-1:0] M_sc_inc_state;
  stateCounter_35 sc (
    .clk(clk),
    .rst(rst),
    .score(score),
    .inc_state(M_sc_inc_state)
  );
  
  always @* begin
    M_cycle_d = M_cycle_q;
    M_seed_d = M_seed_q;
    
    M_p1_next = 1'h0;
    M_p1_seed = M_seed_q;
    cyclestate = 1'h0;
    alufn = 6'h00;
    asel = 1'h0;
    bsel = 1'h0;
    we = 5'h00;
    
    case (M_cycle_q)
      IDLE_cycle: begin
        cyclestate = 1'h0;
        alufn = 6'h00;
        asel = 1'h0;
        bsel = 2'h0;
        we = 5'h03;
        if (btn) begin
          M_p1_next = 1'h1;
          M_cycle_d = SHIFTLANE_cycle;
        end
      end
      SHIFTLANE_cycle: begin
        M_seed_d = M_seed_q + 1'h1;
        alufn = 6'h22;
        asel = 1'h0;
        bsel = 2'h2;
        cyclestate = 1'h0;
        we = 5'h04;
        M_p1_next = 1'h0;
        M_cycle_d = ADDSCORE_cycle;
      end
      ADDSCORE_cycle: begin
        alufn = 6'h00;
        asel = 1'h0;
        bsel = 2'h0;
        cyclestate = 1'h0;
        we = 5'h08;
        M_cycle_d = COMPSCORE_cycle;
      end
      COMPSCORE_cycle: begin
        alufn = 6'h37;
        asel = 1'h1;
        bsel = 1'h0;
        cyclestate = 1'h0;
        if (alu == 1'h0) begin
          we = 5'h10;
        end else begin
          we = 5'h00;
        end
        if (M_sc_inc_state == 1'h1) begin
          M_cycle_d = COMPTRI_cycle;
        end
      end
      COMPTRI_cycle: begin
        alufn = 6'h33;
        asel = 2'h2;
        bsel = 1'h1;
        cyclestate = 1'h0;
        we = 5'h00;
        if (M_sc_inc_state == 1'h1) begin
          if (alu != 1'h1 && lanelasttwo != 1'h0) begin
            M_cycle_d = GAMEOVER_cycle;
          end else begin
            M_p1_next = 1'h1;
            M_cycle_d = SHIFTLANE_cycle;
          end
        end
      end
      GAMEOVER_cycle: begin
        cyclestate = 1'h1;
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 2'h0;
        we = 5'h01;
        if (button && M_sc_inc_state == 1'h1) begin
          M_cycle_d = IDLE_cycle;
        end
      end
    endcase
    pnum = M_p1_num[0+15-:16];
  end
  
  always @(posedge clk) begin
    M_seed_q <= M_seed_d;
  end
  
  
  always @(posedge clk) begin
    M_cycle_q <= M_cycle_d;
  end
  
endmodule
