// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// init R2 (result) = 0
@R2
M = 0

// if R0 == 0 || R1 == 0, then leaves
@R0
D = M
@END
D; JEQ

@R1
D = M
@END
D; JEQ

@count
M = 0

(LOOP)
    // if count >= R1, then breaks
    @count
    D = M
    @R1
    D = D - M;
    @END
    D; JGE

    @R0
    D = M
    @R2
    M = D + M

    @count
    M = M + 1

    @LOOP
    0; JMP

(END)
    @END
    0; JMP