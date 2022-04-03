module grid_duty( grid_judge,       	// clkout
						grid_dm,			 		//grid duty
						global_cnt_rising,	// rising count
						sysclk,        	// clkin
						global_rst    			// global reset
);

input sysclk;
input global_rst;
input grid_dm;
input global_cnt_rising;

output reg grid_judge;

always @ (posedge sysclk or negedge global_rst)
if(!global_rst)begin
  grid_judge<= 1'b0;
 end
else if(global_cnt_rising < grid_dm)begin
  grid_judge<=1'b0;
 end
else if(global_cnt_rising >= grid_dm)begin
  grid_judge<=1'b1;
end
 
endmodule