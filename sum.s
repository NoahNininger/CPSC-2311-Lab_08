/* Noah Nininger
   CPSC 2311 Widman
   06/18/2023 (given the 6/18 extension)
   Lab 08
*/

    .file "sum.s"
    .text
    .align  2
    .global main
    .type   main, %function

/* main() sums 10 values from stdin and prints the sum */
main:
    push {lr}    // save lr
    
    //Code goes here
    mov r4, #0                      @ initialize sum to 0
    ldr r0, =rdfmt                  @ load scanf
    ldr r1, =input_buffer           @ load input buffer
    mov r2, #10

loop:
    ldr r3, =0
    bl scanf                        @ read number
    add r4, r4, r3                  @ add number to sum
    subs r2, r2, #1
    bne loop 

    ldr r0, =prtfmt                 @ print sum
    mov r1, r4
    bl printf

    pop {pc}         // put lr in pc    

.section    .rodata
    rdfmt:        .asciz "%d"
    prtfmt:       .asciz "sum is %d\n"
    input_buffer: .skip 40
