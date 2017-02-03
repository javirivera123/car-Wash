`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:53 12/01/2015 
// Design Name: 
// Module Name:    Carwash 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Carwash(

input BTN3,
input BTN0,
input SW7,
input SW6,
input SW5,
input clk, 

output reg[6:0] seg,
output reg[6:0] seg2
);


parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5, state6 = 6, state7 = 7, state8 = 8,
state9 = 9, state10 = 10, state11 = 11, state12 = 12, state13 = 13, state14 = 14, state15 = 15, state16 = 16,
state17 = 17, state18 = 18, state19 = 19, state20 = 20, state21 = 21, state22 = 22,
state23 = 23, state24 = 24, state25 = 25, state26 = 26;
reg [4:0] state, next_st;

always@ (BTN3)
begin: next_state_logic
	
	case(state)
	
	state0: begin  
			if(BTN3 == 0)
			next_st = state0;
			
			else if(BTN3 == 1 && SW7 == 1)
			next_st = state1;
			
			else if(BTN3 == 1 && SW6 == 1)
			next_st = state6;
			
			else if(BTN3 == 1 && SW5 == 1)
			next_st = state13;
			
			
			else
			next_st = state0;
		end
	
	state1: begin

			if (BTN0 == 0  )  //SW7 == 1
			next_st = state2;
	
			else
			next_st = state0;
		
		end
		

	state2: begin
			if ( BTN0 == 0 ) 
			next_st = state3; 
		
			else
			next_st = state0; 
		end

  state3: begin
	    if ( BTN0 == 0 )
	    next_st = state4;
		
		 else
	    next_st = state0;   
		 end
		

state4: begin
	    if ( BTN0 == 0 )
	    next_st = state5;
		
		 else
		next_st = state0; 
		end
		
	state5: begin
		if ( BTN0 == 0 )
		next_st = state26;
		
		else
		next_st = state0;
		end
		
	state6: begin         ///begiinnng of ep
		if(BTN0 == 0 )  //SW6 == 1
		next_st = state7;
		
		else
		next_st = state0;
		end
		
	state7: begin            // ps
      if(BTN0 == 0 )
		next_st = state8;
		
		else
		next_st = state0;
		end
		
	state8: begin            //c
      if(BTN0 == 0 )
		next_st = state9;
		
		else
		next_st = state0;
		end
		
	state9: begin           //sf
      if(BTN0 == 0 )
		next_st = state10;
		
		else
		next_st = state0;
		end
		
	state10: begin                //c
      if(BTN0 == 0 )
		next_st = state11;
		
		else
		next_st = state0;
		end
		
			
	state11: begin            //ri
      if(BTN0 == 0 ) 
		next_st = state12;
		
		else
		next_st = state0;
		end
		
	state12: begin        // 9
      if(BTN0 == 0 ) //checking for pp
		next_st = state26;
		
		else
		next_st = state0;
		end
		
	state13: begin        // pp 
      if(BTN0 == 0 )   //SW5 == 1
		next_st = state14;
		
		else
		next_st = state0;
		end
		
	state14: begin        // ps
      if(BTN0 == 0 ) 
		next_st = state15;
		
		else
		next_st = state0;
		end
		
	state15: begin        // c
      if(BTN0 == 0) 
		next_st = state16;
		
		else
		next_st = state0;
		end
		
	state16: begin        // sf
      if(BTN0 == 0 ) 
		next_st = state17;
		
		else
		next_st = state0;
		end
		
	state17: begin        // c
      if(BTN0 == 0 ) 
		next_st = state18;
		
		else
		next_st = state0;
		end
		
	state18: begin        // ri
      if(BTN0 == 0 ) 
		next_st = state19;
		
		else
		next_st = state0;
		end
		
	state19: begin        // uu
      if(BTN0 == 0 ) 
		next_st = state20;
		
		else
		next_st = state0;
		end
		
	state20: begin        // c
      if(BTN0 == 0 ) 
		next_st = state21;
		
		else
		next_st = state0;
		end
		
	state21: begin        // ri
      if(BTN0 == 0) 
		next_st = state22;
		
		else
		next_st = state0;
		end
		
	state22: begin        // d
      if(BTN0 == 0 ) 
		next_st = state23;
		
		else
		next_st = state0;
		end
		
	state23: begin        // rs
      if(BTN0 == 0 ) 
		next_st = state24;
		
		else
		next_st = state0;
		end
		
	state24: begin        // sh
      if(BTN0 == 0 ) 
		next_st = state25;
		
		else
		next_st = state0;
		end
		
	state25: begin        // 9
      if(BTN0 == 0) 
		next_st = state26;
		
		else
		next_st = state0;
		end
		
	state26: begin //idle
		if(BTN3 == 0) //SW7 == 1
		next_st = state26;
		
	//	else if(BTN3 == 0 && SW6 == 1)
	//	next_st = state26;
		
	//	else if(BTN3 == 0 && SW5 == 1)
	//	next_st = state26;
		
		else if(BTN3 == 1) //money reset
		next_st = state0;
		end
//default : next_st = state0;
		
	endcase
end

always@ (posedge clk)
begin
	state = next_st;
	end

always @ (state)
begin : output_logic
	case(state)
		
		state0 : begin
		seg2 =  7'b0000001;    // IDLE STATE WITH NO MONEY 
		seg =   7'b0000001;    //
		end
		
		state1 : begin
		seg2 =  7'b0011111;    // B seg2 is segment display 1
		seg =   7'b1100111;    // P
		end						
		
		state2 : begin
		seg2 =  7'B1011011;   // S
		seg =   7'b1000111;    // F
		end 
		
		state3: begin
		seg2 = 7'b1001110; //c
		seg  = 7'b0000000;//blank
		end
		
		state4: begin
		seg =  7'b0000110;// i
		seg2 = 7'b1000110; //r
		end
		
		state5: begin
		seg =  7'b0000000; // 
		seg2 = 7'b1110011; //   9
		end
		
		state6: begin
		seg2 =  7'b1001111; // E
		seg =   7'b1100111;    // P
		end
		
		state7: begin
		seg2 =  7'b1100111; // p
		seg = 7'B1011011; //s
		end
		
		state8: begin
		seg =  7'b0000000; // 
		seg2 = 7'b1001110; //c		
		end
		
		state9: begin
		seg2 =  7'B1011011;   // S
		seg =   7'b1000111;    // F
		end 
		
		state10: begin
		seg2 = 7'b1001110; //c
		seg  = 7'b0000000;//blank
		end
		
		state11: begin
		seg =  7'b0000110;// i
		seg2 = 7'b1000110; //r
		end
		
		state12: begin 
		seg =  7'b0000000; // 
		seg2 = 7'b1110011; //   9
		end
		
		state13: begin                            //begin pp
		seg2 =  7'b1100111; // p
		seg =  7'b1100111; // p
		end
		
		state14: begin                           
		seg2 =  7'b1100111; // p
		seg =  7'b1011011; // s
		end
		
		state15: begin                           
		seg2 =  7'b1001110; //c
		seg =   7'b0000000; // blank
		end
		
		state16: begin                           
		seg2 =  7'B1011011;   // S
		seg =   7'b1000111;    // F
		end
		
		state17: begin                           
		seg2 =  7'b1001110; //c
		seg =   7'b0000000; // blank
		end
		
		state18: begin                           
		seg =  7'b0000110;// i
		seg2 = 7'b1000110; //r
		end
		
		state19: begin                           
		seg2 =  7'b0111110; // u
		seg =  7'b0111110; // u
		end
		
		state20: begin                           
		seg2 =  7'b1001110; //c
		seg =   7'b0000000; // blank
		end
		
		state21: begin                           
		seg =  7'b0000110;// i
		seg2 = 7'b1000110; //r
		end
		
		state22: begin                           
		seg2 =  7'b0111101; // d
		seg =  7'b0000000; // blank
		end
		
		state23: begin                           
		seg2 =  7'b1000110; //r 
		seg =  7'b1011011; // s
		end
		
		state24: begin                           
		seg2 =  7'b1011011; // s
		seg =   7'b0110111; // H
		end
		
		state25: begin
		seg =  7'b0000000; // 
		seg2 = 7'b1110011; //   9
		end
		
		state26: begin
		seg2 =  7'b0000001;    // IDLE STATE WITH NO MONEY 
		seg =   7'b0000001;    //
		end
		
		
		
		
		
		
		
		
		
		
	endcase
end	
 endmodule 
 
 