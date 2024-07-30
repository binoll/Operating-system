; Master Boot Record x86
bits 16
org 0x7c00

; Initialize segment registers
xor ax, ax
mov ds, ax

; Set up registers for the string output
mov si, message
cld
mov ah, 0x0e
xor bh, bh

print_loop:
    lodsb
    cmp al, 0x0
    je print_loop_exit
    int 0x10
    jmp print_loop

print_loop_exit:
    jmp $

message: db 'Hello user!', 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa
