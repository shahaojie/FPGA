module XDSP(dsp2fpga1,			// input: h0FC01
				dsp2fpga2,			// input: h0FC02	
				dsp2fpga3,			// input: h0FC03	
				dsp2fpga4,			// input: h0FC04	
				
				fpga2dsp1,			// Output: h0FC05	
				fpga2dsp2,			// Output: h0FC06	
				fpga2dsp3,			// Output: h0FC07	
				fpga2dsp4,			// Output: h0FC08	

				wen,			// input: DSP write enable			
				ren,			// input: DSP read enable
								
				xadd,			// input:DSP  address
				xdata,		// inout:DSP  data
				
				clk,			// input:clock
				global_rst	// input:global_rst		
				);
				
output [15:0]fpga2dsp1;
output [15:0]fpga2dsp2;
output [15:0]fpga2dsp3;
output [15:0]fpga2dsp4;

input [15:0]dsp2fpga1;
input [15:0]dsp2fpga2;
input [15:0]dsp2fpga3;
input [15:0]dsp2fpga4;

				
input ren;
input wen;

input [19:0]xadd;
inout [15:0]xdata;

input clk;
input global_rst;

reg [15:0]fpga2dsp1_reg;
reg [15:0]fpga2dsp2_reg;
reg [15:0]fpga2dsp3_reg;
reg [15:0]fpga2dsp4_reg;

reg [15:0]dsp2fpga1_reg;
reg [15:0]dsp2fpga2_reg;
reg [15:0]dsp2fpga3_reg;
reg [15:0]dsp2fpga4_reg;

reg [15:0]xdata;
reg [19:0]xadd_reg;
//=============== XINTF ===================


always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		dsp2fpga1_reg <= 16'h0000;
		dsp2fpga2_reg <= 16'h0000;
		dsp2fpga3_reg <= 16'h0000;
		dsp2fpga4_reg <= 16'h0000;
		xadd_reg <= 20'h00000;
	end
	else
	begin
		dsp2fpga1_reg <= dsp2fpga1;
		dsp2fpga2_reg <= dsp2fpga2;
		dsp2fpga3_reg <= dsp2fpga3;
		dsp2fpga4_reg <= dsp2fpga4;
		xadd_reg	<= xadd;
	end
end

//=============== XINTF ===================
always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		fpga2dsp1_reg <= 16'h0000;
		fpga2dsp2_reg <= 16'h0000;
		fpga2dsp3_reg <= 16'h0000;
		fpga2dsp4_reg <= 16'h0000;		
	end
	else
	begin
	if (!ren)
	begin
		case	(xadd_reg)
		20'h0FC01:
			xdata <= dsp2fpga1_reg;			
		20'h0FC02:
			xdata <= dsp2fpga2_reg;			
		20'h0FC03:
			xdata <= dsp2fpga3_reg;			
		20'h0FC04:
			xdata <= dsp2fpga4_reg;			
		default:
			xdata <= 16'hzzzz;
		endcase
	end
	else if (!wen)
	begin
		case	(xadd_reg)
		20'h0FC05:
			fpga2dsp1_reg <= xdata[15:0];
		20'h0FC06:
			fpga2dsp2_reg <= xdata[15:0];	
		20'h0FC07:
			fpga2dsp3_reg <= xdata[15:0];	
		default: //20'h0FC08
			fpga2dsp4_reg <= xdata[15:0];
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
		fpga2dsp1 <= 16'h0000;
		fpga2dsp2 <= 16'h0000;
		fpga2dsp3 <= 16'h0000;
		fpga2dsp4 <= 16'h0000;
		
	end
	else
	begin
		fpga2dsp1 <= fpga2dsp1_reg;
		fpga2dsp2 <= fpga2dsp2_reg;
		fpga2dsp3 <= fpga2dsp3_reg;
		fpga2dsp4 <= fpga2dsp4_reg;		
	end
end

endmodule	