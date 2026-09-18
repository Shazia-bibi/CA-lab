bits 64
default rel
global main
extern printf

section .data
    format db "EAX = 0x%08X", 10, 0

section .text
main:
    sub rsp, 40
    mov eax, 0x12345678
    lea rcx, [format]
    mov edx, eax
    call printf
    add rsp, 40
    xor eax, eax
    ret