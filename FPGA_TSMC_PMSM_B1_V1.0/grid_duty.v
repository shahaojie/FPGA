module grid_duty( grid_judge,       	// clkout
						grid_sector_shadow,
						grid_dm,			 		//grid duty
						grid_sector,
						global_cnt_rising,	// rising count
						sysclk,        	// clkin
						global_rst    			// global reset
);

input sysclk;
input global_rst;
input [15:0]	grid_dm;
input [15:0]	global_cnt_rising;
input [15:0]	grid_sector;

output reg grid_judge;
output reg [15:0] grid_sector_shadow;
reg [15:0]	grid_dm_shadow;


always @ (posedge sysclk or negedge global_rst)
if(!global_rst)
	grid_dm_shadow <= 16'd0;
else begin
	if(global_cnt_rising == 16'd0) 
		grid_dm_shadow <= grid_dm;
end


always @ (posedge sysclk or negedge global_rst)
if(!global_rst)
	grid_sector_shadow <= 16'd0;
else begin
	if(global_cnt_rising == 16'd0) 
		grid_sector_shadow <= grid_sector;

end


always @ (posedge sysclk or negedge global_rst)
if(!global_rst)begin
  grid_judge<= 1'b0;
 end
else begin
	if(global_cnt_rising < grid_dm_shadow)
 	    grid_judge<=1'b0;
 	else
  	    grid_judge<=1'b1;
end




 
endmodule