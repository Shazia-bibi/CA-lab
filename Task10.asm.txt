bits 64
default rel
global main
extern printf

section .data
    format db "After DEC, EBX = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov ebx, 10
    dec ebx
    lea rcx, [format]
    mov edx, ebx
    call printf
    add rsp, 40
    xor eax, eax
    ret