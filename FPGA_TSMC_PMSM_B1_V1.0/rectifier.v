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

always @ (posedge sysclk or negedge global_rst) begin
if (!global_rst)begin
	Sap <= 1'b0;
	San <= 1'b0;
	Sbp <= 1'b0;
	Sbn <= 1'b0;
	Scp <= 1'b0;
	Scn <= 1'b0;
end
else begin
	if (!SD) begin
		Sap <= 1'b0;
		San <= 1'b0;
		Sbp <= 1'b0;
		Sbn <= 1'b0;
		Scp <= 1'b0;
		Scn <= 1'b0;
	end
	else begin
		if (!DOV) begin
		
		end
		
	
	
	
	
	
		if (!grid_judge == 0) begin
			if (grid_sector == 15'd1) begin
				Sap <= 1'b1;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b1;
				Scp <= 1'b0;
				Scn <= 1'b0;	
			end
			else if (grid_sector == 15'd2) begin
				Sap <= 1'b1;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b1;			
			end
			else if (grid_sector == 15'd3) begin
				Sap <= 1'b0;
				San <= 1'b0;
				Sbp <= 1'b1;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b1;			
			end		
			else if (grid_sector == 15'd4) begin
				Sap <= 1'b0;
				San <= 1'b1;
				Sbp <= 1'b1;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b0;			
			end		
			else if (grid_sector == 15'd5) begin
				Sap <= 1'b0;
				San <= 1'b1;
				Sbp <= 1'b0;
				Sbn <= 1'b0;
				Scp <= 1'b1;
				Scn <= 1'b0;			
			end			
			else begin
				Sap <= 1'b0;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b1;
				Scp <= 1'b1;
				Scn <= 1'b0;			
			end			
		end
		else begin
			if (grid_sector == 15'd1) begin
				Sap <= 1'b1;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b1;	
			end
			else if (grid_sector == 15'd2) begin
				Sap <= 1'b0;
				San <= 1'b0;
				Sbp <= 1'b1;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b1;			
		end
			else if (grid_sector == 15'd3) begin
				Sap <= 1'b0;
				San <= 1'b0;
				Sbp <= 1'b1;
				Sbn <= 1'b0;
				Scp <= 1'b0;
				Scn <= 1'b0;			
			end		
			else if (grid_sector == 15'd4) begin
				Sap <= 1'b0;
				San <= 1'b1;
				Sbp <= 1'b0;
				Sbn <= 1'b0;
				Scp <= 1'b1;
				Scn <= 1'b0;			
		end		
			else if (grid_sector == 15'd5) begin
				Sap <= 1'b0;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b1;
				Scp <= 1'b1;
				Scn <= 1'b0;			
		end			
			else begin
				Sap <= 1'b1;
				San <= 1'b0;
				Sbp <= 1'b0;
				Sbn <= 1'b1;
				Scp <= 1'b0;
				Scn <= 1'b0;			
			end			
		end	
	end	
end
end

	





endmodule
