bits 64
default rel
global main
extern printf

section .data
    equalMessage db "The numbers are equal.", 10, 0
    notEqualMessage db "The numbers are not equal.", 10, 0

section .text
main:
    sub rsp, 40
    mov al, 10
    mov bl, 10
    cmp al, bl
    je numbers_are_equal

numbers_are_not_equal:
    lea rcx, [notEqualMessage]
    call printf
    jmp finished

numbers_are_equal:
    lea rcx, [equalMessage]
    call printf

finished:
    add rsp, 40
    xor eax, eax
    ret