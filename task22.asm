
global main
extern printf

section .data
    formatRaw db "Raw EFLAGS = 0x%08X", 10, 0
    formatFlags db "Zero Flag (ZF) = %d, Carry Flag (CF) = %d", 10, 0

section .text
main:

    ; EAX = 5 - 5
    mov eax, 5
    sub eax, 5

    ; Save EFLAGS
    pushfq
    pop rbx

    ; printf(formatRaw, EFLAGS)
    lea rcx, [rel formatRaw]
    mov edx, ebx

    sub rsp, 40
    call printf
    add rsp, 40

    ; Get Zero Flag (ZF), bit 6
    mov rcx, rbx
    shr rcx, 6
    and ecx, 1

    ; Get Carry Flag (CF), bit 0
    mov rdx, rbx
    and edx, 1

    ; printf(formatFlags, ZF, CF)
    lea r8, [rel formatFlags]

    ; RCX = format string
    ; RDX = ZF
    ; R8  = CF

    mov r9d, edx
    mov edx, ecx
    mov rcx, r8

    sub rsp, 40
    call printf
    add rsp, 40

    ; Return 0
    xor eax, eax
    ret
