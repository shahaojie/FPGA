module rectifier_clk( Sap,       // Swithing signal
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
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sap <= 0;
else begin
	if (!SD) 
		Sap <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: Sap <= 1;
				15'd2: Sap <= 1;		
				15'd3: Sap <= 0;		
				15'd4: Sap <= 0;		
				15'd5: Sap <= 0;
				15'd6: Sap <= 0;
				default: Sap <= 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sap <= 1;
				15'd2: Sap <= 0;		
				15'd3: Sap <= 0;		
				15'd4: Sap <= 0;		
				15'd5: Sap <= 0;
				15'd6: Sap <= 1;				
				default: Sap <= 0;	
				endcase			
	end	
end

// San Swithing Signal
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	San <= 0;
else begin
	if (!SD) 
		San <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: San <= 0;
				15'd2: San <= 0;		
				15'd3: San <= 0;		
				15'd4: San <= 1;		
				15'd5: San <= 1;
				15'd6: San <= 0;								
				default: San <= 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: San <= 0;
				15'd2: San <= 0;		
				15'd3: San <= 1;		
				15'd4: San <= 1;		
				15'd5: San <= 0;
				15'd6: San <= 0;								
				default: San <= 0;	
				endcase			
	end	

end




// Sbp Swithing Signal
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sbp <= 0;
else begin
	if (!SD) 
		Sbp <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: Sbp <= 0;
				15'd2: Sbp <= 0;		
				15'd3: Sbp <= 1;		
				15'd4: Sbp <= 1;		
				15'd5: Sbp <= 0;	
				15'd6: Sbp <= 0;							
				default: Sbp = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sbp <= 0;
				15'd2: Sbp <= 1;		
				15'd3: Sbp <= 1;		
				15'd4: Sbp <= 0;		
				15'd5: Sbp <= 0;	
				15'd6: Sbp <= 0;											
				default: Sbp <= 0;	
				endcase			
	end		
end

// Sbn Swithing Signal
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Sbn <= 0;
else begin
	if (!SD) 
		Sbn <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: Sbn <= 1;
				15'd2: Sbn <= 0;		
				15'd3: Sbn <= 0;		
				15'd4: Sbn <= 0;		
				15'd5: Sbn <= 0;	
				15'd6: Sbn <= 1;											
				default: Sbn = 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Sbn <= 0;
				15'd2: Sbn <= 0;		
				15'd3: Sbn <= 0;		
				15'd4: Sbn <= 0;		
				15'd5: Sbn <= 1;
				15'd6: Sbn <= 1;															
				default: Sbn <= 0;	
				endcase			
	end		

end	
	
// Scp Swithing Signal
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Scp <= 0;
else begin
	if (!SD) 
		Scp <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: Scp <= 0;
				15'd2: Scp <= 0;		
				15'd3: Scp <= 0;		
				15'd4: Scp <= 0;		
				15'd5: Scp <= 1;	
				15'd6: Scp <= 1;															
				default: Scp <= 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Scp <= 0;
				15'd2: Scp <= 0;		
				15'd3: Scp <= 0;		
				15'd4: Scp <= 1;		
				15'd5: Scp <= 1;	
				15'd6: Scp <= 0;																			
				default: Scp <= 0;	
				endcase			
	end		
end	
	
// Scn Swithing Signal
always @ (posedge sysclk or negedge global_rst) 
if (!global_rst)
	Scn <= 0;
else begin
	if (!SD) 
		Scn <= 1'b0;
	else begin
		if (!grid_judge)
				case (grid_sector)
				15'd1: Scn <= 0;
				15'd2: Scn <= 1;		
				15'd3: Scn <= 1;		
				15'd4: Scn <= 0;		
				15'd5: Scn <= 0;	
				15'd6: Scn <= 0;																			
				default: Scn <= 0;	
				endcase
		else 
				case (grid_sector)
				15'd1: Scn <= 1;
				15'd2: Scn <= 1;		
				15'd3: Scn <= 0;		
				15'd4: Scn <= 0;		
				15'd5: Scn <= 0;	
				15'd6: Scn <= 0;																							
				default: Scn <= 0;	
				endcase			
	end		
end	
		
endmodule