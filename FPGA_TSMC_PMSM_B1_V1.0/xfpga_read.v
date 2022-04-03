module XFPGA_READ(
				dsp2fpga1,			// output: h0FC01
				dsp2fpga2,			// output: h0FC02	
				dsp2fpga3,			// output: h0FC03	
				dsp2fpga4,			// output: h0FC04
				dsp2fpga5,			// output: h0FC05
				dsp2fpga6,			// output: h0FC06
				dsp2fpga7,			// output: h0FC07
				dsp2fpga8,			// output: h0FC08
			   	
				
				wen,			// input: DSP write enable			
								
				xadd,			// input:DSP  address
				xdata,		// inout:DSP  data
				
				clk,			// input:clock
				global_rst	// input:global_rst		
				);
				
output reg [15:0]dsp2fpga1;
output reg [15:0]dsp2fpga2;
output reg [15:0]dsp2fpga3;
output reg [15:0]dsp2fpga4;
output reg [15:0]dsp2fpga5;
output reg [15:0]dsp2fpga6;
output reg [15:0]dsp2fpga7;
output reg [15:0]dsp2fpga8;

input wen;

input [19:0]xadd;
inout [15:0]xdata;

input clk;
input global_rst;


reg [15:0]dsp2fpga1_reg;
reg [15:0]dsp2fpga2_reg;
reg [15:0]dsp2fpga3_reg;
reg [15:0]dsp2fpga4_reg;
reg [15:0]dsp2fpga5_reg;
reg [15:0]dsp2fpga6_reg;
reg [15:0]dsp2fpga7_reg;
reg [15:0]dsp2fpga8_reg;



reg [15:0]xdata;
reg [19:0]xadd_reg;


always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		xadd_reg <= 20'h00000;
	end
	else
	begin
		xadd_reg	<= xadd;
	end
end

//=============== XINTF ===================

always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		dsp2fpga1_reg <= 16'h0000;
		dsp2fpga2_reg <= 16'h0000;
		dsp2fpga3_reg <= 16'h0000;
		dsp2fpga4_reg <= 16'h0000;
		dsp2fpga5_reg <= 16'h0000;
		dsp2fpga6_reg <= 16'h0000;
		dsp2fpga7_reg <= 16'h0000;
		dsp2fpga8_reg <= 16'h0000;
		
	end
	else
	begin
		if (!wen)
		begin
			case	(xadd_reg)
			20'h0FC01:
				dsp2fpga1_reg <= xdata[15:0];
			20'h0FC02:
				dsp2fpga2_reg <= xdata[15:0];	
			20'h0FC03:
				dsp2fpga3_reg <= xdata[15:0];
			20'h0FC04:
				dsp2fpga4_reg <= xdata[15:0];
			20'h0FC05:
				dsp2fpga5_reg <= xdata[15:0];				
			20'h0FC06:
				dsp2fpga6_reg <= xdata[15:0];		
			20'h0FC07:
				dsp2fpga7_reg <= xdata[15:0];	
			default: //20'h0FC04
				dsp2fpga8_reg <= xdata[15:0];				
			endcase
		end
		else
		begin	
			xdata <= 16'hzzzz;
		end
	end
end


always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		dsp2fpga1 <= 16'h0000;
		dsp2fpga2 <= 16'h0000;
		dsp2fpga3 <= 16'h0000;
		dsp2fpga4 <= 16'h0000;
		dsp2fpga5 <= 16'h0000;
		dsp2fpga6 <= 16'h0000;
		dsp2fpga7 <= 16'h0000;
		dsp2fpga8 <= 16'h0000;
	end
	else
	begin
		dsp2fpga1 <= dsp2fpga1_reg;
		dsp2fpga2 <= dsp2fpga2_reg;
		dsp2fpga3 <= dsp2fpga3_reg;
		dsp2fpga4 <= dsp2fpga4_reg;	
		dsp2fpga5 <= dsp2fpga5_reg;		
		dsp2fpga6 <= dsp2fpga6_reg;		
		dsp2fpga7 <= dsp2fpga7_reg;		
		dsp2fpga8 <= dsp2fpga8_reg;		
		
	end
end










endmodule	