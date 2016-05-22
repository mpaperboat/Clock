module digit(
	input clk,
	input[3:0]a,
	input[3:0]b,
	input[3:0]c,
	input[3:0]d,
	input[3:0]dd,
	input sa,
	input sb,
	input sc,
	input sd,
	output reg[7:0]a_to_g,
	output reg[3:0]en);
	reg[31:0]ccnt;
	reg[3:0]num;
	reg t;
	always@(posedge clk)
	begin
		ccnt=ccnt+1;
		case(ccnt[15:14])
			0:
			begin
				num=a;
				en=4'b0111;
				if(sa&&ccnt[24])
					en=4'b1111;
				t=dd[0];
			end
			1:
			begin
				num=b;
				en=4'b1011;
				if(sb&&ccnt[24])
					en=4'b1111;
				t=dd[1];
			end
			2:
			begin
				num=c;
				en=4'b1101;
				if(sc&&ccnt[24])
					en=4'b1111;
				t=dd[2];
			end
			3:
			begin
				num=d;
				en=4'b1110;
				if(sd&&ccnt[24])
					en=4'b1111;
				t=dd[3];
			end
		endcase
		case(num)
			0:
				a_to_g=8'b10000001;
			1:
				a_to_g=8'b11001111;
			2:
				a_to_g=8'b10010010;
			3:
				a_to_g=8'b10000110;
			4:
				a_to_g=8'b11001100;
			5:
				a_to_g=8'b10100100;
			6:
				a_to_g=8'b10100000;
			7:
				a_to_g=8'b10001111;
			8:
				a_to_g=8'b10000000;
			9:
				a_to_g=8'b10000100;
		endcase
		a_to_g[7]=~t;
	end
endmodule
