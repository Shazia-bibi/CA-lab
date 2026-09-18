bits 64
default rel
global main
extern printf

section .data
    zeroMessage db "No common 1 bits were found.", 10, 0
    commonMessage db "Common 1 bits were found.", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 0xF0
    mov bl, 0x0F
    test al, bl
    jz no_common_bits

common_bits:
    lea rcx, [commonMessage]
    call printf
    jmp finished

no_common_bits:
    lea rcx, [zeroMessage]
    call printf

finished:
    add rsp, 40
    xor eax, eax
    ret