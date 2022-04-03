module div_any( clkout,       // clkout
		  global_cnt_rising,		// Rising
//		  global_cnt_falling,	// Falling
//		  global_cnt_triangular, // Triangular
        clkin,        // clkin
        global_rst    // global reset
);

input clkin;
input global_rst;

output reg clkout;
output reg [15:0] global_cnt_rising;

reg [15:0] cnt;

parameter N1 = 5000;
parameter N2 = 9998;

always @ (posedge clkin or negedge global_rst)
if(!global_rst) begin
  cnt<=16'd0;
  clkout<= 1'b0;
 end
else if(cnt < N1)
  begin
  clkout<=1'd1;
  cnt<= cnt + 16'd1;
  end
else if(cnt >= N1 && cnt <= N2 )
  begin
  clkout<=1'd0;
  cnt<= cnt + 16'd1;
  end
else if(cnt > N2)
  begin
  cnt <= 16'd0;
  clkout<=1'd1;
  end	
  
always @ (posedge clkin or negedge global_rst) 
if(!global_rst) begin
	global_cnt_rising <= 16'd0;
end
else if(cnt <= N2) begin
	global_cnt_rising <= global_cnt_rising + 16'd1;
end
else if(cnt > N2) begin
	global_cnt_rising <= 16'd0;
end

  
endmodule