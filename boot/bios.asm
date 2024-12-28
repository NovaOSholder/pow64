BITS 16
ORG 0x7C00

start:
    xor ax, ax
    mov ds, ax

    mov si, message
    call print_string

    cli
    hlt

print_string:
    mov ah, 0x0E
.next_char:
    lodsb
    or al, al
    jz .done
    int 0x10
    jmp .next_char
.done:
    ret

message db "Hello, BIOS!", 0

TIMES 510-($-$$) db 0
DW 0xAA55
