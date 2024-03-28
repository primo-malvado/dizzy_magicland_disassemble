L_0562       equ $0562
L_5E5E       equ $5E5E

        org $5DC0


load_tape:
        ld a, $FF
        ld ($FFFF), a
        ld sp, load_tape
        ld ix, $4000
        ld de, $1B00
        call L_5E28

load_tape_01:
        ld ix, $5E49
        ld de, $51B7
        call L_5E28
        ld ix, $B000
        ld de, $4FFC
        call L_5E28
        ld hl, ($C000)
        push hl
        ld a, $55
        ld ($C000), a
        ld a, $13
        call L_5E3E
        ld a, $AA
        ld ($C000), a
        ld a, $10
        call L_5E3E
        ld a, ($C000)
        and $01
        ld ($728E), a
        pop hl
        ld ($C000), hl
        ld a, ($728E)
        and a
        jp z, L_5E5E
        ld a, $13
        call L_5E3E
        ld ix, $C000
        ld de, $4000
        call L_5E28
        ld a, $10
        call L_5E3E
        jp L_5E5E


L_5E28:
        di
        ld a, $FF
        scf
        inc d
        ex af, af'
        dec d
        call L_0562

        ; Start of unknown area $5E32 to $5E3D
        db $F3, $38, $04, $AF, $32, $FF, $FF, $3E, $00, $D3, $FE, $C9
        ; End of unknown area $5E32 to $5E3D


L_5E3E:
        di
        ld bc, $7FFD
        out (c), a
        ld ($5B5C), a
        ei
        ret



; $5DC0 CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
; $5E10 CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC------------CCCCCCCCCC

; Labels
;
; $0562 => L_0562              L_0562       => $0562
; $5DC0 => load_tape           L_5E28       => $5E28
; $5DD2 => load_tape_01        L_5E3E       => $5E3E
; $5E28 => L_5E28              L_5E5E       => $5E5E
; $5E3E => L_5E3E              load_tape    => $5DC0
; $5E5E => L_5E5E              load_tape_01 => $5DD2


; Check these calls manualy: $0562

