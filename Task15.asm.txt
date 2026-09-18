bits 64
default rel
global main
extern printf

section .data
    format db "AL = %d, BL = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 10
    mov bl, 20
    xchg al, bl
    movzx eax, al
    movzx ebx, bl
    lea rcx, [format]
    mov rdx, rax
    mov r8, rbx
    call printf
    add rsp, 40
    xor eax, eax
    ret