bits 64
default rel
global main
extern printf

section .data
    format db "30 - 10 = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov eax, 30
    mov ebx, 10
    sub eax, ebx
    lea rcx, [format]
    mov edx, eax
    call printf
    add rsp, 40
    xor eax, eax
    ret