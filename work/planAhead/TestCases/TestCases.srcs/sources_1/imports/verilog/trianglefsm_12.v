/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module trianglefsm_12 (
    input clk,
    input btn,
    output reg [8:0] rgb,
    output reg [15:0] tribits,
    input [2:0] cyclestate
  );
  
  
  
  
  
  localparam IDLE_state = 3'd0;
  localparam RED_state = 3'd1;
  localparam BLUE_state = 3'd2;
  localparam GREEN_state = 3'd3;
  localparam GAMEOVER_state = 3'd4;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  
  always @* begin
    M_state_d = M_state_q;
    
    rgb = 9'h1ff;
    tribits = 16'h0000;
    
    case (M_state_q)
      IDLE_state: begin
        tribits = 16'h0000;
        rgb = 9'h1ff;
        if (btn) begin
          M_state_d = RED_state;
        end
      end
      RED_state: begin
        rgb = 9'h1ab;
        tribits = 16'h0001;
        if (cyclestate == 1'h1) begin
          M_state_d = GAMEOVER_state;
        end
        if (btn) begin
          M_state_d = BLUE_state;
        end
      end
      BLUE_state: begin
        rgb = 9'h0f5;
        tribits = 16'h0002;
        if (cyclestate == 1'h1) begin
          M_state_d = GAMEOVER_state;
        end
        if (btn) begin
          M_state_d = GREEN_state;
        end
      end
      GREEN_state: begin
        rgb = 9'h15e;
        tribits = 16'h0003;
        if (cyclestate == 1'h1) begin
          M_state_d = GAMEOVER_state;
        end
        if (btn) begin
          M_state_d = RED_state;
        end
      end
      GAMEOVER_state: begin
        rgb = 9'h1ff;
        tribits = 16'hffff;
        if (cyclestate == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_state_q <= M_state_d;
  end
  
endmodule
