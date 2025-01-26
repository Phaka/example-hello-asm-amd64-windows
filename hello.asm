; Windows x64 assembly Hello World
; Build with NASM: nasm -f win64 hello.asm
; Link: link /subsystem:console hello.obj

default rel                     ; Use RIP-relative addressing by default

extern ExitProcess             ; Windows API functions
extern GetStdHandle
extern WriteConsoleA

section .data
msg     db      'Hello, World!', 0dh, 0ah    ; Message with CRLF
msglen  equ     $ - msg                      ; Length of message
written dq      0                            ; Must be 64-bit for x64

section .text
global main                                  ; Entry point

main:
    sub     rsp, 40                         ; Reserve shadow space + align stack
    
    ; Get stdout handle
    mov     ecx, -11                        ; STD_OUTPUT_HANDLE
    call    GetStdHandle
    
    ; Write to console
    mov     rcx, rax                        ; Console handle
    lea     rdx, [msg]                      ; Message
    mov     r8d, msglen                     ; Message length
    lea     r9, [written]                   ; Bytes written
    push    0                               ; lpOverlapped parameter
    call    WriteConsoleA
    
    ; Exit program
    xor     ecx, ecx                        ; Exit code 0
    call    ExitProcess

    ; We never get here
    add     rsp, 40                         ; Restore stack
    ret
