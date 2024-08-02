; Copyright 2024 binoll
; Switch to protected mode

bits 16

switch:
    cli                          ; 1. disable interrupts
    lgdt word [gdt_descriptor]   ; 2. load GDT descriptor
    mov eax, cr0
    or eax, 0x00000001           ; 3. enable protected mode
    mov cr0, eax
    jmp far CODE_SEG:init        ; 4. far jump

bits 32

init:
    mov ax, DATA_SEG             ; 5. update segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000             ; 6. setup stack
    mov esp, ebp

    call BEGIN_32BIT             ; 7. move back to mbr.asm
