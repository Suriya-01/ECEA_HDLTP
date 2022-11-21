module mux(
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output reg out
    );
    always@(*)
    begin
    case ({S1,S0})
       2'b00 : out = I0;
       2'b01 : out = I1;
       2'b10 : out = I2;
       2'b11 : out = I3;
    endcase
    end
endmodule


//test bench
module mux_tb;
reg I0,I1,I2,I3,S0,S1;
wire out;
mux uut(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S0(S0),.S1(S1),.out(out));
initial 
begin
I0=1'b1;
S0=1'b0;S1=1'b0;I0=1'b1;I1=1'b0;I2=1'b0;I3=1'b0;#5
S0=1'b0;S1=1'b1;I0=1'b0;I1=1'b1;I2=1'b0;I3=1'b0;#5
S0=1'b1;S1=1'b0;I0=1'b0;I1=1'b0;I2=1'b1;I3=1'b0;#5
S0=1'b1;S1=1'b1;I0=1'b0;I1=1'b0;I2=1'b0;I3=1'b1;#5
$stop;
end
endmodule
	
	