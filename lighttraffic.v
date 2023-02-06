//1200162 omar
module traffic_light(clk  ,reset,go, out);
	
	input clk,reset,go;
	output reg [1:0]out [3:0];
	parameter RED=2'b00,RED_YELLOW=2'b01,YELLOW=2'b10,GREEN=2'b11;
	parameter S0=5'd0,S1=5'd1,S2=5'd2,S3=5'd3,S4=5'd4
	,S5=5'd5,S6=5'd6,S7=5'd7,S8=5'd8,S9=5'd9,S10=5'd10,S11=5'd11
	,S12=5'd12,S13=5'd13,S14=5'd14,S15=5'd15,S16=5'd16,S17=5'd17 ;
	
	reg [4:0]count=0;
	reg [4:0]state=S0;
	
	always@(posedge clk,posedge reset)
		begin
			 if (reset==1)
				begin
					count<=0;
					state<=S0;
				end
			else 
				begin
						if(go)begin
						count<=count+1;end
				    
					case(state)
					
					S0:if(count==1)
						begin  	
							state<=S1;
							count<=0;
						end
					S1:if(count==2)
						begin  	
							state<=S2;
							count<=0;
						end
					S2:if(count==30)
						begin  	
							state<=S3;
							count<=0;
						end
					S3:if(count==2)
						begin  	
							state<=S4;
							count<=0;
						end
					S4:if(count==10)
						begin  	
							state<=S5;
							count<=0;
						end	 
					S5:if(count==2)
						begin  	
							state<=S6;
							count<=0;
						end
					S6:if(count==1)
						begin  	
							state<=S7;
							count<=0;
						end
					S7:if(count==2)
						begin  	
							state<=S8;
							count<=0;
						end
					S8:if(count==15)
						begin  	
							state<=S9;
							count<=0;
						end	
					S9:if(count==2)
						begin  	
							state<=S10;
							count<=0;
						end
					S10:if(count==5)
						begin  	
							state<=S11;
							count<=0;
						end
					S11:if(count==2)
						begin  	
							state<=S12;
							count<=0;
						end	   
					S12:if(count==10)
						begin  	
							state<=S13;
							count<=0;
						end
					S13:if(count==2)
						begin  	
							state<=S14;
							count<=0;
						end
					S14:if(count==1)
						begin  	
							state<=S15;
							count<=0;
						end	
					S15:if(count==2)
						begin  	
							state<=S16;
							count<=0;
						end
					S16:if(count==15)
						begin  	
							state<=S17;
							count<=0;
						end	
					S17:if(count==3)
						begin  	
							state<=S0;
							count<=0;
						end
					endcase
					
				
				end
		end
	initial begin
			out[3]=RED;
			out[2]=RED;
			out[1]=RED;
			out[0]=RED;
	end			
		
	always @(state)begin
		case(state)	
			S0:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED;
				out[0]=RED;
			end
			S1:begin
				out[3]=RED_YELLOW;
				out[2]=RED_YELLOW;
				out[1]=RED;
				out[0]=RED;
			end
			S2:begin
				out[3]=GREEN;
				out[2]=GREEN;
				out[1]=RED;
				out[0]=RED;
			end	
			S3:begin
				out[3]=GREEN;
				out[2]=YELLOW;
				out[1]=RED;
				out[0]=RED;
			end
			S4:begin
				out[3]=GREEN;
				out[2]=RED;
				out[1]=RED;
				out[0]=RED;
			end
			S5:begin
				out[3]=YELLOW;
				out[2]=RED;
				out[1]=RED;
				out[0]=RED;
			end
			S6:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED;
				out[0]=RED;
			end	
			S7:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED_YELLOW;
				out[0]=RED_YELLOW;
			end
			S8:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=GREEN;
				out[0]=GREEN;
			end	 
			S9:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=GREEN;
				out[0]=YELLOW;
			end	 
			S10:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=GREEN;
				out[0]=RED;
			end	
			S11:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=YELLOW;
				out[0]=RED_YELLOW;
			end		   
			S12:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED;
				out[0]=GREEN;
			end
			S13:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED;
				out[0]=YELLOW;
			end		
			S14:begin
				out[3]=RED;
				out[2]=RED;
				out[1]=RED;
				out[0]=RED;
			end
			S15:begin
				out[3]=RED;
				out[2]=RED_YELLOW;
				out[1]=RED;
				out[0]=RED;
			end
			S16:begin
				out[3]=RED;
				out[2]=GREEN;
				out[1]=RED;
				out[0]=RED;
			end
			S17:begin
				out[3]=RED;
				out[2]=YELLOW;
				out[1]=RED;
				out[0]=RED;
			end
			
			   
		endcase
		
	end	
endmodule 

module traffic_lighttb;
	reg clk,reset,enable;
	wire [1:0]out[3:0];
	traffic_light test(clk,reset,enable,out);
	initial begin
		clk=0;
		reset=0;
		enable=1;
		#500 $finish;
	end
	always #1 clk=~clk;
		

endmodule 

module model(state,out);
	input [4:0]state;
	output reg [1:0]out[3:0];
	reg [7:0]memory[17:0];
	initial begin
		memory[0]=8'b00000000; 
		memory[1]=8'b01010000;
		memory[2]=8'b11110000;
		memory[3]=8'b11100000;
		memory[4]=8'b11000000;
		memory[5]=8'b10000000;
		memory[6]=8'b00000000;
		memory[7]=8'b00000101;
		memory[8]=8'b00001111;
		memory[9]=8'b00001110;
		memory[10]=8'b00001100;
		memory[11]=8'b00001001;
		memory[12]=8'b00000011;
		memory[13]=8'b00000010;
		memory[14]=8'b00000000;
		memory[15]=8'b00010000;
		memory[16]=8'b00110000;
		memory[17]=8'b00100000;	
	end
	always@ ( state)
		begin
			out[3]=memory[state][7:6];
			out[2]=memory[state][5:4]; 
			out[1]=memory[state][3:2]; 
			out[0]=memory[state][1:0]; 
		end
		
endmodule

module analyzer;
	reg clk,reset,enable;
	reg [4:0]state=5'd17;
	wire [1:0]out[3:0];
	wire [1:0]outtest[3:0];	
	model model(state,outtest);
	traffic_light tl(clk,reset,enable,out);
	
	always @( out[3] or  out[2] or  out[1] or  out[0]) begin
		if (state==17)
			state=0;
		else 
			state=state+1;		
	end
	always @(negedge clk)begin
		if(out[3:0] != outtest[3:0])
			begin
				$display("error at state=  0x%0h at time %d",state,$time);
			end
		end
		
	initial begin
		clk=0;
		reset=0;
		enable=1;
		#500 $finish;
	end
	always #1 clk=~clk;
endmodule	
	
	

	
	
					
					
	

