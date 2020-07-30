.global _hello_from_asm
.global _ReadCpuBrandStr
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




.func _ReadCpuBrandStr
_ReadCpuBrandStr:
	push ebp
	mov ebp, esp

	push edi
	mov edi,[ebp+8]

	mov eax,0x80000002
	cpuid
    mov [edi],eax
    mov [edi+4],ebx
    mov [edi+8],ecx
    mov [edi+12],edx
	mov eax,0x80000003
	cpuid
    mov [edi+16],eax
    mov [edi+20],ebx
    mov [edi+24],ecx
    mov [edi+28],edx
	mov eax,0x80000004
	cpuid
    mov [edi+32],eax
    mov [edi+36],ebx
    mov [edi+40],ecx
    mov [edi+44],edx

    pop edi

	mov esp,ebp
	pop ebp
    ret
.endfunc
