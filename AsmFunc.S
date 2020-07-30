.global _hello_from_asm

.extern _printf
.intel_syntax noprefix
.intel_mnemonic
.section .data

hello1:
.asciz "Hello from ASM."

.section .text
.func _hello_from_asm
_hello_from_asm:
	push ebp
	mov ebp, esp
	mov ebx, 5
lp:
	cmp ebx,0
	je lpEnd
	dec ebx
	push [ebp+8]  // Move value of parameter 1 into stack
	call _printf
	add esp,4
	push [ebp+12]   // Move value of parameter 2 into stack
	call _printf
	add esp,4
	jmp lp
lpEnd:
	mov esp,ebp
	pop ebp
    ret
    .endfunc
