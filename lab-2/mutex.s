	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	mov r1, locked		@ load locked value
.L1:
	ldrex r2, [r0]
	cmp r2, unlocked 	@ compare to unlocked value, 
	strexeq r2, r1, [r0]	@ if equal(r2 unlocked), store r1 into [r0]
	cmpeq r2, #0		@ if success stored, return 0 to r2. Here to check it
	bne .L1
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ store unlocked value into r1 from [r0] to unlock
        ldr r1, =unlocked
	dmb			@ memory barrier
	str r1, [r0]
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
