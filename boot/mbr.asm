; Copyright 2024 binoll
; Master Boot Record

%include "disk.asm"
%include "switch.asm"

bits 16
org 0x7C00

; BIOS sets boot drive in 'dl'
mov byte [boot_drive], dl
; Initialize registers
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, ax
; Setup stack
mov bp, STACK_START
mov sp, bp
;
call switch

STACK_START     equ 0xFFFF
STACK_END       equ 0x7E00
KERNEL_START    equ 0x00100000
KERNEL_END      equ 0x00EFFFFF
boot_drive      db  0

times 510 - ($ - $$) db 0
dw 0xAA55
