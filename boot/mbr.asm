; Copyright 2024 binoll
; Master Boot Record

%include "boot/disk.asm"
%include "boot/switch.asm"

bits 16
org 0x7C00

; BIOS sets boot drive in 'dl'
mov byte [boot_drive], dl

; Setup stack
mov bp, STACK_START
mov sp, bp

; Setup GDT
call setup

; Errors


; Variables
STACK_START         equ 0x7BFF
STACK_END           equ 0x0500
boot_drive          db  0x00
str_memory_error    db  "Memory error! The OS cannot be loaded!", 0x00

; Signature
times 510 - ($ - $$) db 0x00
dw 0xAA55
