module tb_scorehand();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

            //instantiate our test cards and test total
            reg [3:0] TB_card1, TB_card2, TB_card3;
            wire [3:0] TB_total;

            scorehand scorehand(.card1(TB_card1), .card2(TB_card2), .card3(TB_card3), .total(TB_total));

            initial begin
            
        // everything is 0 test, output shoudl be 0
        TB_card1 = 4'd0; TB_card2 = 4'd0; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // one non face card in each spot just to test individuality, should output that card
        TB_card1 = 4'd1; TB_card2 = 4'd0; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd0; TB_card2 = 4'd5; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd0; TB_card2 = 4'd0; TB_card3 = 4'd9;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // same thing as above but now with 10+ type of card, should be 0
        TB_card1 = 4'd10; TB_card2 = 4'd0; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd0; TB_card2 = 4'd11; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd0; TB_card2 = 4'd0; TB_card3 = 4'd12;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // three kings, should be 0
        TB_card1 = 4'd13; TB_card2 = 4'd13; TB_card3 = 4'd13;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // 5 + jack should be 5
        TB_card1 = 4'd5; TB_card2 = 4'd11; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // 2 cards that equal to 10 so should be 0
        TB_card1 = 4'd4; TB_card2 = 4'd6; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // 2 different cases of two "overflowing" ones, should expect 5 then 8
        TB_card1 = 4'd7; TB_card2 = 4'd8; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd9; TB_card2 = 4'd9; TB_card3 = 4'd0;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // simple addition with no overflow should be 6
        TB_card1 = 4'd1; TB_card2 = 4'd2; TB_card3 = 4'd3;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // addition w/ 3 cards w/ overflow, should be 12
        TB_card1 = 4'd3; TB_card2 = 4'd4; TB_card3 = 4'd5;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // three cards summing to 20 so should be 0
        TB_card1 = 4'd9; TB_card2 = 4'd9; TB_card3 = 4'd2;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // three cards summing to over 20, should expect 1 then 7
        TB_card1 = 4'd6; TB_card2 = 4'd7; TB_card3 = 4'd8;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        TB_card1 = 4'd9; TB_card2 = 4'd9; TB_card3 = 4'd9;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

        // random combos of face cards with normal number cards just as edge case kinda 
        // 8 + king + 7 = 15 so become 5
        TB_card1 = 4'd8; TB_card2 = 4'd13; TB_card3 = 4'd7;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        // ten + 9 + queen goes to 9
        TB_card1 = 4'd10; TB_card2 = 4'd9; TB_card3 = 4'd12;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);
        // 2 + ten + 8 = 10 goes to 0
        TB_card1 = 4'd2; TB_card2 = 4'd10; TB_card3 = 4'd8;
        #10;
        $display("time=%0t cards=%d,%d,%d total=%d", $time, TB_card1, TB_card2, TB_card3, TB_total);

            end


            

endmodule

