bits 64
default rel
global main
extern printf

section .data
    number db 0
    format db "Value in memory = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov byte [number], 42
    movzx eax, byte [number]
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret