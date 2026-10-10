module statemachine(input slow_clock, input resetb,
                    input [3:0] dscore, input [3:0] pscore, input [3:0] pcard3,
                    output load_pcard1, output load_pcard2,output load_pcard3,
                    output load_dcard1, output load_dcard2, output load_dcard3,
                    output player_win_light, output dealer_win_light);

// The code describing your state machine will go here.  Remember that
// a state machine consists of next state logic, output logic, and the 
// registers that hold the state.  You will want to review your notes from
// CPEN 211 or equivalent if you have forgotten how to write a state machine.

//inputs: slow_clock (KEY0, user activated, advances through one step for each positive edge), resetb (active low reset brings back to the start), 
//outputs: load_pcard(1,2,3) and load_dcard(1,2,3) and player/dealerwinlight, 


    //defining all the various states, the dealing of te first two cards each and then the first checkpoint, as well as the third card for player/dealer, another check and then the final DONE state
    enum logic [3:0] {
        DEAL_P1, DEAL_D1, DEAL_P2, DEAL_D2, CHECK1, DEAL_P3, CHECK2, DEAL_D3, DONE
    } state, next_state;

    
    //slow_clock interaction is implented below, always_ff for it to update on the rising positive edge of slow clock
    //if the reset is pressed during a slow clock posedge, it goes back to starting point which is dealing player's card 1
    //otherwise if reset is not pressed, it advances to the next state of the FSM upon a slow clock posedge
    always_ff @(posedge slow_clock) begin
        if (resetb == 0) state <= DEAL_P1;
        else state <= next_state;
    end

    //below is implemtned the next-state logic and what actually happens within the states 
    always_comb begin
        next_state = state; //basically grounds the next state to stay at current state as default, avoids potential latch
        case (state)
            DEAL_P1: next_state = DEAL_D1; //moves to Deal_d1 upon slow clock press
            DEAL_D1: next_state = DEAL_P2; //same thing d1 to p2
            DEAL_P2: next_state = DEAL_D2; //same
            DEAL_D2: next_state = CHECK1; //goes to first check to decide what is next

            //initial checks after first 2 cards each have been dealed
            CHECK1: begin
                if      ((pscore >= 8) || (dscore >= 8)) next_state = DONE; //natural -> done
                else if (pscore <= 5) next_state = DEAL_P3; //player <= 5 -> gets another card
                else if ((pscore >= 6) && (dscore <= 5)) next_state = DEAL_D3; //player >= 6 AND dealer <= 5, dealer gets
                else    next_state = DONE; //basically if P>=6, D>=6, both stand so done
            end

            //checks for after player has been dealt third card, runs through special baccarat ruls to decide whether dealer gets card or not 
            CHECK2: begin
                if       (dscore <= 2) next_state = DEAL_D3;
                else if (dscore == 3 && pcard3 != 8) next_state = DEAL_D3;
                else if (dscore == 4 && pcard3 >= 2 && pcard3 <= 7) next_state = DEAL_D3;
                else if (dscore == 5 && pcard3 >= 4 && pcard3 <= 7) next_state = DEAL_D3;
                else if (dscore == 6 && pcard3 >= 6 && pcard3 <= 7) next_state = DEAL_D3;
                else     next_state = DONE;
            end

            DEAL_P3: next_state = CHECK2;
            DEAL_D3: next_state = DONE;

            DONE: next_state = DONE;
            default: next_state = DEAL_P1;
        endcase
    end

    assign load_pcard1 = (state == DEAL_P1);
    assign load_pcard2 = (state == DEAL_P2);
    assign load_pcard3 = (state == DEAL_P3);
    assign load_dcard1 = (state == DEAL_D1);
    assign load_dcard2 = (state == DEAL_D2);
    assign load_dcard3 = (state == DEAL_D3);

    assign player_win_light = (state == DONE) && (pscore >= dscore);
    assign dealer_win_light = (state == DONE) && (dscore >= pscore);

endmodule

