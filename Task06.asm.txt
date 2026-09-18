bits 64
default rel
global main
extern printf

section .data
    format db "EAX = %d, EBX = %d", 10, 0

section .text
main:
    sub rsp, 40
    mov eax, 10
    mov ebx, 20
    add eax, ebx
    lea rcx, [format]
    mov edx, eax
    mov r8d, ebx
    call printf
    add rsp, 40
    xor eax, eax
    ret