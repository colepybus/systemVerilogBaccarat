module tb_task5();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 100,000 ticks (equivalent to "initial #100000 $finish();").
						
    reg TB_CLOCK_50;
    reg [1:0] TB_KEY;
    wire [9:0] TB_LEDR;
    wire [6:0] TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0;
 
    task5 task5(.CLOCK_50(TB_CLOCK_50), .KEY(TB_KEY), .LEDR(TB_LEDR),
              .HEX5(TB_HEX5), .HEX4(TB_HEX4), .HEX3(TB_HEX3),
              .HEX2(TB_HEX2), .HEX1(TB_HEX1), .HEX0(TB_HEX0));
 
    // run the 50 mHz clock in background while ongoing test
    initial begin
        TB_CLOCK_50 = 0;
        forever #1 TB_CLOCK_50 = ~TB_CLOCK_50;
    end
 
    // KEY[1] is the reset and KEY[0] is slow clock (deal button or moving state)
    // all needed information is printed on each iteration for analysis
    // this tb is also continously copied from one line of analysis for repitition purposes
    initial begin
        TB_KEY = 2'b11;
        #4;
 
 
        // game 1, player gets a natural hand
        TB_KEY[1] = 0; TB_KEY[0] = 0; #4; TB_KEY[0] = 1; #4; TB_KEY[1] = 1;   // reset
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #2; TB_KEY[0] = 1; #2;   // player 2,0,0 = 2   dealer 0,0,0 = 0
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #2; TB_KEY[0] = 1; #2;   // player 2,0,0 = 2   dealer 4,0,0 = 4
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #2; TB_KEY[0] = 1; #2;   // player 2,6,0 = 8   dealer 4,0,0 = 4
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #2; TB_KEY[0] = 1; #2;   // player 2,6,0 = 8   dealer 4,8,0 = 2
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #2; TB_KEY[0] = 1; #2;   // player 2,6,0 = 8   dealer 4,8,0 = 2   player wins this one 
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // game 2, now both draw a third card
        TB_KEY[1] = 0; TB_KEY[0] = 0; #4; TB_KEY[0] = 1; #4; TB_KEY[1] = 1;   // reset happense here
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,0,0 = 5   dealer 0,0,0 = 0
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,0,0 = 5   dealer 13,0,0 = 0
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,0 = 3   dealer 13,0,0 = 0
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,0 = 3   dealer 13,3,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,0 = 3   dealer 13,3,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,6 = 9   dealer 13,3,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,6 = 9   dealer 13,3,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #8; TB_KEY[0] = 1; #8;   // player 5,8,6 = 9   dealer 13,3,9 = 2   player wins
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // game 3 where player stands and dealer draws
        TB_KEY[1] = 0; TB_KEY[0] = 0; #4; TB_KEY[0] = 1; #4; TB_KEY[1] = 1;   // reset here
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,0,0 = 6   dealer 0,0,0 = 0
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,0,0 = 6   dealer 3,0,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,13,0 = 6   dealer 3,0,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,13,0 = 6   dealer 3,10,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,13,0 = 6   dealer 3,10,0 = 3
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        TB_KEY[0] = 0; #10; TB_KEY[0] = 1; #10;   // player 6,13,0 = 6   dealer 3,10,4 = 7   dealer wins
        $display("time=%0t LEDR=%b (dwin=%b pwin=%b dscore=%d pscore=%d) HEX5..0=%b %b %b %b %b %b", $time, TB_LEDR, TB_LEDR[9], TB_LEDR[8], TB_LEDR[7:4], TB_LEDR[3:0], TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
        //tb ends after these cases
        $stop;
    end
 

endmodule

