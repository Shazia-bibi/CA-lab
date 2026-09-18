bits 64
default rel
global main
extern printf

section .data
    format db "Result = 0x%02X", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 0xAA
    and al, 0x0F
    movzx eax, al
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret