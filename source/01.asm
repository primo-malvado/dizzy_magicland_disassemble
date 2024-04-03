l_0562       equ $0562
start       equ $5e5e
is_128k equ $728e


        org $5dc0


load_tape:
        ld a, $ff
        ld ($ffff), a
        ld sp, load_tape
        ld ix, $4000
        ld de, $1b00
        call l_5e28
        
        ld ix, $5e49
        ld de, $51b7
        call l_5e28
        ld ix, $b000
        ld de, $4ffc
        call l_5e28
        ld hl, ($c000)
        push hl
        ld a, $55
        ld ($c000), a
        ld a, $13
        call l_5e3e
        ld a, $aa
        ld ($c000), a
        ld a, $10
        call l_5e3e
        ld a, ($c000)
        and $01
        ld (is_128k), a
        pop hl
        ld ($c000), hl
        ld a, (is_128k)
        and a
        jp z, start
        ld a, $13
        call l_5e3e
        ld ix, $c000
        ld de, $4000
        call l_5e28
        ld a, $10
        call l_5e3e
        jp start


l_5e28:
        di
        ld a, $ff
        scf
        inc d
        ex af, af'
        dec d
        call l_0562

        
        defb $f3, $38, $04, $af, $32, $ff, $ff, $3e, $00, $d3, $fe, $c9
        


l_5e3e:
        di
        ld bc, $7ffd
        out (c), a
        ld ($5b5c), a
        ei
        ret

