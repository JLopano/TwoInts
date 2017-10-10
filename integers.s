
.section .data

/*Intro Prompt*/
intro: .asciz "Hello! Welcome to Two Integers. \n\n"

/*First Integer Request*/
firstRequest: .asciz "Enter an integer for first number: "

/*Second Integer Request*/
secRequest: .asciz "Enter an integer for second number: "

/*Sum Prompt*/
sumPrompt: .asciz "The sum of %d and %d is %d\n\n"

/*Difference Prompt*/
difPrompt: .asciz "The difference of %d and %d is %d\n\n"

/*Product Prompt*/
prodPrompt: .asciz "The product of %d and %d is %d\n\n."

/*First Int*/
first: .word 0

/*Second Int*/
second: .word 0

/*Sum Integer*/
sum: .word 0

/*Difference Integer*/
dif: .word 0

/*Product Integer*/
prod: .word 0

/*Pattern for scanf*/
pattern: .asciz "%d"

.section .text
.global main

main:
	push {lr}			//Saves Original lr

	/*Prints Introduction*/
	ldr r0, =intro			//r0 Contains Pointer to intro
	bl printf			//Calls to printf

	/*Asks & Retrieves First Integer*/
	ldr r0, =firstRequest		//r0 Contains Pointer to firstRequest
	bl printf			//Calls to printf
	ldr r0, =pattern		//r0 Contains Pointer to pattern
	ldr r1, =first			//r1 Contains Pointer to first
	bl scanf			//Calls to scanf

	/*Asks & Retrieves Second Integer*/
	ldr r0, =secRequest		//r0 Contains Pointer to secRequest
	bl printf			//Calls to printf
	ldr r0, =pattern		//r0 Contains Pointer to pattern
	ldr r1, =second			//r1 Contains Pointer to second
	bl scanf			//Calls to scanf

	/*Adds Integers*/
	ldr r0, =first			//r0 Contains Pointer to first
	ldr r0, [r0]			//Dereference r0 to Get Value of First
	ldr r1, =second			//r1 Contains Pointer to second
	ldr r1, [r1]			//Dereference r1 to Get Value of Second
	add r2, r0, r1			//r2 = r0 + r1
	ldr r3, =sum			//r3 Contains Pointer to sum
	str r2, [r3]			//Store sum at Dereferenced Pointer of [r3]

	/*Subtracts Integers*/
	sub r2, r0, r1			//r2 = r0 - r1
	ldr r3, =dif			//r3 Contains Pointer to dif
	str r2, [r3]			//Store dif at Dereferenced Pointer of [r3]

	/*Multiplies Integers*/
	mul r2, r0, r1			//r2 = r0 * r1
	ldr r3, =prod			//r3 Contains Pointer to prod
	str r2, [r3]			//Store prod at Dereferenced Pointer of [r3]

	/*Prints Sum*/
	ldr r0, =sumPrompt		//r0 Contains Pointer to sumPrompt
	ldr r1, =first			//r1 Contains Pointer to first
	ldr r1, [r1]			//Dereference r1 to Get Value of first
	ldr r2, =second			//r2 Contains Pointer to second
	ldr r2, [r2]			//Dereference r2 to Get Value of second
	ldr r3, =sum			//r3 Contains Pointer to sum
	ldr r3, [r3]			//Dereference r3 to Get Value of sum
	bl printf			//Calls to printf

	/*Prints Difference*/
	ldr r0, =difPrompt		//r0 Contains Pointer to difPrompt
	ldr r1, =first			//r1 Contains Pointer to first
	ldr r1, [r1]			//Dereference r1 to Get Value of first
	ldr r2, =second			//r2 Contains Pointer to second
	ldr r2, [r2]			//Dereference r2 to Get Value of second
	ldr r3, =dif			//r3 Contains Pointer to dif
	ldr r3, [r3]			//Dereference r3 to Get Value of dif
	bl printf			//Calls to printf

	/*Prints Product*/
	ldr r0, =prodPrompt		//r0 Contains Pointer to prodPrompt
	ldr r1, =first			//r1 Contains Pointer to first
	ldr r1, [r1]			//Dereference r1 to Get Value of first
	ldr r2, =second			//r2 Contains Pointer to second
	ldr r2, [r2]			//Dereference r2 to Get Value of second
	ldr r3, =prod			//r3 Contains Pointer to prod
	ldr r3, [r3]			//Dereference r3 to Get Value of prod
	bl printf			//Calls to printf

	mov r0, #0
	pop {pc}
