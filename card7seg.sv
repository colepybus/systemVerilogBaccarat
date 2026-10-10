module card7seg(input [3:0] card, output[6:0] seg7);

   logic [6:0] HEX0;   

   always_comb begin
      case (card)
         4'b0000: HEX0 = 7'b0000000; //nothing (zero)
         4'b0001: HEX0 = 7'b1110111; //ace
         4'b0010: HEX0 = 7'b1011011; //two
         4'b0011: HEX0 = 7'b1001111; //three 
         4'b0100: HEX0 = 7'b1100110; //four 
         4'b0101: HEX0 = 7'b1101101; //five
         4'b0110: HEX0 = 7'b1111101; //six  
         4'b0111: HEX0 = 7'b0000111; //seven
         4'b1000: HEX0 = 7'b1111111; //eight
         4'b1001: HEX0 = 7'b1101111; //nine
         4'b1010: HEX0 = 7'b0111111; //ten
         4'b1011: HEX0 = 7'b0011110; //jack (eleven)
         4'b1100: HEX0 = 7'b1100111; //queen (twelve)
         4'b1101: HEX0 = 7'b1110110; //king (thirteen)
         4'b1110: HEX0 = 7'b0000000; //nothing (fourteen)
         4'b1111: HEX0 = 7'b0000000; //nothing (fifteen)
      endcase
   end

   assign seg7 = ~HEX0;   // displays are active low

endmodule