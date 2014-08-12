	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, lr}

	mov r3, 0
	mov r4, 1
	subs r0, r0, 0
	ble .f0
	subs r0, r0, 1
	ble .fx
.L1:
	add r5, r4, r3
	mov r3, r4
	mov r4, r5

	adds r0, r0, -1
	cmp r0, 0
	bgt .L1
	ble .fx
.f0:
	mov r0, r3
	pop {r3, r4, r5, pc}
.fx:
	mov r0, r4
	pop {r3, r4, r5, pc}
	.size fibonacci, .-fibonacci
	.end
