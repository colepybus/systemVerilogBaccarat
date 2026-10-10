module tb_statemachine();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").


    // slowclock and reset test versions, then we have reg for testing dealerscore, playerscore, and playercard3
    reg TB_slow_clock, TB_resetb;
    reg [3:0] TB_dscore, TB_pscore, TB_pcard3;
    wire TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3;
    wire TB_pwin, TB_dwin;
    //player win in wire and dealer win in wire
 
    //sending in the testbench signals to the statemachine module input
    statemachine statemachine(.slow_clock(TB_slow_clock), .resetb(TB_resetb),
                     .dscore(TB_dscore), .pscore(TB_pscore), .pcard3(TB_pcard3),
                     .load_pcard1(TB_lp1), .load_pcard2(TB_lp2), .load_pcard3(TB_lp3),
                     .load_dcard1(TB_ld1), .load_dcard2(TB_ld2), .load_dcard3(TB_ld3),
                     .player_win_light(TB_pwin), .dealer_win_light(TB_dwin));
 
    // each clock line is one press of KEY0
    //this testbench was very repetitive so it involved a lot of copy and pasting once the general line of it was established
    //each time the state needs to be shown, the time, players score, dealers score, players 3rd card, load status (for all 6) and who won is printed.
    //this ensures thorough 

    initial begin
        TB_slow_clock = 0; TB_resetb = 1;
        TB_pscore = 4'd0; TB_dscore = 4'd0; TB_pcard3 = 4'd0;
        #10;
 
        // player natural, player auto wins in this circumstance
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd8; TB_dscore = 4'd5; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
 
        // both stand: dealer wins
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd6; TB_dscore = 4'd7; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
 
        // player stands so then dealer draws
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd6; TB_dscore = 4'd5; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard3
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_dscore = 4'd9;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
 
        // player draws but dealer draws
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd2; TB_dscore = 4'd5; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard3
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_pcard3 = 4'd4;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard3
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
 
        // player draws an 8 dealer stands
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd4; TB_dscore = 4'd3; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard3
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_pcard3 = 4'd8;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
 
        // natural tie meaning both lights should be on at this point
        TB_resetb = 0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_resetb = 1;
        TB_pscore = 4'd8; TB_dscore = 4'd8; TB_pcard3 = 4'd0;
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard1
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_pcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // load_dcard2
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // no loads
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
        TB_slow_clock = 1; #5; TB_slow_clock = 0; #5;   // done, win lights
        $display("time=%0t pscore=%d dscore=%d pcard3=%d | load p1,p2,p3=%b%b%b d1,d2,d3=%b%b%b | pwin=%b dwin=%b", $time, TB_pscore, TB_dscore, TB_pcard3, TB_lp1, TB_lp2, TB_lp3, TB_ld1, TB_ld2, TB_ld3, TB_pwin, TB_dwin);
    end

endmodule

