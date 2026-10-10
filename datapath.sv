module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output [3:0] pcard3_out,
                output [3:0] pscore_out, output [3:0] dscore_out,
                output[6:0] HEX5, output[6:0] HEX4, output[6:0] HEX3,
                output[6:0] HEX2, output[6:0] HEX1, output[6:0] HEX0);
						
// The code describing your datapath will go here.  Your datapath 
// will hierarchically instantiate six card7seg blocks, two scorehand
// blocks, and a dealcard block.  The registers may either be instatiated
// or included as sequential always blocks directly in this file.
//
// Follow the block diagram in the Lab 1 handout closely as you write this code.


    //will run from dealcard to all of the reg4s for each card
    logic [3:0] new_card;
    //each card gets a 4 bit logic bus
    logic [3:0] pcard1, pcard2, pcard3, dcard1, dcard2, dcard3;

    //call the dealcard module to be the dealer using its fast_clock and resetb and new_card as it's "output" (kind of)
    dealcard dealer(.clock(fast_clock), .resetb(resetb), .new_card(new_card));

    //on every slow clock tick if a reset is held, all cards go back to 0
    always_ff @(posedge slow_clock) begin
        if (resetb == 0) begin
            pcard1 <= 4'd0;
            pcard2 <= 4'd0;
            pcard3 <= 4'd0;
            dcard1 <= 4'd0;
            dcard2 <= 4'd0;
            dcard3 <= 4'd0;
            // otherwise if not reset, if the load signal is high for each card, it will be loaded with a new card generate from the dealer module (basically only takes it when it's ready)
        end else begin
            if (load_pcard1) pcard1 <= new_card;
            if (load_pcard2) pcard2 <= new_card;
            if (load_pcard3) pcard3 <= new_card;
            if (load_dcard1) dcard1 <= new_card;
            if (load_dcard2) dcard2 <= new_card;
            if (load_dcard3) dcard3 <= new_card;
        end
    end

    //assigns the values of each card in each hand to their respective HEX's, utilizes the card7seg to translate from 4bit to 7seg display format for DE1
    //this occurs for every single card since there are 6 to be displayed
    card7seg p1seg(.card(pcard1), .seg7(HEX0));
    card7seg p2seg(.card(pcard2), .seg7(HEX1));
    card7seg p3seg(.card(pcard3), .seg7(HEX2));
    card7seg d1seg(.card(dcard1), .seg7(HEX3));
    card7seg d2seg(.card(dcard2), .seg7(HEX4));
    card7seg d3seg(.card(dcard3), .seg7(HEX5));
    
    //calling the scorehand module to calculate the score for player hand and dealer hand
    //it takes in the three cards, and spits out total score as described in the module itself
    scorehand pscore_calc(.card1(pcard1), .card2(pcard2), .card3(pcard3), .total(pscore_out));
    scorehand dscore_calc(.card1(dcard1), .card2(dcard2), .card3(dcard3), .total(dscore_out));

    //copies the internal register to the pcard3_out port so that the FSM is able to see the player's third card
    //
    assign pcard3_out = pcard3;        

endmodule

