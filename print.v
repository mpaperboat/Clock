module print(
	input clk,
	input[3:0]a,
	input[3:0]b,
	input[3:0]c,
	input[3:0]d,
	input sa,
	input sb,
	input sc,
	input sd,
	output reg[6:0]a_to_g,
	output reg[3:0]en);
	reg[31:0]ccnt;
	reg[3:0]num;
	always@(posedge clk)
	begin
		ccnt=ccnt+1;
		if(ccnt[16:13]==0)
		begin
			num=a;
			en=4'b0111;
		end
		if(ccnt[16:13]==1)
		begin
			num=b;
			en=4'b1011;
		end
		if(ccnt[16:13]==2)
		begin
			num=c;
			en=4'b1101;
		end
		if(ccnt[16:13]==3)
		begin
			num=d;
			en=4'b1110;
		end
		case(num)
			0:a_to_g=7'b0000001;
			1:a_to_g=7'b1001111;
			2:a_to_g=7'b0010010;
			3:a_to_g=7'b0000110;
			4:a_to_g=7'b1001100;
			5:a_to_g=7'b0100100;
			6:a_to_g=7'b0100000;
			7:a_to_g=7'b0001111;
			8:a_to_g=7'b0000000;
			9:a_to_g=7'b0000100;
			'hA: a_to_g=7'b0001000;
			'hB: a_to_g=7'b1100000;
			'hC: a_to_g=7'b0110001;
			'hD: a_to_g=7'b1000010;
			'hE: a_to_g=7'b0110000;
			'hF: a_to_g=7'b0111000;
		endcase
	end
endmodule
