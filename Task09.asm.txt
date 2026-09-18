bits 64
default rel
global main
extern printf

section .data
    format db "After INC, EAX = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov eax, 9
    inc eax
    lea rcx, [format]
    mov edx, eax
    call printf
    add rsp, 40
    xor eax, eax
    ret