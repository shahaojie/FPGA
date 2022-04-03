module XFPGA_WRITE(
				fpga2dsp1,			// input: h0FC05	
				fpga2dsp2,			// input: h0FC06	
				fpga2dsp3,			// input: h0FC07	
				fpga2dsp4,			// input: h0FC08	

				ren,			// input: DSP read enable
								
				xadd,			// input:DSP  address
				xdata,		// inout:DSP  data
				
				clk,			// input:clock
				global_rst	// input:global_rst		
				);
				
input [15:0]fpga2dsp1;
input [15:0]fpga2dsp2;
input [15:0]fpga2dsp3;
input [15:0]fpga2dsp4;
				
input ren;

input [19:0]xadd;
inout [15:0]xdata;

input clk;
input global_rst;

reg [15:0]fpga2dsp1_reg;
reg [15:0]fpga2dsp2_reg;
reg [15:0]fpga2dsp3_reg;
reg [15:0]fpga2dsp4_reg;

reg [15:0]xdata;
reg [19:0]xadd_reg;

//=============== XINTF ===================
always @ (posedge clk or negedge global_rst)
begin
	if (!global_rst)
	begin
		fpga2dsp1_reg <= 16'h0000;
		fpga2dsp2_reg <= 16'h0000;
		fpga2dsp3_reg <= 16'h0000;
		fpga2dsp4_reg <= 16'h0000;	
		xadd_reg	<= 20'h00000;
	
	end
	else
	begin
		fpga2dsp1_reg <= fpga2dsp1;
		fpga2dsp2_reg <= fpga2dsp2;
		fpga2dsp3_reg <= fpga2dsp3;
		fpga2dsp4_reg <= fpga2dsp4;
		xadd_reg	<= xadd;
		
		if (!ren)
		begin
			case	(xadd_reg)
			20'h0FD05:
				xdata <= fpga2dsp1_reg;			
			20'h0FD06:
				xdata <= fpga2dsp2_reg;			
			20'h0FD07:
				xdata <= fpga2dsp3_reg;			
			20'h0FD08:
				xdata <= fpga2dsp4_reg;			
			default:
				xdata <= 16'hzzzz;
			endcase
		end
		else
		begin	
			xdata <= 16'hzzzz;
		end
		end

end

endmodule	