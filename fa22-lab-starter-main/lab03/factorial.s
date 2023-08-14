.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    li t0, 1 # i = 1
    li t1, 1 # product = 1

loop:
    blt a0, t0, finish
    mul t2, t1, t0 # temp = product * i
    mv  t1, t2     # product = temp
    addi t0, t0, 1 # i++

    j loop
 
finish:
    mv a0, t1
    jr ra
