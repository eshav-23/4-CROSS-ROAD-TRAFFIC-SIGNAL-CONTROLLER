`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2024 18:37:04
// Design Name: 
// Module Name: traffic_signal
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* 4 CROSS ROAD  A, B, C, D 
       |   |
       | A |
_ _ _ _|   |_ _ _ _    
_ _C _ _    _ D_ _ _       
       |   |
       | B |
       |   |
             */
module traffic_signal(clk,reset,count,signal_M1,signal_M2,signal_M3,signal_M4,signal_L1,signal_L2,signal_L3,signal_L4,signal_pedestrian);
input clk,reset;
output [4:0]count;
// 3 - BITS REPRESENT RED , YELLOW , GREEN
output reg [2:0]signal_M1;   // STRAIGHT A TO B AND LEFT A TO D
output reg [2:0]signal_M2;   // STRAIGHT B TO A AND LEFT B TO C
output reg [2:0]signal_M3;   // STRAIGHT C TO D AND LEFT C TO A
output reg [2:0]signal_M4;   // STRAIGHT D TO C AND LEFT D TO B
output reg [2:0]signal_L1;   // RIGHT A TO C
output reg [2:0]signal_L2;   // RIGHT B TO D
output reg [2:0]signal_L3;   // RIGHT D TO A
output reg [2:0]signal_L4;   // RIGHT C TO B
output reg signal_pedestrian;// WALK STOP

parameter S1 = 3'd0,S2 =3'd1,S3 = 3'd2,S4 =3'd3,S5 =3'd4,S6 =3'd5,S7 =3'd6,S8=3'd7;
reg [4:0]count;
parameter t1=15,t2=10,t3=5;
reg [2:0]p_state;

always @(posedge clk or posedge reset)
begin
if(reset==1)
begin p_state <= S1; end
else
case(p_state)
S1 :if(count<t1)
     begin 
     p_state <= S1;
     count <=count+1;
     end
     else
     begin
      p_state <= S2;
     count <=0;
     end
     
S2 :if(count<t2)
     begin 
     p_state <= S2;
     count <=count+1;
     end
     else
     begin
      p_state <= S3;
     count <=0;
     end
S3 :if(count<t2)
     begin 
     p_state <= S3;
     count <=count+1;
     end
     else
     begin
      p_state <= S4;
     count <=0;
     end
S4 :if(count<t1)
     begin 
     p_state <= S4;
     count <=count+1;
     end
     else
     begin
      p_state <= S5;
     count <=0;
     end
S5 :if(count<t2)
     begin 
     p_state <= S5;
     count <=count+1;
     end
     else
     begin
      p_state <= S6;
     count <=0;
     end
S6 :if(count<t2)
     begin 
     p_state <= S6;
     count <=count+1;
     end
     else
     begin
      p_state <= S7;
     count <=0;
     end     
S7 :if(count<t3)
     begin 
     p_state <= S7;
     count <=count+1;
     end
     else
     begin
      p_state <= S1;
     count <=0;
     end
  default : begin p_state = S1;  count =0; end
 endcase
 end
 always @(p_state)
 begin
 case (p_state)
 S1: begin
     signal_M1= 3'b001;
     signal_M2= 3'b100;
     signal_M3= 3'b100;
     signal_M4= 3'b100;
     signal_L1= 3'b001;
     signal_L2= 3'b100;
     signal_L3= 3'b100;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b100;
     end
 S2: begin
     signal_M1= 3'b010;
     signal_M2= 3'b001;
     signal_M3= 3'b100;
     signal_M4= 3'b100;
     signal_L1= 3'b100;
     signal_L2= 3'b100;
     signal_L3= 3'b100;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b100;
     end
   S3: begin
     signal_M1= 3'b100;
     signal_M2= 3'b010;
     signal_M3= 3'b100;
     signal_M4= 3'b100;
     signal_L1= 3'b100;
     signal_L2= 3'b001;
     signal_L3= 3'b100;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b100;
     end
  S4: begin
     signal_M1= 3'b100;
     signal_M2= 3'b100;
     signal_M3= 3'b001;
     signal_M4= 3'b100;
     signal_L1= 3'b100;
     signal_L2= 3'b100;
     signal_L3= 3'b100;
     signal_L4= 3'b001;
     signal_pedestrian= 3'b100;
     end
     
    S5: begin
     signal_M1= 3'b100;
     signal_M2= 3'b100;
     signal_M3= 3'b010;
     signal_M4= 3'b001;
     signal_L1= 3'b100;
     signal_L2= 3'b100;
     signal_L3= 3'b100;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b100;
     end 
    S6: begin
     signal_M1= 3'b100;
     signal_M2= 3'b100;
     signal_M3= 3'b100;
     signal_M4= 3'b010;
     signal_L1= 3'b001;
     signal_L2= 3'b100;
     signal_L3= 3'b001;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b100;
     end 
    S7: begin
     signal_M1= 3'b100;
     signal_M2= 3'b100;
     signal_M3= 3'b100;
     signal_M4= 3'b100;
     signal_L1= 3'b100;
     signal_L2= 3'b100;
     signal_L3= 3'b100;
     signal_L4= 3'b100;
     signal_pedestrian= 3'b001;
     end       
    default : begin
         signal_M1= 3'b000;
         signal_M2= 3'b000;
         signal_M3= 3'b000;
         signal_M4= 3'b000;
         signal_L1= 3'b000;
         signal_L2= 3'b000;
         signal_L3= 3'b000;
         signal_L4= 3'b000;
     signal_pedestrian= 3'b000; 
    end 
 endcase
 end
endmodule
