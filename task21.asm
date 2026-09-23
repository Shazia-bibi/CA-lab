
global main
extern printf

section .data
    format1 db "AH = 0x%02X, AL = 0x%02X -> AX = 0x%04X", 10, 0
    format2 db "Full EAX after packing = 0x%08X", 10, 0

section .text
main:

    ; Put values into AH and AL
    xor eax, eax
    mov ah, 0x12
    mov al, 0x34

    ; printf(format1, AH, AL, AX)
    lea rcx, [rel format1]
    movzx edx, ah
    movzx r8d, al
    movzx r9d, ax

    ; Windows x64 shadow space
    sub rsp, 40
    call printf
    add rsp, 40

    ; Rebuild EAX
    xor eax, eax
    mov ah, 0x12
    mov al, 0x34

    ; Move AX into upper 16 bits
    shl eax, 16

    ; Put new values into lower bytes
    mov ah, 0x56
    mov al, 0x78

    ; printf(format2, EAX)
    lea rcx, [rel format2]
    mov edx, eax

    sub rsp, 40
    call printf
    add rsp, 40

    ; Return 0
    xor eax, eax
    ret