; Copyright 2024 binoll

bits 16

func switch:
    cli                     ; disable interrupts
    lgdt [gdt_descriptor]   ; load GDT descriptor
    mov eax, cr0
    or eax, 0x1             ; enable protected mode
    mov cr0, eax
    jmp CODE_SEG:init ; far jump

bits 32

func init:
    mov ax, DATA_SEG        ; update segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ebp, 0x90000        ; setup stack
    mov esp, ebp
    call BEGIN_32BIT        ; move back to mbr.asm
