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
STACK_START     equ 0x7BFF
STACK_END       equ 0x500
boot_drive      db  0x0
mem_check       db  "Checking the memory...", 0xA, 0x0
mem_fail        db  "Failed to check the memory!", 0xA, 0x0
mem_succ        db  "Memory checked successfully!", 0xA, 0x0
kern_load       db  "Initializing kernel...",  0xA, 0x0
kern_succ       db  "Kernel loaded successfully!", 0xA, 0x0
kern_fail       db  "Kernel failed to load!", 0xA, 0x0

; Signature
times 510 - ($ - $$) db 0x0
dw 0xAA55
