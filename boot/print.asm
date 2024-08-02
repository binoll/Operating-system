; Copyright 2024 binoll
; Print function

print:
; args:
; 1. si - address of str

.loop:
    lodsb
    cmp al, 0x00
    je short .loop_exit
    int 0x10
    jmp short .loop

.loop_exit:
    ret
