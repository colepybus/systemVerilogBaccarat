module tb_datapath();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

    //instantiating all of our test signals as needed for the datapath		
    reg TB_slow_clock, TB_fast_clock, TB_resetb;
    reg TB_load_pcard1, TB_load_pcard2, TB_load_pcard3;
    reg TB_load_dcard1, TB_load_dcard2, TB_load_dcard3;
    wire [3:0] TB_pcard3, TB_pscore, TB_dscore;
    wire [6:0] TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0;
 
    //instantiating into our test version of datapath
    datapath datapath(.slow_clock(TB_slow_clock), .fast_clock(TB_fast_clock), .resetb(TB_resetb),
                 .load_pcard1(TB_load_pcard1), .load_pcard2(TB_load_pcard2), .load_pcard3(TB_load_pcard3),
                 .load_dcard1(TB_load_dcard1), .load_dcard2(TB_load_dcard2), .load_dcard3(TB_load_dcard3),
                 .pcard3_out(TB_pcard3), .pscore_out(TB_pscore), .dscore_out(TB_dscore),
                 .HEX5(TB_HEX5), .HEX4(TB_HEX4), .HEX3(TB_HEX3),
                 .HEX2(TB_HEX2), .HEX1(TB_HEX1), .HEX0(TB_HEX0));
 
    // fast clock will begin to be running in the background, constantly alternating
    //at each testing point we print current time, players 3rd card, player score, dealer score, and all the test hexs
    initial begin
        TB_fast_clock = 0;
        forever #1 TB_fast_clock = ~TB_fast_clock;
    end
 
    // HEX printed as HEX5..HEX0, 1111111 = blank
    initial begin
        TB_slow_clock = 0; TB_resetb = 1;
        TB_load_pcard1 = 0; TB_load_pcard2 = 0; TB_load_pcard3 = 0;
        TB_load_dcard1 = 0; TB_load_dcard2 = 0; TB_load_dcard3 = 0;
        #4;
 
 
        // reset  so should be full 0s 
        TB_resetb = 0;
        #4; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_resetb = 1;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load pcard1 so player just has 5
        TB_load_pcard1 = 1;
        #6; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_pcard1 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load dcard1 player should just have 5 again, put face card in dealer
        TB_load_dcard1 = 1;
        #10; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_dcard1 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load pcard2, now we expect 8 from player
        TB_load_pcard2 = 1;
        #4; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_pcard2 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load dcard2  8 from player again, just added another face to dealer
        TB_load_dcard2 = 1;
        #14; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_dcard2 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load pcard3, overflow from player test 
        TB_load_pcard3 = 1;
        #8; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_pcard3 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // load dcard3 overflow from player and single non face for dealer
        TB_load_dcard3 = 1;
        #2; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_load_dcard3 = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // no load now
        #6; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        // full reset back to 0
        TB_resetb = 0;
        #4; TB_slow_clock = 1; #2; TB_slow_clock = 0;
        TB_resetb = 1;
        #2;
        $display("time=%0t pcard3=%d pscore=%d dscore=%d HEX5..0=%b %b %b %b %b %b", $time, TB_pcard3, TB_pscore, TB_dscore, TB_HEX5, TB_HEX4, TB_HEX3, TB_HEX2, TB_HEX1, TB_HEX0);
 
        $stop;
    end

endmodule

