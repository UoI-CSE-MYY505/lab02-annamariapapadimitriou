
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
# Write your code here!
# Do not remove the prog label or write code above it!

addi t0, zero, -1 #use t0 to loop right amount of times
    
    #initialize s0 and s3 to zero
    add s0, zero, zero
    add s3, zero, zero
loop: 
    addi t0, t0, 1
    beq t0, a1, exitLoop #Loop a2 times to go through all the array
    
    slli t1, s3, 2 #calculate offset
    add t1, t1, a0 #add to the base of the array
    lw t3, 0(t1) #save current array value to t3 (0(t1) = a0[t0])
    addi s3, s3, 1
    
    beq t3, a2, saveAddress #if current array value is save as desired then save value at s0
    j loop

saveAddress:
    add s0, zero, t1 #save address to s0 and continue looping
    j loop
    
exitLoop:

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
