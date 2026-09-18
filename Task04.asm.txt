bits 64
default rel
global main
extern printf

section .data
    format db "10 + 5 = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 10
    add al, 5
    movzx eax, al
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret