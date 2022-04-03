module deadband(  PWMOUT,
		  sysclk,
		  PWMIN,           
		  global_rst);

input sysclk;
input global_rst;
input PWMIN;	

output reg PWMOUT;

parameter RED = 500;

reg [19:0] CNT;
reg CE;
reg CMP;


always @ (posedge sysclk or negedge global_rst)
if (!global_rst)
	CE<= 0;
else begin
	if (PWMIN == 1'b1)
		CE <= 1'b1;
	else
		CE <= 1'b0;
end

always @ (posedge sysclk or negedge global_rst)
if (!global_rst)
	CNT<= 0;
else begin
	if (CE == 1'b1)
		CNT <= CNT + 20'd1;
	else
		CNT <= 20'd0;
end


always @ (posedge sysclk or negedge global_rst)
if (!global_rst)
	CMP<= 0;
else begin
	if (CNT > RED)
		CMP <= 1'b1;
	else
		CMP <= 1'b0;
end


always @ (*) begin
	PWMOUT = PWMIN & CMP;
end


endmodule



