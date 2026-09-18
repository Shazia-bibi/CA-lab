bits 64
default rel
global main
extern printf

section .data
    format db "20 - 5 = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 20
    sub al, 5
    movzx eax, al
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret