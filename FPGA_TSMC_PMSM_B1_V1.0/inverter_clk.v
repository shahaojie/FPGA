module inverter_clk( Sp,       // Swithing signal
						Sn,			// Swithing signal
						//Sp1,
						//Sp2,
						
						T1,	// duty control
						T2,	// duty control
						
						SD,			 // Shutting down
						
						global_cnt_rising,	// rising edge
						
					   sysclk,        // clkin
					   global_rst    // global reset
);

input sysclk;
input global_rst;
input [15:0] global_cnt_rising;

input [15:0] T1;
input [15:0] T2;

input SD;

output reg Sp;
output reg Sn;
//output reg Sp1;
//output reg Sp2;

reg [15:0] T1_shadow;
reg [15:0] T2_shadow;
reg Sp1;
reg Sp2;

always @ (posedge sysclk or negedge global_rst)
if(!global_rst)
	T1_shadow <= 16'd0;
else begin
	if(global_cnt_rising == 16'd0) 
		T1_shadow <= T1;
end

always @ (posedge sysclk or negedge global_rst)
if(!global_rst)
	T2_shadow <= 16'd0;
else begin
	if(global_cnt_rising == 16'd0) 
		T2_shadow <= T2;
end

// Sp1
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sp1 <= 1'b0;
else begin
	if (!SD) 
		Sp1 <= 1'b0;
	else begin
		if(global_cnt_rising < T1_shadow)
			 Sp1 <=1'b0;
		else
			 Sp1 <=1'b1;
	end
end

// Sp2
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sp2 <= 1'b1;
else begin
	if (!SD) 
		Sp2 <= 1'b1;
	else begin
		if(global_cnt_rising < T2_shadow)
			 Sp2 <=1'b1;
		else
			 Sp2 <=1'b0;
	end
end

always @(*) begin
	Sp = Sp1 & Sp2;
end

always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sn <= 1'b0;
else begin
	if (!SD)
		Sn <= 1'b0;
	else begin
		Sn <= !Sp;
	end
end
		
endmodule