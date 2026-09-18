bits 64
default rel
global main
extern printf

section .data
    number db 10
    format db "New memory value = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov bl, 5
    add byte [number], bl
    movzx eax, byte [number]
    lea rcx, [format]
    mov rdx, rax
    call printf
    add rsp, 40
    xor eax, eax
    ret