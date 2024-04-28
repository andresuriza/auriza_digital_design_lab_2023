.global _start
_start:
	ldr r4, =y @ Guarda address de y
	ldr r4, [r4] @ Sobreescriba valor de y
	ldr r7, =array @ Guarda address de array
	ldr r10, =final_array
	mov r5, #0 @i
	mov r9, #10 @ len de array
loop:
	cmp r5, #10 @ Si i se pasa de 10
	beq end
    ldr r8, [r7], #4 @ Carga valor de array
	cmp r8, r4
	bge multi @ Si array[i] es mayor o igual a y
	add r8, r8, r4
	add r5, r5, #1 @ i++
	sub r9, r9, #1 @ Se reduce array
	str r8, [r10], #4 @ Guarda resultado en r8
	b loop
	
multi:
	mul r8, r8, r4
	add r5, r5, #1 @ i++
	sub r9, r9, #1 @ Se reduce array
	str r8, [r10], #4  @ Guarda resultado en r8
	b loop
end:

.data
array: .word 1,2,3,4,5,6,7,8,9,10
y: .word 7
final_array: .word 0,0,0,0,0,0,0,0,0,0