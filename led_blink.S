.syntax unified
.cpu cortex-m4
.thumb
.text
.global led_blink

led_blink:
    // GPIOA Clock ON
    LDR R0, =0x40023830
    LDR R1, [R0]
    ORR R1, R1, #1
    STR R1, [R0]

    // PA5 as Output
    LDR R0, =0x40020000
    LDR R1, [R0]
    BIC R1, R1, #(3 << 10)
    ORR R1, R1, #(1 << 10)
    STR R1, [R0]

LOOP:
    // PA5 HIGH
    LDR R0, =0x40020018
    MOVS R1, #(1 << 5)
    STR R1, [R0]
    BL DELAY

    // PA5 LOW
    LDR R0, =0x40020018
    MOVS R1, #(1 << 21)
    STR R1, [R0]
    BL DELAY

    B LOOP

DELAY:
    PUSH {LR}
    LDR R2, =8400000
WAIT:
    SUBS R2, R2, #1
    BNE WAIT
    POP {LR}
    BX LR