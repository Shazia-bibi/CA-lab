bits 64
default rel
global main
extern printf

section .data
    format db "Result = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 5
    or al, 8
    movzx eax, al
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret