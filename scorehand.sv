module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output [3:0] total);

// The code describing scorehand will go here.  Remember this is a combinational
// block. The function is described in the handout.  Be sure to review the section
// on representing numbers in the lecture notes.

// all 10s are converted to 0, uses wire to declare 4-bit value, ">= 10" does a check to see if it is 10, J, Q, K, 
// if the value is 10 or face card, it becomes 0, if not it continues as card1

    wire [3:0] v1 = (card1 >= 10) ? 4'd0 : card1;
    wire [3:0] v2 = (card2 >= 10) ? 4'd0 : card2;
    wire [3:0] v3 = (card3 >= 10) ? 4'd0 : card3;
    
    assign total = 4'((v1 + v2 + v3) % 10);
    //Quartus gave wierd warning so just made it 4 bits just in case

// doesn't actually need always_comb

// % 10 takes care of the mod 10 and should output correct hand


endmodule

