@ ARM Assembly - Lab 1
@ E Number : E/17/006
@ Name : A. M. H. H. Alahakoon

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	ldr r0, =array_a
	ldr r1, =array_b
	mov r2, #3
	mov r3, #7
	mov r4, #10

	
	@ Write YOUR CODE HERE
	@ b[4] = 6 + a[9] - a[3] + b[1] – ( c + d - e )
	@ Base address of a in r0
	@ Base address of b in r1
	@ c,d,e in r2,r3,r4 respectively 

	@ ---------------------

	ADD r5,r2,r3; 		//r5=c+d
	SUB r5,r5,r4;   	//r5 = c+d-e
	LDR r6,[r0,#12];	//r6=a[3]
	LDR r7,[r0,#36];	//r7=a[9]
	LDR r8,[r1,#4];		//r8=b[1]
	ADD r7,r7,#6;		//r7=a[9]+6 (b[1])
	SUB r6,r7,r6;		//r6=a[9]+6-a[3]
	ADD r6,r6,r8;		//r6=6+a[9]-a[3]+b[1]
	SUB r6,r6,r5;		//r6=6-a[3]+a[9]+b[1]-(c+d-e)
	STR r6,[r1,#16];	//store r6 in b[4]
 
	

	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	ldr r2, =array_b
	ldr r1, [r2,#16]
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	
	
	.data	@ data memory
	
format: .asciz "The Answer is %d (Expect -3 if correct)\n"
	
	@array called array_a of size 40 bytes
	.balign 4 			@align to an address of multiple of 4
array_a: .word 1,5,7,67,5,54,65,23,34,54

	@array called array_b of size 20 bytes
	.balign 4 			@align to an address of multiple of 4
array_b: .word 7,4,8,3,5
