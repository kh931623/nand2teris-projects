// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// declare max row and max col for screen
@256
D = A
@maxRow
M = D

@32
D = A
@maxCol
M = D

(LOOP)
    // declare variable named data, which would be written to screen memory
    @data
    M = -1

    // if no keyboard input, then set data to 0
    @KBD
    D = M
    @SET_DATA_TO_ZERO
    D; JEQ

    (SETTING_SCREEN)
    @i
    M = 0

    // get screen base address
    @SCREEN
    D = A
    @addr
    M = D

    (FOREACH_ROW)
        @j
        M = 0

        // if i >= maxRow, then breaks
        @maxRow
        D = M
        @i
        D = M - D;
        @LOOP_END
        D; JGE

        (FOREACH_COL)
            // if j >= maxCol, then break
            @maxCol
            D = M
            @j
            D = M - D;
            @FOREACH_COL_END
            D; JGE

            // set current screen memory to data
            @data
            D = M
            @addr
            A = M
            M = D

            // move the pointer to next postion
            @addr
            M = M + 1

            // increase loop counter j
            @j
            M = M + 1

            @FOREACH_COL
            0; JMP

        (FOREACH_COL_END)
        // increase loop counter i
        @i
        M = M + 1
        
        @FOREACH_ROW
        0; JMP

    (LOOP_END)

    @LOOP
    0; JMP

(SET_DATA_TO_ZERO)
    @data
    M = 0

    @SETTING_SCREEN
    0; JMP