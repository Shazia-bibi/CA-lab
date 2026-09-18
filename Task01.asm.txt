bits 64
default rel
global main
extern printf

section .data
    format db "Value in AL = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 10
    movzx eax, al
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret