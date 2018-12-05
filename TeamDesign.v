/*
project description:

*/


module team_proj(
output g1,	// 1 = on
output y1,	// 1 = on
output r1,	// 1 = on
output g2,	// 1 = on
output y2,	// 1 = on
output r2,	// 1 = on
 input ld1,	// wait time on green
 input ld2,	// wait time on red
 input en1,	// 
 input en2,	// 
 input ck	// clock
);
	reg [1:0] whichLight; 					// 00 = light 1, green 
								// 01 = light 1, yellow 
								// 10 = light 2, green
								// 11 = light 2, yellow

	reg [31:0] t1;						// countdown timer 1
	reg [31:0] t2;						// countdown timer 2
	
	reg [1:0] l1;						// 1 = green
								// 2 = yellow
/*
project description:

*/


module team_proj(
output g1,	// 1 = on
output y1,	// 1 = on
output r1,	// 1 = on
output g2,	// 1 = on
output y2,	// 1 = on
output r2,	// 1 = on
 input ld1,	// wait time on green
 input ld2,	// wait time on red
 input en1,	// 
 input en2,	// 
 input ck	// clock
);
	reg [1:0] whichLight; 					// 00 = light 1, green 
													// 01 = light 1, yellow 
													// 10 = light 2, green
													// 11 = light 2, yellow

	reg [31:0] t1;								// countdown timer 1
	reg [31:0] t2;								// countdown timer 2
	
	reg [1:0] l1;								// 1 = green
													// 2 = yellow
													// 3 = red
													// this is for light 1

	reg [1:0] l2;								// 1 = green
													// 2 = yellow
													// 3 = red
													// this is for light 2

	always @(posedge ck)
	begin
		if (whichLight == 0) 				// 00 = light 1, green
		begin
			l1 = 1;	 							// light 1, green
			l2 = 3;								// assign light 2 red
			t1 = t1 - 1;						// count down
			if (t1 == 0)						// if count down is zero
			begin
				t2 = ld2;						// reset countdown
				whichLight = whichLight+1;	// move to next state
			end
		end
		
		
		if (whichLight == 1)				 	// 01 = light 1, yellow 
		begin
			l1 = 2;								// assign light 1 to yellow
			l2 = 3;								// assign light 2 red
			t2 = t2 - 1;						// count down
			if (t1 == 0)						// if count down is zero
			begin
				t1 = ld1;						// reset countdown
				whichLight = whichLight+1;	// move to next state
			end	
		end
		
		
		if (whichLight == 2)					// 10 = light 2, green	
		begin
			l1 = 3;	 							// light 2, green
			l2 = 1;								// assign light 2 red
			t1 = t1 - 1;						// count down
			if (t1 == 0)						// if count down is zero
			begin
				t2 = ld2;						// reset countdown
				whichLight = whichLight+1;	// move to next state
			end	
		end
		
		
		if (whichLight == 3)					// 11 = light 2, yellow
		begin
			l1 = 3;								// assign light 1 to yellow
			l2 = 2;								// assign light 2 red
			t2 = t2 - 1;						// count down
			if (t1 == 0)						// if count down is zero
			begin	
				t1 = ld1;						// reset countdown
				whichLight = 0;				// move to next state
			end	
		end
		
	end											// end of always
	
	assign g1 = (l1 == 1);					// assigns the output LEDs the correct values
	assign y1 = (l1 == 2);
	assign r1 = (l1 == 3);
	assign g2 = (l2 == 1);
	assign y2 = (l2 == 2);
	assign r2 = (l2 == 3);


endmodule;