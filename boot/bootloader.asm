BITS 16
ORG 0x7C00

start:
    xor ax, ax
    mov ss, ax
    mov sp, 0x7C00

    mov si, boot_message
    call print_string

    mov ah, 0x02
    mov al, 0x01
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    mov dl, 0x00
    mov bx, 0x0600
    int 0x13

    jc load_failed

    jmp 0x0600:0x0000

load_failed:
    mov si, error_message
    call print_string
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

boot_message db "Booting...", 0
error_message db "Disk read error!", 0

TIMES 510-($-$$) db 0
DW 0xAA55
