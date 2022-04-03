module time_adv_even(

	input clk,global_rst,
	
	output reg clk_out);
	
parameter N = 2;
parameter WIDTH = 7;

reg [WIDTH:0]counter;

always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		counter <= 0;
	end
	else if (counter == N - 1)
	begin
		counter <= 0;
	end
	else
	begin
		counter <= counter + 1;
	end
end

always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		clk_out <= 0;
	end
	else if (counter == N - 1)
	begin
		clk_out <= !clk_out;
	end
	
end



endmodule
