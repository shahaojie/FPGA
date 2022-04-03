module rectifier( Sap,       // Swithing signal
						San,			// Swithing signal
						Sbp,			// Swithing signal
						Sbn,			// Swithing signal
						Scp,			// Swithing signal
						Scn,			// Swithing signal
						
						grid_judge,	// duty control
						grid_sector, // voltage sector of grid side
						SD,			 // Shutting down 
						
					   sysclk,        // clkin
					   global_rst    // global reset
);

input sysclk;
input global_rst;

input [15:0] grid_sector;
input grid_judge;
input SD;

output reg Sap;
output reg San;
output reg Sbp;
output reg Sbn;
output reg Scp;
output reg Scn;


// Sap Swithing Signal
always @ (*) 
	if (!SD) 
		Sap = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: Sap = 1;
				15'd2: Sap = 1;		
				15'd3: Sap = 0;		
				15'd4: Sap = 0;		
				15'd5: Sap = 0;		
				default: Sap = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sap = 1;
				15'd2: Sap = 0;		
				15'd3: Sap = 0;		
				15'd4: Sap = 0;		
				15'd5: Sap = 0;		
				default: Sap = 1;	
				endcase			
	end	
// San Swithing Signal
always @ (*) 
	if (!SD) 
		San = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: San = 0;
				15'd2: San = 0;		
				15'd3: San = 0;		
				15'd4: San = 1;		
				15'd5: San = 1;		
				default: San = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: San = 0;
				15'd2: San = 0;		
				15'd3: San = 1;		
				15'd4: San = 1;		
				15'd5: San = 0;		
				default: San = 0;	
				endcase			
	end	
	
// Sbp Swithing Signal
always @ (*) 
	if (!SD) 
		Sbp = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: Sbp = 0;
				15'd2: Sbp = 0;		
				15'd3: Sbp = 1;		
				15'd4: Sbp = 1;		
				15'd5: Sbp = 0;		
				default: Sbp = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sbp = 0;
				15'd2: Sbp = 1;		
				15'd3: Sbp = 1;		
				15'd4: Sbp = 0;		
				15'd5: Sbp = 0;		
				default: Sbp = 0;	
				endcase			
	end		
	
// Sbn Swithing Signal
always @ (*) 
	if (!SD) 
		Sbn = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: Sbn = 1;
				15'd2: Sbn = 0;		
				15'd3: Sbn = 0;		
				15'd4: Sbn = 0;		
				15'd5: Sbn = 0;		
				default: Sbn = 1;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sbn = 0;
				15'd2: Sbn = 0;		
				15'd3: Sbn = 0;		
				15'd4: Sbn = 0;		
				15'd5: Sbn = 1;		
				default: Sbn = 1;	
				endcase			
	end		
// Scp Swithing Signal
always @ (*) 
	if (!SD) 
		Scp = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: Scp = 0;
				15'd2: Scp = 0;		
				15'd3: Scp = 0;		
				15'd4: Scp = 0;		
				15'd5: Scp = 1;		
				default: Scp = 1;	
				endcase
		else 
				case (grid_sector)
				15'd1: Scp = 0;
				15'd2: Scp = 0;		
				15'd3: Scp = 0;		
				15'd4: Scp = 1;		
				15'd5: Scp = 1;		
				default: Scp = 0;	
				endcase			
	end		
		
// Scn Swithing Signal
always @ (*) 
	if (!SD) 
		Scn = 1'b0;
	else begin
		if (!grid_judge == 0)
				case (grid_sector)
				15'd1: Scn = 0;
				15'd2: Scn = 1;		
				15'd3: Scn = 1;		
				15'd4: Scn = 0;		
				15'd5: Scn = 0;		
				default: Scn = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Scn = 1;
				15'd2: Scn = 1;		
				15'd3: Scn = 0;		
				15'd4: Scn = 0;		
				15'd5: Scn = 0;		
				default: Scn = 0;	
				endcase			
	end		
	
	

endmodule
