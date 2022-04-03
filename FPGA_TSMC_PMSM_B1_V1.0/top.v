module top(	CLKIN,			// Input: CLK = 50MHz
				RST,				// Input: global_rst signal
				
				XA,				// Input: DSP Address bus
				XD,				//	Input: DSP Data bus
				XWE0,				// Input: DSP write enable
//				XRD,				// Input: DSP read enable
						
				LED3,				// Output: LED3
				LED4				// Output: LED4
				);

input CLKIN;
input RST;

input [19:0]XA;
inout [15:0]XD;
input XWE0;
//input XRD;

output LED3;
output LED4;

//==========================================================================
//==============================1. Input CLK(PLL)===========================
//==========================================================================

wire sysclk;
			
altpll0 
pll0( .inclk0(CLKIN),
		.c0(sysclk)
);

reg global_rst;
reg xwrite;

always @ (posedge sysclk)
begin
	global_rst <= RST;
	xwrite <= XWE0;

end
//==========================================================================
//===========================2. Control Clock ========================
//==========================================================================
wire pwm_clk;

div_any
div_any0	(.clkout(pwm_clk),
			 .clkin(sysclk),				// input:clock
			 .global_rst(global_rst)	// input:global_rst		
			);

//==========================================================================
//===========================2. XDSP1 (READ data)========================
//==========================================================================

wire [15:0]data1;
wire [15:0]data2;
wire [15:0]data3;
wire [15:0]data4;

XFPGA_READ
xfpga0	  (.dsp2fpga1(data1),			// output: h0FC01
				.dsp2fpga2(data2),			// output: h0FC02
				.dsp2fpga3(data3),			// output: h0FC03
				.dsp2fpga4(data4),			// output: h0FC04
						
				.wen(xwrite),			// input: DSP write enable			
								
				.xadd(XA),				// input:DSP  address
				.xdata(XD),				// inout:DSP  data
				
				.clk(sysclk),			// input:clock
				.global_rst(global_rst)	// input:global_rst		
				);			
				
				

				
				
				
				
				
//==========================================================================
//======================= 4. LED ============================================
//==========================================================================

assign LED3 = 1'b1;					// LED light
assign LED4 = 1'b1;					// LED light


endmodule
