        .ORIG x3000            ; Start program at x3000

        AND R1, R1, #0         ; Clear R1 (initialize sum to 0)

        LEA R2, NUM_START      ; Load base address of numbers into R2 (starting at x3100)
        LD R3, COUNT           ; Load the count of numbers (10) into R3

LOOP    LDR R4, R2, #0         ; Load the number from memory (address in R2)
        ADD R1, R1, R4         ; Add the current number to the sum
        ADD R2, R2, #1         ; Move to the next memory location
        ADD R3, R3, #-1        ; Decrement the count
        BRp LOOP               ; If count > 0, repeat the loop

        ST R1, RESULT          ; Store the sum in memory at x310A
        HALT                   ; Stop the program

RESULT  .FILL x310A            ; Memory location to store the sum
COUNT   .FILL #10              ; Number of elements to sum
NUM_START .FILL x3100          ; Starting memory address of the numbers

        .END                    ; End of the program
