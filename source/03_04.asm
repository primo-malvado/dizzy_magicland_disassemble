color_attribute_temp equ $5de4
screen_memory_map equ $5c64
espelho_bytes equ $5b00

        org $5E49


        
        defb $0C, $11, $CD, $3E, $5E, $21, $00
        defb $C0, $11, $00, $40, $01, $00, $1B, $ED, $B0, $3E, $10, $CD, $3E, $5E
        

start:
        di
        ld sp, numero_de_sprites_por_nivel

        ld hl, espelho_bytes

        _do 
                ld a, l
                ld b, $08


                _do

                        rra
                        rl c
                
                _djnz

                ld (hl), c
                inc l
        _while nz

        ld hl, screen_memory_map
        ld de, $4000
        ld b, $C0

        _do

                ld (hl), e
                inc hl
                ld (hl), d
                inc hl
                inc d
                ld a, d
                and $07

                _if_not nz

                        ld a, e
                        add a, $20
                        ld e, a
                        _if_not c
                                ld a, d
                                sub $08
                                ld d, a
                        _end_if
                _end_if
        
        _djnz

        xor a
        out ($FE), a
        im 2
        ld a, $FE
        ld i, a
        ld bc, $5000


        _do

                in a, ($1F)
                or c
                ld c, a
                ei
                halt
                di
        
        _djnz

        ld a, c
        and $E0
        ld a, $FF

        _if_not z
                xor a
        _end_if

        ld ($728F), a
        ei

        jp restart_game


        ; Start of unknown area $5EB3 to $6043
        defb $63, $22, $D6, $5E, $7A, $32, $FA, $5D, $F1, $08, $E1, $7C, $ED
        defb $47, $7D, $ED, $4F, $F1, $FD, $E1, $DD, $E1, $C1, $D1, $E1, $D9, $C1, $D1, $E1
        defb $ED, $7B, $14, $5F, $00, $CD, $00, $50, $C3, $D6, $5D, $DB, $3F, $AA, $0F, $38
        defb $FA, $DB, $1F, $5F, $7A, $D3, $3F, $EE, $81, $57, $C9, $D3, $1F, $7A, $D3, $3F
        defb $EE, $81, $57, $DB, $3F, $AA, $0F, $30, $FA, $C9, $23, $5E, $78, $08, $31, $00
        defb $40, $10, $3A, $5C, $C0, $E2, $FD, $7F, $9B, $36, $58, $27, $FD, $7F, $00, $00
        defb $00, $A1, $2B, $2D, $A8, $5D, $C1, $FB, $C9, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $A8, $00, $00, $00, $69, $CF, $96, $01
        defb $01, $FD, $7F, $ED, $79, $11, $00, $C0, $21, $00, $61, $01, $00, $40, $ED, $B0
        defb $01, $FD, $7F, $3E, $10, $ED, $79, $C9, $3E, $13, $18, $E4, $3E, $11, $18, $E0
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00
        ; End of unknown area $5EB3 to $6043



        include "image_mask.asm"

after_mask_images:
        defb $01

        ; Start of unknown area $728F to $7290
        defb $00
        defb $01
        ; End of unknown area $728F to $7290


restart_game:
        ld hl, color_attribute_temp
        ld de, $5DE5
        ld bc, $025F
        ld (hl), $42
        ldir
        ld a, $01
        ld ($9D27), a
        xor a
        ld (nivel), a
        call L_9458
        ld hl, texts
        call L_9141
        ld a, $46
        ld (apenas_brite_and_ink), a
        ld a, $1B
        ld e, $3A
        ld l, $3C
        call L_8D51
        call L_8DD7
        call desenha_sprite
        xor a
        ld ($9D46), a
        ld a, ($FFFF)
        and a

        _if_not nz
                ld hl, $FF9C
                call L_9141
        _end_if

        _do 
                call L_93AB
                and $09
        _while z

        ld a, $FF
        ld ($9D46), a
        call L_88A0
        call L_95D5
        call L_9905
        ld a, $03
        ld ($9D2D), a
        ld de, $781D
        ld (posicao_hero_x_em_nibbles), de
        ld a, $53
        ld (sera_o_nivel_copia_3), a
        ld ($9D41), a

L_72FD:
        call L_A196
        call L_9607
        ld a, $01
        ld ($9D46), a
        ld hl, $0000
        ld ($9D2E), hl

L_730E:
        xor a
        ld ($9D32), a
        dec a
        ld ($9D4C), a
        ld hl, $9D31
        dec (hl)

        
        jp p, L_7330 ;  _if_not p
                inc (hl)
                ld a, ($9D16)
                and a
                _if_not nz
                        ld a, ($9D30)
                        bit 3, a
                        _if_not z
                                ld a, $FF
                                ld ($9D32), a
                        _end_if
                _end_if
        ;_end_if
L_7330:
        call L_895C
        call L_962C
        call L_8A55
        call L_9709
        call L_8B87
        call L_8C18
        call L_8CC1
        call L_8A92
        call playsound
        ld bc, (nivel)
        ld a, c
        cp b
        _if_not z
                cp $2A
                _if_not nz
                        ld a, (posicao_hero_x_em_nibbles_copia_2)
                        add a, $20
                        ld l, a
                        ld a, ($9D0E)
                        sub $0A
                        ld h, a
                        ld ($8B7D), hl

                _end_if
                call L_A26B
        _end_if

        ld a, ($940A)
        cp $FD
        _if_not z

                _do
                        ld bc, ($9D2E)
                        ld a, b
                        sub c
                        cp $03
                _while c


                ld a, b
                ld ($9D2E), a
                ld a, ($9D41)
                and a
                jr z, L_73C3
                ld a, ($9D4C)
                ld ($9D4B), a
                ld a, ($9D2C)
                and a
                jp nz, L_730E ; jp não mexer
                ld a, ($9D44)
                and a
                jp nz, L_730E ; jp não mexer
                ld a, $01
                ld ($9D27), a
                ld hl, $F85E
                call L_9141
                ld hl, ($9D28)
                call L_9141
                ld a, $FF
                ld ($9D46), a
                call L_73E5
                call L_9C7B

                ld hl, $9D2D
                dec (hl)
                jp nz, L_72FD ; jp não mexer

        _end_if

        ld a, $FF
        ld ($9D46), a
        jp restart_game  ; jp não mexer


L_73C3:
        ld a, $01
        ld ($9D27), a
        ld a, $02
        ld (nivel), a
        call L_9458
        ld hl, $F231
        call L_9141
        call L_73E5
        call L_9458
        call L_99C4
        jp restart_game ; jp não mexer


        ; Start of unknown area $73E2 to $73E4
        defb $CD, $41, $91
        ; End of unknown area $73E2 to $73E4


L_73E5:
        _do
                call L_93AB
                and a
        _while nz

        _do 
                call playsound
                call L_93AB
                and a
        _while z
        ret


L_73F5:
        set 5, (ix+$0A)
        call L_7401
        res 5, (ix+$0A)
        ret


L_7401:
        push ix
        ld a, (ix+$04)
        ld e, (ix+$02)
        ld l, (ix+$03)
        ld (next_sprite_index), a
        ld a, e
        ld (sprite_left), a
        ld a, l
        ld (sprite_top), a
        ld a, (ix+$0A)
        and $47
        ld (apenas_brite_and_ink), a
        ld a, (ix+$0A)
        rlca
        and $01
        ld (sprite_espelho), a
        ld a, (ix+$0A)
        and $08
        rrca
        rrca
        rrca
        ld ($743E), a
        call function_print_sprite
        bit 5, (ix+$0A)
        call z, L_7453
        ld a, $01
        ld (background_color), a
        call desenha_sprite
        pop ix
        push ix
        bit 5, (ix+$0A)
        call nz, L_745F
        pop ix
        ret


L_7453:
        bit 4, (ix+$0A)
        ret nz
        xor a
        ld (background_color), a
        jp L_8DD7


L_745F:
        bit 4, (ix+$0A)
        ret nz
        xor a
        ld (background_color), a
        ld a, $47
        ld (apenas_brite_and_ink), a
        jp L_8DD7


        include "dados_mapa.asm"

function_index:
        defw function_88F1, L_7401, function_88F1, L_7401, L_7401, L_7401, L_7401, L_7401, function_7B9C, L_7401, L_7401, function_83A6, function_862C, function_7C4E, L_7401, L_7401, L_7401, L_7401, function_7E8F, function_8091, function_81F8, L_7401, L_7401, L_7401, L_7401, L_7401, function_7C23, L_7401, function_7D74, function_7D74, function_7D74, function_8268, L_7401, function_833F, function_8306

function_index_04:
        defw function_88F1, function_88F1, function_7A6A, function_7B6E, function_887D, function_7B85, function_880C, function_7A6A, function_7A6A, function_7BBA, function_7C9B, function_83B4, function_8637, function_7C56, function_7D43, function_7E57, function_7F26, function_8107, function_7E94, function_809C, function_822D, function_8134, function_8189, function_81C4, function_8737, function_7BC6, function_7C4D, function_7CF0, function_7DFA, function_7DB1, function_7D7A, function_8298, function_82D8, function_834B, function_88F1, $0000, $0000, $0000, $0000, $0000

function_7A6A:
        ld a, ($9D32)
        and a
        ret z
        call L_8998
        ret nc
        xor a
        ld ($9D32), a
        ld a, (ix+$04)
        cp $07
        jp z, L_7B24 ; jp não mexer
        cp $0B
        jp z, L_7AE1 ; jp não mexer
        cp $0F
        jp z, L_7B04 ; jp não mexer
        cp $13
        jp z, L_7AED ; jp não mexer
        cp $1D
        _if_not c
                cp $27
                jp c, L_7B32 ; jp não mexer
        _end_if
L_7A97:
        ld hl, $8CBD
        ld b, $00

        _do
                ld a, (hl)
                cp $01
                jr z, L_7AC0
                and a
                jr z, L_7AA8 ; break
                inc hl
                inc b
        _while_true


L_7AA8:
        _do

                ld a, b
                and a
                jr z, L_7AB3 ;; break
                dec hl
                ld a, (hl)
                inc hl
                ld (hl), a
                dec hl
        
        _djnz


L_7AB3:
        ld a, ($9D40)
        ld ($8CBD), a

L_7AB9:
        ld (ix), $FF
        jp L_9725 ; jp não mexer


L_7AC0:
        _do
                dec hl
                ld a, (hl)
                cp $4E
                
                _continue_if z 
                
                cp $4D
                
        _while z
        ld ($9D34), a
        push ix
        push bc
        call L_9826
        call L_9867
        pop bc
        pop ix
        dec b
        ld a, $01
        ld ($9D33), a
        jr L_7AA8


L_7AE1:
        push ix
        ld hl, $EBE6
        call L_96EC
        pop ix
        jr L_7A97


L_7AED:
        ld a, (dados_mapa_4)
        inc a
        jr z, L_7A97
        push ix
        ld a, $FF
        ld (dados_mapa_4), a
        ld hl, $F605
        call L_96EC
        pop ix
        jr L_7A97


L_7B04:
        ld a, $4D
        call L_96FA
        _if_not z
                ld hl, $F41E
                jp L_96EC ; jp não mexer
        _end_if

        ld (hl), $4E
        push ix
        ld a, $FF
        ld (dados_mapa_77), a
        ld hl, $F451
        call L_96EC
        pop ix
        jr L_7AB9


L_7B24:
        ld a, $42
        call L_96FA
        jp nz, L_7A97 ; jp não mexer
        ld a, $FF
        ld ($9D32), a
        ret


L_7B32:
        sub $1D
        ld hl, $7A60
        ld c, a
        ld b, $00
        add hl, bc
        ld a, $FF
        ld ($9D32), a
        ld a, (hl)
        ld (hl), $01
        and a
        ret nz
        xor a
        ld ($9D32), a
        ld l, (ix+$05)
        ld h, (ix+$06)

L_7B4F:
        ld a, $01
        ld ($9D27), a
        call L_9141

        _do 
                call L_73E5
                call L_924F
                ld hl, (posicao_onde_comeca_o_nome_do_nivel)
                dec hl
                ld (posicao_onde_comeca_o_nome_do_nivel), hl
                cp $FF
                jp z, L_A287 ; jp não mexer
                call L_9152
        _while_true


function_7B6E:
        inc (ix+$07)
        ld a, (ix+$07)
        cp $15
        jp nz, function_7A6A
        ld (ix+$07), $00
        ld a, $D6
        call L_83F9
        jp function_7A6A


function_7B85:
        inc (ix+$09)
        ld a, (ix+$09)
        cp $15
        jp nz, function_7A6A
        xor a
        ld (ix+$09), a
        ld a, $CF
        call L_83F9
        jp function_7A6A


function_7B9C:
        ld (ix+$04), $73
        ld a, (ix+$03)
        push af
        sub $0D
        ld (ix+$03), a
        call L_7401
        call L_89E0
        pop af
        ld (ix+$03), a
        ld (ix+$04), $13
        jp L_7401


function_7BBA:
        call L_8998
        ret nc
        ld a, $01
        ld hl, $F9D7
        jp L_8A30


function_7BC6:
        ld hl, $7848
        ld de, $3010
        call L_89B1
        ret nc
        ld a, (ix+$09)
        ld hl, function_index_02
        jp function_jump_to_hl_plus_2a


function_index_02:
        defw function_index_02_01, function_index_02_02, function_index_02_03, function_index_02_04

function_index_02_01:
        inc (ix+$09)
        ld a, $70
        ld (dados_mapa_84), a
        ld hl, $F0B1
        jp L_7B4F


function_index_02_02:
        ld a, ($7974)
        and a
        _if_not nz
                ld a, $55
                call L_96FA
                ret nz
                inc (ix+$09)
                ld hl, $F15B
                jp L_96EC
        _end_if

function_index_02_03:
        ld a, ($7974)
        and a
        ret z
        ld (ix+$09), $03
        ld hl, $F19D
        jp L_7B4F


function_index_02_04:
        ld a, ($9D2A)
        cp $1E
        ret c
        xor a
        ld ($9D41), a
        ld hl, $F1F7
        jp L_96EC


function_7C23:
        ld hl, $7C43
        ld (ix+$04), $DD
        ld b, $05

        _do
                ld a, (hl)
                inc hl
                ld (ix+$02), a
                ld a, (hl)
                ld (ix+$03), a
                inc hl
                push hl
                push bc
                call L_7401
                pop bc
                pop hl
                inc (ix+$04)
        _djnz 

        ret


        ; Start of unknown area $7C43 to $7C4C
        defb $30, $56, $2C, $4D, $28, $6A, $30, $81, $2A, $8B
        ; End of unknown area $7C43 to $7C4C


function_7C4D:
        ret


function_7C4E:
        ld a, (dados_mapa_2)
        inc a
        ret z
        jp L_7401


function_7C56:
        ld a, (dados_mapa_2)
        inc a
        ret z
        call L_7401
        ld a, (ix+$03)
        add a, $04
        cp $AA
        _if_not c
                ld a, (ix+$0C)
                ld (ix+$02), a
                inc (ix+$09)
                ld a, (ix+$0D)
        _end_if

        ld (ix+$03), a
        dec (ix+$05)
        _if_not nz
                inc (ix+$02)
                ld a, (ix+$09)
                and $03

                _if_not nz
                        ld a, $02
                _end_if

                ld (ix+$05), a
        _end_if

        call L_8998
        jp nc, L_7401
        ld a, $04
        ld hl, $F919
        call L_8A30
        jp L_7401


function_7C9B:
        call L_7401
        dec (ix+$09)
        jp p, L_7CB4
        ld a, $FF
        ld (ix), a
        ld (ix+$0A), $47
        ld a, (ix+$07)
        ld (ix+$01), a
        ret


L_7CB4:
        ld a, (ix+$09)
        srl a
        ld e, a
        ld d, $00
        ld hl, index_001
        add hl, de
        ld a, (hl)
        ld (ix+$04), a
        jp L_7401


index_001:
        defb $3A, $FC, $FD, $FE, $FF, $FE, $FD, $FC

L_7CCF:
        push ix
        push hl
        pop ix
        ld a, (ix+$01)
        ld (ix+$07), a
        ld (ix+$01), $0A
        ld (ix+$04), $FC
        ld (ix+$0A), $5C
        ld (ix+$09), $10
        call L_7401
        pop ix
        ret


function_7CF0:
        ld a, (ix+$09)
        _if_not z
                dec (ix+$09)
                _if_not nz
                        ld (ix+$04), $7D
                        call L_7401
                _end_if
        _end_if

        ld a, (dados_mapa_26)
        cp (ix)
        ret z
        call L_7401
        ld (ix+$04), $7C
        ld (ix+$09), $05
        call L_7401
        ld a, (ix)
        ld (dados_mapa_26), a
        ld a, $FC
        ld ($75FC), a
        ld a, (ix+$07)
        xor $02
        ld (ix+$07), a
        dec a
        ld ($75FB), a
        ld l, (ix+$02)
        inc l
        ld h, (ix+$03)
        ld ($75F8), hl
        push ix
        ld ix, dados_mapa_26
        call L_7401
        pop ix
        ret


function_7D43:
        call L_73F5
        ld a, (ix+$05)
        add a, (ix+$02)
        ld (ix+$02), a
        inc (ix+$06)
        ld a, (ix+$03)
        add a, (ix+$06)
        ld (ix+$03), a
        cp $C0
        _if_not nc
                call L_7401
                call L_8998
                ret nc
                ld a, $02
                ld hl, $F93A
                jp L_8A30
        _end_if

        ld a, $FF
        ld (ix), a
        ret


function_7D74:
        call prepara_dados_mapa
        jp L_7401


function_7D7A:
        ld a, ($9D0E)
        cp $8C
        ret nc
        call L_7FBB
        push bc
        call L_7401
        ld a, $DF
        sub (ix+$04)
        ld (ix+$04), a
        pop bc
        ld a, (ix+$02)
        bit 0, c

        _if_not nz
                dec a
                dec a
        _end_if

        inc a
        ld (ix+$02), a
        call L_7401
        call L_8998
        ret nc
        ld a, ($9D2B)
        and a
        ret z
        ld hl, $F8CC
        ld a, $FF
        jp L_8A30


function_7DB1:
        ld a, ($9D0E)
        cp $AF
        _if_not nz
                ld a, $4E
                call L_96FA
                _if_not z
                        ld a, (ix+$02)
                        cp $51
                        _if_not nc
                                ld b, a
                                ld a, (posicao_hero_x_em_nibbles_copia_2)
                                add a, $20
                                cp b
                                _if_not c
                                        call L_73F5
                                        inc (ix+$02)
                                        call L_7401
                                _end_if
                        _end_if
                _end_if
        _end_if

        call L_8998
        ret nc
        ld a, ($9D2B)
        and a
        ret z
        ld a, $4E
        call L_96FA
        ld hl, $F9B7
        ld a, $FF
        jp nz, L_8A30
        ld hl, dados_mapa_40
        call L_7CCF
        ld hl, $F68B
        jp L_96EC


function_7DFA:
        call L_7FBB
        push bc
        ld a, $4C
        call L_96FA
        pop bc
        _if_not nz
                ld a, c
                and a
                _if_not z
                        xor $03
                        ld c, a
                _end_if
        _end_if

        ld a, (ix+$02)
        cp $26

        _if_not nc
                res 1, c        
        _end_if

        cp $54

        _if_not c
                res 0, c
        _end_if

        ld a, c
        and a
        _if_not z
                push bc
                call L_7401
                pop bc
                ld a, (ix+$02)
                bit 0, c
                
                _if_not nz
                        dec a
                        dec a

                _end_if

                inc a
                ld (ix+$02), a
                call L_7401

        _end_if

        call L_8998
        ret nc
        ld bc, (nivel)
        ld a, b
        cp c
        ret nz
        ld a, ($9D2B)
        and a
        ret z
        push ix
        ld hl, $F7EB
        call L_96EC
        pop ix
        ld hl, $F9A9
        ld a, $FF
        jp L_8A30


function_7E57:
        call L_73F5
        inc (ix+$06)
        ld a, (ix+$03)
        add a, (ix+$06)
        ld (ix+$03), a
        cp $C0
        _if_not c
                ld a, $32
                ld (ix+$03), a
                ld a, (posicao_hero_x_em_nibbles_copia_2)
                add a, $23
                add a, (ix+$02)
                srl a
                ld (ix+$02), a
                xor a
                ld (ix+$06), a
        _end_if

        call L_7401
        call L_8998
        ret nc
        ld a, $02
        ld hl, $F94D
        jp L_8A30


function_7E8F:
        xor a
        ld (ix+$09), a
        ret


function_7E94:
        ld a, (dados_mapa_89)
        cp (ix)
        ret z
        ld a, (dados_mapa_90)
        cp (ix)
        ret z
        ld a, (dados_mapa_91)
        cp (ix)
        ret z
        ld a, (dados_mapa_18)
        cp (ix)
        ret z
        ld a, (ix+$09)
        and a
        _if_not nz
                ld l, (ix+$05)
                ld h, (ix+$06)
                push hl
                inc hl
                inc hl
                ld a, (hl)
                cp (ix)
                _if_not nz
                        ld (ix+$04), $94
                        dec hl
                        ld b, (hl)
                        ld (ix+$03), b
                        dec hl
                        ld a, (hl)
                        ld (ix+$02), a
                        add a, $20
                        ld e, a
                        ld l, b
                        call L_9106
                        ld a, (hl)
                        and $07
                        cp $06
                        _if_not nz
                                call L_7401
                                inc (ix+$09)
                        _end_if
                _end_if

                pop hl
                inc hl
                inc hl
                inc hl
                dec (ix+$07)
                _if_not nz
                        ld hl, $FFA2
                        ld (ix+$07), $1E
                _end_if

                ld (ix+$05), l
                ld (ix+$06), h
                ret

        _end_if

        call L_7401
        ld a, (ix+$09)
        and $07
        cp $07
        _if_not z
                inc (ix+$09)
                ld hl, $7F1F
                ld e, a
                ld d, $00
                add hl, de
                ld a, (hl)
                ld (ix+$04), a
                jp L_7401
        _end_if


        ld (ix+$09), $00
        ret


        ; Start of unknown area $7F20 to $7F25
        defb $95, $96, $97, $96, $95, $94
        ; End of unknown area $7F20 to $7F25


function_7F26:
        call L_7F9A
        call L_801B
        call L_8051
        call L_7FCA
        call L_7FF5
        call L_8998
        _if_not nc
                ld hl, $F962
                ld a, (ix+$0E)
                cp $98
                _if_not z
                        ld hl, $F998
                        cp $64
                        _if_not z
                                ld hl, $F983
                        _end_if
                _end_if
                
                ld a, $01
                call L_8A30

        _end_if

        call L_7401
        ld a, (ix+$0E)
        cp $73


        _if_not nz
                ld a, (ix+$0A)
                xor $80
                ld (ix+$0A), a
        _else

                cp $64
                _if_not nz
                        inc (ix+$09)
                        ld a, (ix+$09)
                        and $03
                        cp $03

                        _if_not nz
                                ld a, $01
                        _end_if


                        add a, (ix+$0E)
                        ld (ix+$04), a

                _end_if

                cp $98
                
                _if_not nz
                        ld a, $31
                        sub (ix+$04)
                        ld (ix+$04), a
                _end_if
        _end_if

        ld a, (ix+$05)
        ld (ix+$02), a
        ld a, (ix+$06)
        ld (ix+$03), a
        jp L_7401


L_7F9A:
        ld a, (ix+$04)
        ld (next_sprite_index), a
        call function_print_sprite
        ld b, $00
        ret


L_7FA6:
        ld hl, list_003
        ld e, a
        ld d, $00
        add hl, de
        ld a, (hl)
        ret


list_003:
        defb $00, $00, $00, $00, $05, $0A, $05, $0A, $0A, $0A, $05, $05

L_7FBB:
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        ld c, $00
        add a, $20
        cp (ix+$02)
        ret z
        inc c
        ret nc
        inc c
        ret


L_7FCA:
        ld a, (ix+$07)
        and $0C
        ld e, a
        ld a, b
        and $0C
        srl a
        srl a
        or e
        call L_7FA6
        and $0C
        ld c, a
        ld a, (ix+$07)
        and $03
        add a, a
        add a, a
        ld e, a
        ld a, b
        and $03
        or e
        call L_7FA6
        and $03
        or c
        ld c, a
        ld (ix+$07), c
        ret


L_7FF5:
        ld c, (ix+$07)
        ld e, (ix+$02)
        ld a, (ix+$03)
        rr c

        _if_not nc
                inc e
        _end_if

        rr c
        
        _if_not nc
                dec e
        _end_if
        
        rr c
        
        _if_not nc
                add a, $04
        _end_if


        rr c
        _if_not nc
                sub $04
        _end_if

        ld (ix+$05), e
        ld (ix+$06), a
        ret


L_801B:
        ld a, (altura_sprite_a_desenhar)
        srl a
        add a, (ix+$03)
        ld l, a
        ld a, (ix+$02)
        ld c, a
        sub $21
        ld e, a
        call L_9106
        ld de, $0544
        add hl, de
        ld a, c
        cp $28
        _if_not c
                bit 6, (hl)
                jr nz, L_803D
        _end_if
        set 1, b

L_803D:
        ld a, c
        cp $5A
        _if_not nc
                ld a, (largura_sprite_a_desenhar)
                srl a
                add a, l
                ld l, a
                inc l
                bit 6, (hl)
                jr nz, L_8050

        _end_if

        set 0, b

L_8050:
        ret


L_8051:
        ld a, (largura_sprite_a_desenhar)
        srl a
        srl a
        add a, (ix+$02)
        sub $1F
        ld e, a
        ld a, (ix+$03)
        ld c, a
        sub $04
        ld l, a
        call L_9106
        ld de, $0544
        add hl, de
        ld a, c
        cp $3C
        _if_not c
                bit 6, (hl)
                jr nz, L_8077
        _end_if
        set 3, b

L_8077:
        ld a, c
        cp $A0
        _if_not nc
                ld a, (altura_sprite_a_desenhar)
                and $F8
                add a, $04
                ex de, hl
                ld l, a
                ld h, $00
                add hl, hl
                add hl, hl
                add hl, de
                bit 6, (hl)
                jr nz, L_8090

        _end_if
        set 2, b

L_8090:
        ret


function_8091:
        ld (ix+$0A), $4F
        ld (ix+$07), $FF
        jp L_7401


function_809C:
        call L_9445
        call L_7401
        ld a, (ix+$02)
        ld b, (ix+$07)
        cp (ix+$06)

        _if_not c
                ld b, $FF
        _end_if

        cp (ix+$05)
        _if_not nc
                ld b, $01
        _end_if

        add a, b
        ld (ix+$02), a
        ld (ix+$07), b
        ld a, $4F
        call L_96FA
        ld b, $4F
        _if_not nz
                inc (ix+$09)
                bit 2, (ix+$09)
                _if_not z
                        ld b, $4D
                _end_if
        _end_if

        ld (ix+$0A), b
        ld a, (ix+$07)
        and $80
        or b
        ld (ix+$0A), a
        ld a, (ix+$02)
        and $01
        add a, (ix+$0D)
        ld (ix+$03), a
        call L_7401
        call L_8998
        ret nc
        ld a, $4F
        call L_96FA

        _if_not z
                ld a, $04
                ld hl, $F8E0
                jp L_8A30
        _end_if

        call L_7401
        push ix
        pop hl
        jp L_7CCF


function_8107:
        call L_73F5
        ld a, (ix+$03)
        ld b, (ix+$07)
        cp (ix+$06)

        _if_not c
                ld b, $FE
        _end_if

        cp (ix+$05)

        _if_not nc
                ld b, $02
        _end_if

        add a, b
        ld (ix+$03), a
        ld (ix+$07), b
        call L_7401
        call L_8998
        ret nc
        ld a, $04
        ld hl, $F971
        jp L_8A30


function_8134:
        call L_8998
        ld hl, $F8F3
        ld a, $03
        call c, L_8A30
        ld a, ($781B)
        and a
        ret z
        cp $8C
        ret nc
        ld a, (ix+$09)
        and $03
        ld a, $D6
        call z, L_83F9
        call L_73F5
        ld a, (ix+$02)
        cp $3C
        _if_not nc
                inc (ix+$09)
                ld a, (ix+$09)
                and $03
                jp nz, L_7401
                ld a, $D3
                sub (ix+$04)
                ld (ix+$04), a
                inc (ix+$02)
                jp L_7401

        _end_if

        inc (ix+$09)
        inc (ix+$03)
        ld a, (ix+$03)
        cp $BC

        _if_not nc
                jp L_7401
        _end_if

        ld (ix), $FF
        ret


function_8189:
        ld a, (ix+$09)
        cp $02
        ret nz
        call L_7401
        dec (ix+$02)
        ld a, (ix+$02)
        cp $44

        _if_not nc
                ld (ix+$03), $58
        _end_if

        ld a, $C3
        sub (ix+$04)
        ld (ix+$04), a
        call L_7401
        ld a, (ix+$02)
        cp $32

        _if_not nz
                ld a, $FF
                ld (dados_mapa_20), a
                ld hl, $F5ED
                jp L_96EC
        _end_if

        and a
        ret p
        ld (ix), $FF
        ret


function_81C4:
        ld hl, $81CA
        jp L_9926


        ; Start of unknown area $81CA to $81F7
        defb $49, $2C, $4C, $08, $20, $3E
        defb $14, $32, $0D, $9D, $3E, $F7, $32, $11, $9D, $3E, $05, $32, $16, $9D, $3E, $01
        defb $32, $15, $9D, $32, $61, $9D, $AF, $32, $60, $9D, $3E, $08, $21, $07, $F9, $CD
        defb $30, $8A, $21, $0B, $F3, $C3, $EC, $96
        ; End of unknown area $81CA to $81F7


function_81F8:
        set 6, (ix+$0A)
        res 4, (ix+$0A)
        call L_7401
        res 6, (ix+$0A)
        set 4, (ix+$0A)
        ld a, $10

L_820D:
        ld h, a
        ld a, (ix+$0D)
        ld (sprite_top), a
        ld a, $2E
        ld (sprite_left), a
        ld l, $28
        ld (largura_sprite_a_desenhar), hl
        xor a
        ld (background_color), a
        ld a, (apenas_brite_and_ink)
        and $07
        ld (apenas_brite_and_ink), a
        jp L_8DD7


function_822D:
        call L_824E
        call L_9445
        call L_7401
        ld a, (ix+$05)
        ld (ix+$02), a
        ld a, (ix+$0A)
        and $7F
        ld b, a
        ld a, (ix+$06)
        and $80
        or b
        ld (ix+$0A), a
        jp L_7401


L_824E:
        ld a, (ix+$02)
        ld b, (ix+$06)
        cp $50
        _if_not c
                ld b, $FF
        _end_if

        cp $30

        _if_not nc
                ld b, $01
        _end_if

        add a, b
        ld (ix+$05), a
        ld (ix+$06), b
        ret


function_8268:
        set 6, (ix+$0A)
        res 4, (ix+$0A)
        call L_7401
        res 6, (ix+$0A)
        set 4, (ix+$0A)
        ld a, (ix+$0D)
        ld (sprite_top), a
        ld a, (ix+$0C)
        ld (sprite_left), a
        ld a, $08
        ld (altura_sprite_a_desenhar), a
        xor a
        ld (background_color), a
        ld a, $04
        ld (apenas_brite_and_ink), a
        jp L_8DD7


function_8298:
        call L_9445
        call L_7401
        ld l, (ix+$02)
        ld h, (ix+$03)
        dec h
        dec h
        ld de, $0207
        call L_89B1
        _if_not c
                ld a, (ix+$03)
                dec a
                cp $A0

                _if_not nc
                        ld a, $A0
                _end_if

                ld (ix+$03), a
                
        _else

                ld a, ($9D16)
                cp $03
                _if_not c
                        cp $06
                        _if_not nc
                                ld a, (frame_movimento_do_hero)
                                cp $07
                                jr z, L_82D5
                                and a
                                jr z, L_82D5
                        _end_if
                _end_if 

                inc (ix+$03)

        _end_if
L_82D5:
        jp L_7401


function_82D8:
        ld a, ($9D32)
        and a
        ret z
        call L_8998
        ret nc
        ld a, (ix+$09)
        and a
        ret nz
        xor a
        ld ($9D32), a
        ld a, $01
        ld (ix+$09), a
        set 7, (ix+$0A)
        ld a, $02
        ld ($74D3), a
        ld ($74E2), a
        ld a, $50
        ld ($74CF), a
        ld hl, $F593
        jp L_96EC


function_8306:
        ld a, (ix+$09)
        and a
        ld hl, $832D

        _if_not nz
                ld hl, $8336
        _end_if

        ld b, $03

        _do
                ld a, (hl)
                ld (ix+$02), a
                inc hl
                ld a, (hl)
                ld (ix+$03), a
                inc hl
                ld a, (hl)
                ld (ix+$04), a
                inc hl
                push bc
                push hl
                call L_7401
                pop hl
                pop bc
        _djnz
        ret


        ; Start of unknown area $832D to $833E
        defb $28, $40, $2A
        defb $2A, $40, $28, $2C, $40, $2B, $2C, $48, $2C, $2C, $50, $29, $2C, $58, $2D
        ; End of unknown area $832D to $833E


function_833F:
        ld (ix+$02), $50
        call L_7401
        ld a, $02
        jp L_820D


function_834B:
        ld a, (ix+$09)
        and a
        ret z
        inc (ix+$06)
        bit 0, (ix+$06)
        ret z
        ld a, (ix+$05)
        cp $2E

        _if_not nc
                ld (ix+$09), $02
        _end_if

        cp $50

        _if_not c
                ld (ix+$09), $FE
        _end_if

        ld a, (ix+$05)
        add a, (ix+$09)
        ld (ix+$05), a

L_8374:
        _do
                ld a, (ix+$02)
                cp (ix+$05)
                ret z

                _if_not c
                        dec (ix+$02)
                        dec (ix+$02)
                        call L_7401
                        jr L_8374 ; break

                _end_if

                call L_7401
                inc (ix+$02)
                inc (ix+$02)
        _while_true
        


        ; Start of unknown area $8393 to $83A5
        defb $4F, $22, $80, $10, $18, $CD, $39, $98, $3E, $FF, $32, $9D, $74
        defb $21, $D6, $F4, $C3, $EC, $96
        ; End of unknown area $8393 to $83A5


function_83A6:
        ld hl, area_negra
        ld de, $8445
        ld bc, $0027
        ld (hl), $00
        ldir
        ret


function_83B4:
        ld iy, area_negra
        ld b, $0A

        _do
                push bc
                ld a, (iy+$03)
                and a
                _if_not z
                        ld (iy+$03), $40
                        rlca
                        _if_not c
                                call L_842F
                                dec (iy+$01)
                                ld a, (iy+$01)
                                cp $28
                                jr z, L_83EC
                                and $0F
                                _if_not nz
                                        inc (iy+$02)
                                        ld a, (iy+$02)
                                        cp $D2
                                        jr z, L_83EC
                                        cp $D9
                                        jr z, L_83EC
                                _end_if
                        _end_if

                        call L_842F
                        jr L_83F0


L_83EC:
                        ld (iy+$03), $00
                _end_if
L_83F0:
                pop bc
                ld de, $0004
                add iy, de
        _djnz 

        ret


L_83F9:
        ld c, a
        ld b, $0A
        ld de, $0004
        ld iy, area_negra

        _do
                ld a, (iy+$03)
                and a
                jr z, L_840E
                add iy, de
        _djnz
        ret


L_840E:
        ld d, (ix+$02)
        ld e, (ix+$03)
        ld (iy), d
        ld (iy+$01), e
        ld (iy+$02), c
        ld (iy+$03), $80
        call L_9D64
        and $01
        add a, (iy)
        add a, $02
        ld (iy), a
        ret


L_842F:
        ld h, (iy)
        ld l, (iy+$01)
        ld (ix+$02), h
        ld (ix+$03), l
        ld h, (iy+$02)
        ld (ix+$04), h
        jp L_7401


area_negra:
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

        ; Start of unknown area $846C to $85FD
        defb $4B, $44, $9A, $05
        defb $10, $E1, $21, $E2, $F3, $C3, $EC, $96, $47, $24, $50, $0A, $10, $21, $8C, $84
        defb $7E, $A7, $C8, $36, $00, $E1, $21, $C0, $F3, $C3, $EC, $96, $FF, $50, $36, $64
        defb $04, $10, $3E, $FF, $32, $29, $79, $CD, $39, $98, $3E, $68, $32, $32, $79, $3E
        defb $50, $32, $2F, $79, $21, $74, $F6, $C3, $EC, $96, $67, $22, $30, $3C, $88, $DD
        defb $7E, $09, $A7, $C2, $33, $98, $DD, $36, $09, $FF, $21, $55, $F5, $C3, $EC, $96
        defb $FF, $22, $30, $3C, $88, $3A, $BA, $75, $3C, $C2, $33, $98, $2A, $41, $78, $3A
        defb $0D, $9D, $C6, $20, $95, $F2, $DA, $84, $ED, $44, $FE, $0C, $D2, $33, $98, $7C
        defb $D6, $28, $67, $22, $BC, $75, $3A, $3F, $78, $32, $BA, $75, $AF, $32, $BF, $75
        defb $32, $BE, $75, $3E, $0D, $32, $C3, $75, $3A, $0D, $9D, $C6, $20, $BD, $3E, $4C
        defb $38, $02, $C6, $80, $32, $C4, $75, $21, $BA, $75, $21, $75, $F5, $C3, $EC, $96
        defb $6F, $40, $8C, $04, $10, $DD, $34, $09, $CD, $39, $98, $21, $31, $F6, $C3, $EC
        defb $96, $55, $40, $8C, $04, $10, $DD, $7E, $04, $FE, $16, $20, $0C, $DD, $35, $09
        defb $CD, $39, $98, $21, $14, $EF, $C3, $4F, $7B, $ED, $4B, $75, $78, $0C, $C2, $33
        defb $98, $DD, $35, $09, $CD, $39, $98, $21, $EE, $77, $34, $21, $38, $F5, $DD, $7E
        defb $04, $FE, $13, $20, $03, $21, $23, $F5, $3A, $EE, $77, $FE, $03, $C2, $EC, $96
        defb $3E, $55, $32, $A8, $78, $CD, $E2, $73, $21, $E9, $EF, $C3, $EC, $96, $33, $40
        defb $50, $04, $10, $CD, $39, $98, $3E, $33, $32, $12, $78, $DD, $E5, $DD, $21, $F4
        defb $77, $CD, $F5, $73, $21, $F4, $77, $CD, $CF, $7C, $DD, $E1, $21, $6A, $F0, $C3
        defb $EC, $96, $01, $22, $30, $10, $88, $CD, $39, $98, $3E, $01, $32, $6B, $79, $21
        defb $8E, $74, $CD, $CF, $7C, $3E, $FF, $32, $70, $74, $21, $3A, $F8, $C3, $EC, $96
        defb $49, $4A, $68, $0A, $10, $21, $87, $75, $DD, $7E, $04, $FE, $17, $28, $18, $7E
        defb $A7, $C2, $33, $98, $34, $DD, $CB, $09, $CE, $CD, $E3, $85, $3E, $FF, $32, $8D
        defb $75, $21, $B8, $F5, $C3, $EC, $96, $7E, $3D, $C2, $33, $98, $34, $21, $DA, $F5
        defb $C3, $EC, $96, $DD, $7E, $09, $FE, $03, $C0, $C3, $39, $98, $57, $30, $64, $14
        defb $28, $3E, $51, $CD, $FA, $96, $36, $52, $21, $9F, $F6, $C3, $EC, $96
        ; End of unknown area $846C to $85FD


L_85FE:
        ld ($8627), a
        ld a, (ix)
        ld l, (ix+$02)
        ld h, (ix+$03)
        push ix
        ld ix, dados_mapa_21
        ld (ix), a
        ld (ix+$0C), l
        ld (ix+$0D), h
        ld (ix+$09), $00
        xor a
        ld ($8628), a
        call function_862C
        pop ix
        ret


        ; Start of unknown area $8627 to $862B
        defb $00, $00, $00, $00, $00
        ; End of unknown area $8627 to $862B


function_862C:
        ld b, $08

        _do
                ld c, (ix+$09)
                call L_86EB
        _djnz

        ret


function_8637:
        ld a, ($8628)
        and a
        _if_not nz
                ld b, $08

                _do
                        ld c, (ix+$09)
                        call L_86EB
                        ld c, (ix+$09)
                        inc c
                        call L_86EB
                _djnz 

                inc (ix+$09)
                ld a, (ix+$09)
                cp $14
                ret nz
                ld ($8628), a
                xor a
                ld ($862B), a
                ld hl, ($785F)
                ld a, (dados_mapa_67)
                cp (ix)
                _if_not z
                        ld hl, (posicao_hero_x_em_nibbles_copia_2)
                        ld de, $F723
                        add hl, de
                        ld a, ($8627)
                        and a
                        jr z, L_86D6

                _end_if
                
                ld ($8629), hl
                ret
        _end_if

        ld b, $08
        ld hl, ($8629)
        ld a, (ix+$0C)
        ld (ix+$05), a
        add a, l
        rr a
        ld (ix+$0C), a
        ld a, (ix+$0D)
        ld (ix+$06), a
        add a, h
        rr a
        ld (ix+$0D), a

        _do
                ld c, (ix+$09)
                call L_86E3
                ld c, (ix+$09)
                dec c
                call L_86EB
        _djnz

        dec (ix+$09)
        ret nz
        call L_86D6
        ld a, (nivel)
        cp $4A
        ret nz
        ld a, (dados_mapa_53)
        inc a
        ret z
        ld bc, ($75AD)
        ld hl, ($778D)
        ld de, $2006
        call L_89BD
        ret nc
        ld a, $FF
        ld ($7794), a
        ld a, $01
        ld ($862B), a
        ld hl, dados_mapa_53
        jp L_7CCF


L_86D6:
        call function_862C
        xor a
        ld ($8628), a
        ld a, $FF
        ld (ix), a
        ret


L_86E3:
        ld h, (ix+$05)
        ld l, (ix+$06)
        jr L_86F1


L_86EB:
        ld h, (ix+$0C)
        ld l, (ix+$0D)

L_86F1:
        push bc
        ld a, c
        rr b

        _if_not nc
                neg
        _end_if

        ld d, a
        ld a, c
        rr b
        _if_not nc
                neg
        _end_if

        ld e, a
        sla d
        rr b
        _if_not nc
                ld a, d
                ld d, e
                ld e, a
        _end_if

        ld a, d
        add a, h
        ld (ix+$02), a
        ld a, e
        add a, a
        add a, a
        add a, l
        ld (ix+$03), a
        call L_73F5
        call L_8998
        _if_not nc
                ld a, (dados_mapa_67)
                cp $FF
                _if_not z
                        ld bc, (nivel)
                        cp c
                        _if_not z
                                ld a, $01
                                ld hl, $F919
                                call L_8A30
                        _end_if 
                _end_if
        _end_if



        pop bc
        ret


function_8737:
        ld a, (ix+$05)
        ld hl, function_index_03
        jp function_jump_to_hl_plus_2a


function_index_03:
        defw function_index_03_01, function_index_03_02, function_index_03_03

function_index_03_01:
        call L_73F5
        ld a, (ix+$09)
        and a

        _if_not z
                dec (ix+$09)
                jp L_7CB4
        _end_if

        ld a, $72
        ld (ix+$04), a
        inc (ix+$05)
        inc (ix+$06)
        ld a, (ix+$06)
        cp $02
        ld a, $FF
        _if_not nc
                xor a
        _end_if

        call L_85FE
        jp L_7401


function_index_03_02:
        ld a, (dados_mapa_21)
        inc a
        ret nz
        inc (ix+$05)
        ret


function_index_03_03:
        ld hl, dados_mapa_22
        call L_7CCF
        ld a, ($862B)
        and a
        
        _if_not nz
                ld a, (ix+$06)
                cp $02
                _if_not nc
                        ld hl, $F349
                        jp L_96EC
                _end_if

                ld hl, $F388
                jp L_96EC
        _end_if

        ld hl, $ED4B
        call L_7B4F
        jp L_8890


        ; Start of unknown area $87A1 to $880B
        defb $51, $40, $90, $04, $10, $DD, $7E, $04, $FE, $0D, $28, $19, $DD, $CB, $09
        defb $46, $C2, $33, $98, $DD, $CB, $09, $C6, $CD, $E3, $85, $3E, $51, $32, $7B, $78
        defb $21, $06, $F5, $C3, $EC, $96, $21, $A9, $77, $CD, $CF, $7C, $CD, $39, $98, $21
        defb $B0, $EB, $CD, $EC, $96, $C3, $90, $88, $47, $24, $50, $0A, $10, $3E, $47, $32
        defb $21, $78, $21, $9A, $77, $CD, $CF, $7C, $CD, $39, $98, $21, $11, $EC, $CD, $4F
        defb $7B, $C3, $90, $88, $4D, $40, $8C, $04, $10, $CD, $39, $98, $3E, $4D, $32, $E6
        defb $76, $3E, $0D, $32, $EF, $76, $21, $1E, $EE, $C3, $4F, $7B
        ; End of unknown area $87A1 to $880B


function_880C:
        ld a, (ix+$09)
        and a
        _if_not z
                call L_73F5
                dec (ix+$09)
                jp nz, L_7CB4
                ld (ix+$0A), $4F
                ld a, $25
                ld (ix+$04), a
                jp L_7401
        _end_if

        ld hl, dados_mapa_42
        call L_7CCF
        ld hl, dados_mapa_58
        call L_7CCF
        ld hl, $EE82
        call L_96EC
        jp L_8890


        ; Start of unknown area $883C to $887C
        defb $74, $39, $8C, $10
        defb $23, $21, $B8, $77, $7E, $3C, $CA, $33, $98, $DD, $7E, $04, $FE, $03, $28, $1B
        defb $CD, $39, $98, $3E, $FF, $21, $C3, $F9, $CD, $30, $8A, $21, $C3, $F6, $3E, $05
        defb $32, $C1, $99, $3E, $50, $32, $C3, $99, $C3, $EC, $96, $CD, $39, $98, $21, $B8
        defb $77, $CD, $CF, $7C, $21, $E7, $F6, $CD, $4F, $7B, $C3, $90, $88
        ; End of unknown area $883C to $887C


function_887D:
        call L_8998
        ret nc
        ld hl, dados_mapa_57
        call L_7CCF
        ld hl, $EC64
        call L_7B4F
        jp L_8890


L_8890:
        ld hl, $9D42
        dec (hl)
        ret nz
        ld a, $80
        ld ($FDC6), a
        ld hl, $F290
        jp L_7B4F


L_88A0:
        ld b, $5C
        ld ix, dados_mapa_0
        ld de, $000F

        _do

                call prepara_dados_mapa
                add ix, de
        _djnz

        ld a, $05
        ld ($77A4), a
        ld a, $17
        ld ($77E0), a
        ld a, $4A
        ld ($76D2), a
        ld hl, $74C5
        res 7, (hl)
        ld a, $C1
        ld ($FDC6), a
        xor a
        ld ($75C0), a
        ld a, $FF
        ld ($9D63), a
        ld (sound_to_play), a
        ld ($848C), a
        ld a, $03
        ld ($99C1), a
        ld a, $78
        ld ($99C3), a
        ld a, $06
        ld ($9D42), a
        ld hl, $7A60
        ld b, $0A

 
        _do

                ld (hl), $00
                inc hl
                
        _djnz


function_88F1:
        ret


prepara_dados_mapa:
        ld a, (ix+$0B)
        ld (ix), a
        ld a, (ix+$0C)
        ld (ix+$02), a
        ld a, (ix+$0D)
        ld (ix+$03), a
        ld a, (ix+$0E)
        ld (ix+$04), a
        xor a
        ld (ix+$09), a
        ld a, (ix+$01)
        cp $0A
        ret nz
        ld a, (ix+$07)
        ld (ix+$01), a
        ld (ix+$0A), $47
        ret


L_891F:
        ld a, (nivel)
        ld (dados_mapa_8), a
        ld (dados_mapa_9), a
        ld a, $28
        call L_892F
        ld a, $20

L_892F:
        ld ($893E), a
        ld b, $5C
        ld ix, dados_mapa_0

        _do
                push bc
                ld a, (ix+$01)
                cp $07
                _if_not z
                        ld a, (nivel)
                        cp (ix)
                        push ix
                        ld a, (ix+$01)
                        ld hl, function_index
                        call z, function_jump_to_hl_plus_2a
                        pop ix
                _end_if

                pop bc
                ld de, $000F
                add ix, de
        _djnz
        ret


L_895C:
        ld b, $5C
        ld ix, dados_mapa_91

        _do
                ld a, b
                dec a
                ld ($9D40), a
                push bc
                ld a, (nivel)
                cp (ix)
                _if_not nz
                        ld a, (ix+$01)
                        push ix
                        ld hl, function_index_04
                        call z, function_jump_to_hl_plus_2a
                        pop ix

                _end_if
                pop bc
                ld de, $FFF1
                add ix, de
        _djnz
        ret


function_jump_to_hl_plus_2a:
        add a, a
        ld c, a
        ld b, $00
        add hl, bc
        ld e, (hl)
        inc hl
        ld d, (hl)
        ex de, hl
        jp (hl)


L_8990:
        ld l, (ix)
        ld h, (ix+$01)
        jr L_89A1


L_8998:
        ld l, (ix+$02)
        ld h, (ix+$03)
        ld a, (ix+$04)

L_89A1:
        ld (next_sprite_index), a
        push hl
        call function_print_sprite
        pop hl
        ld a, (altura_sprite_a_desenhar)
        ld d, a
        ld a, (largura_sprite_a_desenhar)
        ld e, a

L_89B1:
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        add a, $20
        ld c, a
        ld a, ($9D0E)
        sub $12
        ld b, a

L_89BD:
        ld a, l
        sub c
        _if_not c
                cp $06
                ret nc
        _else
                dec a
                add a, e
                ret nc
        _end_if

        ld a, h
        sub b
        _if_not c
                cp $12
                ret
        _end_if

        dec a
        add a, d
        ret


L_89D3:
        ld ix, $8A1A
        ld (ix+$03), l
        ld (ix+$02), h
        call L_7401

L_89E0:
        ld hl, $8C75
        ld de, $9D47
        ld c, $00
        jr L_89F8


L_89EA:
        ld a, (apenas_brite_and_ink)
        ld ($9D4A), a
        ld c, $03
        ld hl, $8C99
        ld de, $9D48

L_89F8:
        ld a, (de)
        inc a
        ld (de), a
        dec a
        ld e, a
        rlca
        add a, e
        ld e, a
        ld d, $00
        add hl, de
        ld a, (sprite_left)
        ld (hl), a
        inc hl
        ld a, (sprite_top)
        ld (hl), a
        inc hl
        ld (hl), c
        ret


        ; Start of unknown area $8A0F to $8A2F
        defb $00
        defb $00, $3B, $00, $B2, $00, $00, $00, $00, $00, $46, $00, $00, $00, $00, $73, $00
        defb $00, $00, $00, $00, $42, $FF, $00, $00, $00, $E9, $00, $01, $00, $01, $00, $1F
        ; End of unknown area $8A0F to $8A2F


L_8A30:
        ld b, a
        xor a
        ld ($9D4C), a
        ld a, ($9D2B)
        and a
        ret z
        ld ($9D28), hl
        ld hl, $9D2B
        ld a, (hl)
        sub b

        _if_not nc
                xor a
        _end_if

        ld (hl), a
        ret


L_8A47:
        ld hl, $9D2B
        ld a, (hl)
        add a, $08
        cp $1F

        _if_not c
                ld a, $1F
        _end_if

        ld (hl), a
        ret


L_8A55:
        ld a, ($9D32)
        and a
        ret z
        ld b, $1E
        ld ix, $FFA2

        _do
                ld a, (nivel)
                cp (ix+$02)
                _if_not nz
                        push bc
                        xor a
                        call L_8990
                        _if_not nc
                                set 7, (ix+$02)
                                push ix
                                ld a, $03
                                ld (sound_to_play), a
                                call L_95EB
                                xor a
                                ld ($9D32), a
                                ld hl, $F9EB
                                call L_96EC
                                pop ix

                        _end_if

                        pop bc  
                _end_if

                ld de, $0003
                add ix, de
        _djnz 
        ret


L_8A92:
        ld a, $FF
        ld ($8B86), a
        ld b, $00
        ld iy, $8B55
        ld ix, $8A25


        _do
                push bc
                ld a, b
                cp $08
                _if_not c
                        ld h, (iy)
                        ld l, (iy+$01)
                        ld (ix+$02), h
                        ld (ix+$03), l
                        ld a, (nivel)
                        cp (iy+$03)
                        _if_not nz
                                call L_9445
                                call L_7401

                        _end_if

                        dec (iy+$01)
                        ld a, (iy+$01)
                        cp $28
                        
                        _if_not nc
                                call L_9D64
                                and $0F
                                add a, $38
                                ld (iy), a
                                ld (ix+$02), a
                                ld (iy+$01), $A0
                        _end_if

                        ld a, (iy+$01)
                        ld (ix+$03), a
                        ld a, (nivel)
                        cp (iy+$03)
                        call z, L_7401
                _end_if

                ld a, (nivel)
                cp (iy+$03)
                _if_not nz
                        ld l, (iy)
                        inc l
                        ld h, (iy+$01)
                        ld e, (iy+$02)
                        ld d, $01
                        call L_89B1
                        _if_not nc
                                xor a
                                ld ($8B86), a
                        _end_if
                _end_if

                pop bc
                ld de, $0004
                add iy, de
                inc b
                ld a, ($FDC6)
                cp $80
                ld a, $0C
                _if_not z
                        ld a, $08
                _end_if

                cp b
        
        _while nz

        ld a, ($8B86)
        ld ($8B85), a
        ret


L_8B24:
        ld a, ($FDC6)
        cp $80
        ret nz
        ld ix, $8A25
        ld b, $04
        ld iy, $8B75

        _do
                ld a, (nivel)
                cp (iy+$03)
                _if_not nz
                        push bc
                        ld h, (iy)
                        ld l, (iy+$01)
                        ld (ix+$02), h
                        ld (ix+$03), l
                        call L_7401
                        pop bc

                _end_if

                ld de, $0004
                add iy, de
        _djnz

        ret


        ; Start of unknown area $8B55 to $8B86
        defb $45, $6C, $0C, $38, $2A, $44, $0B, $39, $4C, $3A, $0B
        defb $39, $3A, $68, $12, $39, $26, $84, $0F, $39, $50, $84, $0F, $39, $3D, $53, $0F
        defb $4F, $4E, $46, $0B, $52, $50, $64, $08, $41, $46, $3C, $08, $41, $3C, $80, $08
        defb $2A, $5A, $46, $08, $2A, $FF, $FF
        ; End of unknown area $8B55 to $8B86


L_8B87:
        ld a, ($9D4A)
        ld (apenas_brite_and_ink), a
        ld a, ($9D48)
        ld ix, $8C99
        and a
        ret z
        ld b, a

        _do
                push bc
                push ix
                ld a, ($9D4A)
                ld c, a
                ld a, (ix+$02)
                inc a
                and $03
                ld (ix+$02), a
                add a, $5C
                ld b, $01
                ld e, (ix)
                ld l, (ix+$01)
                call L_8D3E
                call desenha_sprite
                pop ix
                ld l, (ix)
                ld h, (ix+$01)
                ld de, $1408
                call L_89B1
                call c, L_8BD1
                ld de, $0003
                add ix, de
                pop bc
        _djnz

        ret


L_8BD1:
        ld bc, (nivel)
        ld a, b
        cp c
        ret nz
        ld a, ($9D16)
        cp $06
        ret z
        ld a, $06
        ld ($9D16), a
        xor a
        ld ($9D44), a
        ld a, (ix+$01)
        add a, $0E
        ld ($9D0E), a
        xor a
        ld ($9D11), a
        ld hl, $F88C
        ld a, (nivel)
        cp $41
        _if_not z
                cp $6F
                _if_not z
                        ld hl, $F8B4
                        cp $57
                        _if_not z
                                ld hl, $F89F
                        _end_if
                _end_if
        _end_if

        ld a, $FF
        call L_8A30
        push ix
        call L_9D8C
        pop ix
        ret


L_8C18:
        ld a, ($9D47)
        ld ix, $8C75
        and a
        ret z
        ld b, a

        _do
                push bc
                call L_8C4A
                ld a, (ix+$02)
                inc a
                and $0F
                ld (ix+$02), a
                call L_8C4A
                ld a, $73
                call L_8990
                
                _if_not nc
                        ld a, $01
                        ld hl, $F878
                        call L_8A30
                _end_if

                ld de, $0003
                add ix, de
                pop bc
        _djnz 

        ret


L_8C4A:
        ld a, (ix+$02)
        and $02
        rrca
        rrca
        ld b, a
        ld a, (ix+$02)
        and $01
        rlca
        rlca
        xor $46
        ld c, a
        ld e, (ix)
        ld l, (ix+$01)
        ld a, $73
        push ix
        call L_8D3E
        call desenha_sprite
        pop ix
        xor a
        ld (background_color), a
        jp L_8DD7


        ; Start of unknown area $8C75 to $8CC0
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00
        ; End of unknown area $8C75 to $8CC0


L_8CC1:
        ld a, $3E
        call L_96FA
        _if_not z
                ld a, $3F
                call L_96FA
                jr z, L_8CFC
                ld a, (nivel)
                ld bc, (dados_mapa_63)
                cp c
                ret nz
                ld hl, $8D21
                inc (hl)
                ld a, (hl)
                cp $3C
                ret c
                ld (hl), $00
                ld ix, dados_mapa_63
                ld a, $CF
                jp L_83F9


        _end_if
        ld hl, $781B
        ld a, (hl)
        and a
        _if_not z
                dec a
                _if_not z
                        dec (hl)
                        and $07
                        ret nz
                        dec (hl)
                        jr L_8D06

                _end_if
        _end_if
L_8CFC:
        ld hl, $8D21
        inc (hl)
        ld a, (hl)
        cp $3C
        ret c
        ld (hl), $00

L_8D06:
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        add a, $21
        ld ($8D1F), a
        ld a, ($9D0E)
        sub $12
        ld ($8D20), a
        ld ix, $8D1D
        ld a, $CF
        jp L_83F9


        ; Start of unknown area $8D1F to $8D21
        defb $00
        defb $00, $00
        ; End of unknown area $8D1F to $8D21


coloca_em_de_hl_5E22_B830:
        push hl
        push de
        ld de, $5E22
        ld hl, $B830

L_8D2A:
        ld (valor_de), de
        ld (valor_hl), hl
        pop de
        pop hl
        ret


coloca_em_de_hl_6020_B800:
        push hl
        push de
        ld de, $6020
        ld hl, $B800
        jr L_8D2A


L_8D3E:
        ld h, a
        ld a, c
        ld (apenas_brite_and_ink), a
        ld a, b
        and $03
        ld (background_color), a
        ld a, b
        rlca
        and $01
        ld (sprite_espelho), a
        ld a, h

L_8D51:
        ld (next_sprite_index), a
        ld a, e
        ld (sprite_left), a
        ld a, l
        ld (sprite_top), a

function_print_sprite:
        xor a
        ld ($9D26), a
        ld a, (next_sprite_index)
        ld l, a
        ld h, $00
        add hl, hl
        ld bc, index_de_sprites
        add hl, bc
        ld e, (hl)
        inc hl
        ld d, (hl)
        ld a, d
        cp $FF
        _if_not nz
                ld ($9D26), a
                ret
        _end_if

        ld hl, sprite_0
        add hl, de
        ld a, (hl)
        ld (largura_sprite_a_desenhar), a
        inc hl
        ld a, (hl)
        ld (altura_sprite_a_desenhar), a
        inc hl
        ld (primeiro_byte_da_sprite_a_desenhar), hl
        ret


L_8D89:
        ld bc, $1E11
        ld de, $0601
        ld hl, $8DCC
        ld (hl), $00
        jp colocar_attributos_de_cor


L_8D97:
        ld l, a
        xor a
        ld ($8DCC), a
        ld a, (background_color)
        cp $01
        ld a, l
        
        _if_not nz 
                xor $47
                ld l, a
                ld a, $AE
                ld ($8DCC), a
                ld a, l
        _end_if

colocar_attributos_de_cor:
        ld ($8DCB), a
        ld a, b
        ld ($8DC9), a
        ld h, $00
        ld a, d
        add a, a
        add a, a
        add a, a
        ld l, a
        ld d, $00
        add hl, hl
        add hl, hl
        add hl, de
        ld de, $5800
        add hl, de
        ld de, $0020

        _do
                push hl
                ld b, $01

        
                _do

                        ld a, $01
                        xor (hl)
                        ld (hl), a
                        inc hl
                        
                _djnz

                pop hl
                add hl, de
                dec c
        _while nz

        ret


L_8DD7:
        ld a, ($9D26)
        and a
        ret nz
        ld hl, (valor_de)
        ld a, (largura_sprite_a_desenhar)
        ld b, a
        ld a, (sprite_left)
        ld e, a
        cp h
        ret nc
        add a, b
        cp l
        ret c
        ret z
        ld a, e
        sub l
        _if_not nc
                ld e, l
                add a, b
                ld b, a

        _end_if

        ld a, e
        add a, b
        sub h
        _if_not c
                _if_not z
                        neg
                        add a, b
                        ld b, a
                _end_if
        _end_if

        ld a, e
        and $01
        inc a
        add a, b
        ld b, a
        srl b
        ld a, e
        sub $20
        srl a
        ld e, a
        ld hl, (valor_hl)
        ld a, (altura_sprite_a_desenhar)
        ld c, a
        ld a, (sprite_top)
        ld d, a
        cp h
        ret nc
        add a, c
        cp l
        ret c
        ret z
        ld a, d
        sub l
        _if_not nc
                ld d, l
                add a, c
                ld c, a
        _end_if

        ld a, d
        add a, c
        sub h
        _if_not c
                _if_not z
                        neg
                        add a, c
                        ld c, a
                _end_if
        _end_if

        ld a, d
        and $07
        add a, c
        add a, $07
        ld c, a
        srl c
        srl c
        srl c
        srl d
        srl d
        srl d
        ld a, (apenas_brite_and_ink)
        jp L_8D97


        ; Start of unknown area $8E49 to $8E49
        defb $00
        ; End of unknown area $8E49 to $8E49


desenha_sprite:
        ld a, ($9D26)
        and a
        ret nz
        ld de, (valor_de)
        ld a, (altura_sprite_a_desenhar)
        ld (altura_sprite_a_desenhar_copy), a
        ld a, (largura_sprite_a_desenhar)
        ld (largura_sprite_a_desenhar_copy), a
        ld b, a
        ld a, (sprite_left)
        cp d
        ret nc
        add a, b
        ret c
        dec a
        cp e
        ret c
        ld hl, (valor_hl)
        ld a, (altura_sprite_a_desenhar)
        ld b, a
        ld a, (sprite_top)
        cp h
        ret nc
        add a, b
        dec a
        cp l
        ret c
        ld a, (sprite_top)
        ld (sprite_top_copy), a
        sub l
        _if_not nc
                ld b, a
                ld a, (altura_sprite_a_desenhar_copy)
                add a, b
                ld (altura_sprite_a_desenhar_copy), a
                ld a, l
                ld (sprite_top_copy), a
                push hl
                ld hl, (primeiro_byte_da_sprite_a_desenhar)
                ld a, (largura_sprite_a_desenhar)
                srl a
                ld c, a
                ld a, b
                ld b, $00

                _do
                        add hl, bc
                        inc a
                _while nz

                ld (primeiro_byte_da_sprite_a_desenhar), hl
                pop hl

        _end_if

        ld a, (altura_sprite_a_desenhar_copy)
        ld b, a
        ld a, (sprite_top_copy)
        add a, b
        dec a
        sub h

        _if_not c
                inc a
                ld b, a
                ld a, (altura_sprite_a_desenhar_copy)
                sub b
                ld (altura_sprite_a_desenhar_copy), a
        _end_if
        
        ld a, (sprite_left)
        ld (sprite_left_copy), a
        xor a
        ld ($8FAD), a
        ld ($9002), a
        ld a, (sprite_left)
        sub e
        _if_not nc
                neg
                ld b, a
                and $01
                ld ($9002), a
                ld a, (largura_sprite_a_desenhar_copy)
                sub b
                ld (largura_sprite_a_desenhar_copy), a
                ld a, (sprite_left_copy)
                add a, b
                ld (sprite_left_copy), a
                ld a, b
                srl a
                ld ($8FAD), a
                ld c, a
                ld b, $00
                push hl
                ld hl, (primeiro_byte_da_sprite_a_desenhar)
                add hl, bc
                ld a, (sprite_espelho)
                and a
                _if_not z
                        sbc hl, bc
                        and a
                        sbc hl, bc

                _end_if

                ld (primeiro_byte_da_sprite_a_desenhar), hl
                pop hl
                ld b, a

        _end_if

        ld a, (sprite_left_copy)
        ld b, a
        ld a, (largura_sprite_a_desenhar_copy)
        add a, b
        dec a
        sub d
        _if_not c
                inc a
                ld b, a
                ld a, (largura_sprite_a_desenhar_copy)
                sub b
                ld (largura_sprite_a_desenhar_copy), a
                ld a, b
                inc a
                srl a
                ld b, a
                ld a, ($8FAD)
                add a, b
                ld ($8FAD), a
        _end_if

        ld hl, $2313
        ld a, (sprite_espelho)
        and a
        _if_not z
                ld hl, (primeiro_byte_da_sprite_a_desenhar)
                ld a, (largura_sprite_a_desenhar)
                srl a
                dec a
                ld c, a
                ld b, $00
                add hl, bc
                ld (primeiro_byte_da_sprite_a_desenhar), hl
                ld a, (largura_sprite_a_desenhar)
                res 0, a
                ld b, a
                ld a, ($8FAD)
                neg
                add a, b
                ld ($8FAD), a
                ld hl, $8FBB
                ld a, $C3
        _end_if

        ld ($8FA4), a
        ld ($8FA5), hl
        ld a, (sprite_top_copy)
        ld l, a
        ld h, $00
        add hl, hl
        ld bc, screen_memory_map
        add hl, bc
        push hl
        pop ix
        ld de, (primeiro_byte_da_sprite_a_desenhar)
        ld a, (sprite_left_copy)
        sub $20
        srl a
        jp c, L_8FC6
        ld ($8F9B), a
        ld a, ($9002)
        and a
        ld a, ($8F9B)
        jp nz, L_8FC6
        ld a, (background_color)
        and a
        _if_not z
                ld a, $AE
        _end_if

        ld ($8FA7), a
        ld a, (largura_sprite_a_desenhar_copy)
        srl a
        ld (largura_sprite_a_desenhar_copy), a

        _do
                ld l, (ix)
                inc ix
                ld h, (ix)
                inc ix
                ld bc, $0000
                add hl, bc
                dec hl
                ld a, (largura_sprite_a_desenhar_copy)
                ld b, a

                _do

                        ld a, (de)
                        nop
                        inc de
                        inc hl
                        and (hl)
                        ld (hl), a
                
                _djnz

                ex de, hl
                ld bc, $0000
                add hl, bc
                ex de, hl
                ld a, (altura_sprite_a_desenhar_copy)
                dec a
                ld (altura_sprite_a_desenhar_copy), a
        _while nz

        ret


        ; Start of unknown area $8FBB to $8FC5
        defb $C5, $06, $5B, $4F, $0A
        defb $C1, $23, $1B, $C3, $A7, $8F
        ; End of unknown area $8FBB to $8FC5


L_8FC6:
        ld ($8FFE), a
        ld a, ($8FAD)
        ld ($900F), a
        ld hl, function_9041
        ld a, (background_color)
        and a
        ld a, (sprite_espelho)
        jp z, L_8FE9
        ld hl, function_901d
        and a
        jp z, L_8FF0
        ld hl, function_9074
        jp L_8FF0


L_8FE9:
        and a
        jp z, L_8FF0
        ld hl, function_90a4

L_8FF0:
        ld ($900B), hl

        _do
                ld l, (ix)
                inc ix
                ld h, (ix)
                inc ix
                ld bc, $0000
                add hl, bc
                ld a, $00
                ld ($9B31), a
                ld a, (largura_sprite_a_desenhar_copy)
                ld b, a
                call function_901d
                ex de, hl
                ld bc, $0000
                add hl, bc
                ex de, hl
                ld a, (altura_sprite_a_desenhar_copy)
                dec a
                ld (altura_sprite_a_desenhar_copy), a
        _while nz
        ret


function_901d:
        ld a, ($9B31)
        and a
        _if_not z
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                jp L_9039

        _end_if

        _do
                        ld a, (de)
                        rlca
                        rlca
                        rlca
                        rlca
                        ld c, a
                        and $0F
                        xor (hl)
                        ld (hl), a
                        inc hl
                        dec b
                        ret z
                        ld a, c

L_9039:
                        and $F0
                        xor (hl)
                        ld (hl), a
                        inc de
        _djnz
        ret


function_9041:
        ld a, ($9B31)
        and a
        _if_not z
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                ld ($8E49), a
                jp L_9065
        _end_if

        _do
                ld a, (hl)
                and $F0
                ld c, a
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                ld ($8E49), a
                and $0F
                add a, c
                ld (hl), a
                inc hl
                dec b
                ret z

L_9065:
                ld a, (hl)
                and $0F
                ld c, a
                ld a, ($8E49)
                and $F0
                add a, c
                ld (hl), a
                inc de
        _djnz 
        ret


function_9074:
        ld a, ($9B31)
        and a
        _if_not z
                ld a, (de)
                push bc
                ld b, $5B
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                jp L_909C
        _end_if


        _do
                ld a, (de)
                push bc
                ld b, $5B
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld c, a
                and $0F
                xor (hl)
                ld (hl), a
                inc hl
                dec b
                ret z
                ld a, c

L_909C:
                and $F0
                xor (hl)
                ld (hl), a
                dec de
        _djnz
        ret


function_90a4:
        ld a, ($9B31)
        and a
        _if_not z
                ld a, (de)
                push bc
                ld b, $5B
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld ($8E49), a
                jp L_90D4
        _end_if

        _do
                ld a, (hl)
                and $F0
                ld c, a
                ld a, (de)
                push bc
                ld b, $5B
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld ($8E49), a
                and $0F
                add a, c
                ld (hl), a
                inc hl
                dec b
                ret z

L_90D4:
                ld a, (hl)
                and $0F
                ld c, a
                ld a, ($8E49)
                and $F0
                add a, c
                ld (hl), a
                dec de
        _djnz 
        ret


limpa_a_area_de_jogo:
        ld ix, $5CC4
        ld a, $88
        ld de, $0001

        _do
                ld l, (ix)
                ld h, (ix+$01)
                inc ix
                inc ix
                add hl, de
                ld b, $1E

                _do

                        ld (hl), $00
                        inc hl
                
                _djnz

                dec a
        _while nz

        ld a, $47
        jp L_8D89


L_9106:
        ld a, l
        and $F8
        ld h, $00
        ld d, h
        ld l, a
        add hl, hl
        add hl, hl
        srl e
        add hl, de
        ld de, $5D44
        add hl, de
        ret


        ; Start of unknown area $9117 to $9121
        defb $06, $2F, $04, $D6, $64, $30, $FB, $C6, $64
        defb $70, $23
        ; End of unknown area $9117 to $9121


L_9122:
        ld b, $2F

        _do
                inc b
                sub $0A
        _while nc

        add a, $3A
        ld (hl), b
        inc hl
        ld (hl), a
        ret


L_912F:
        call coloca_em_de_hl_6020_B800

        _do
                ld a, (hl)
                and a
                jr z, L_913E; break 
                push hl
                call desenha_uma_letra_no_ecra
                pop hl
                inc hl
        _while_true
        

L_913E:
        jp coloca_em_de_hl_5E22_B830


L_9141:
        call coloca_em_de_hl_6020_B800
        call L_914A
        jp coloca_em_de_hl_5E22_B830


L_914A:
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        ld a, $01
        ld (valor_inicia_do_a_21), a

L_9152:
        call get_first_or_second_nibble
        cp $0F
        _if_not z
                ld b, $0D
                cp $0D
                _if_not z
                        ld b, $1D
                        cp $0E
                        jr nz, L_9169

                _end_if
                call get_first_or_second_nibble
                add a, b

L_9169:
                ld hl, indice_letras
                ld c, a
                ld b, $00
                add hl, bc
                ld a, (hl)
                call desenha_uma_letra_no_ecra
                jr L_9152
        _end_if

        call get_first_or_second_nibble
        cp $0F
        ret z
        cp $08
        _if_not c
                jr z, L_9193
                cp $09
                jr z, L_91DA
                cp $0D
                jr z, L_91A1
                jr L_9152
        _end_if

        add a, $40
        ld ($9B3C), a
        jr L_9152


L_9193:
        call L_924F
        ld ($9B3D), a
        call L_924F
        ld ($9B3E), a
        jr L_9152


L_91A1:
        ld hl, (posicao_onde_comeca_o_nome_do_nivel)
        ld a, (valor_inicia_do_a_21)
        push hl
        push af
        ld b, $00

L_91AB:
        call get_first_or_second_nibble
        cp $0F
        _if_not z
                inc b
                cp $0E
                _if_not z
                        cp $0D
                        jr nz, L_91AB
                _end_if

                call get_first_or_second_nibble
                jr L_91AB
        _end_if


        ld a, (valor_inicia_do_a_20)
        sub b
        ld ($9B3D), a
        ld a, ($9B3E)
        add a, $08
        ld ($9B3E), a
        pop af
        pop hl
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        ld (valor_inicia_do_a_21), a
        jp L_9152


L_91DA:
        ld a, $0A
        ld ($9D31), a
        xor a
        ld ($9D32), a
        ld (background_color), a
        ld (sprite_espelho), a
        ld a, ($9B3C)
        ld (apenas_brite_and_ink), a
        call L_924F
        ld ($92CC), a
        ld ($9363), a
        ld bc, ($9B3D)
        add a, c
        add a, $04
        ld (valor_inicia_do_a_20), a
        call L_924F
        ld ($9324), a
        add a, a
        add a, a
        add a, a
        ld ($9357), a
        call L_92A5
        call L_92FE
        call L_933A
        ld a, ($9B3E)
        add a, $0C
        ld ($9B3E), a
        jp L_9152


indice_letras:
        defb $3A

        ; Start of unknown area $9223 to $924E
        defb $45, $54, $41, $4F, $49, $4E, $53, $48, $52, $44, $4C, $55, $42
        defb $43, $46, $47, $4A, $4B, $4D, $50, $51, $56, $57, $58, $59, $5A, $40, $3F, $30
        defb $31, $32, $33, $34, $35, $36, $37, $38, $39, $3B, $26, $27, $3C, $3E, $3D
        ; End of unknown area $9223 to $924E


L_924F:
        call get_first_or_second_nibble
        rlca
        rlca
        rlca
        rlca
        push af
        call get_first_or_second_nibble
        pop bc
        or b
        ret


get_first_or_second_nibble:
        ld hl, valor_inicia_do_a_21
        inc (hl)
        bit 0, (hl)
        _if_not z
                ld hl, (posicao_onde_comeca_o_nome_do_nivel)
                ld a, (hl)
                and $0F
                inc hl
                ld (posicao_onde_comeca_o_nome_do_nivel), hl
                ret
        _end_if

        ld hl, (posicao_onde_comeca_o_nome_do_nivel)
        ld a, (hl)
        srl a
        srl a
        srl a
        srl a
        ret


posicao_onde_comeca_o_nome_do_nivel:
        defw $0000

valor_inicia_do_a_21:
        defb $00

        ; Start of unknown area $9280 to $9280
        defb $00
        ; End of unknown area $9280 to $9280


desenha_uma_letra_no_ecra:
        ld b, a
        ld a, ($9B3E)
        ld l, a
        ld a, ($9B3D)
        add a, $20
        ld e, a
        ld a, ($9B3C)
        ld c, a
        ld a, b
        ld b, $00
        call L_8D3E
        call L_8DD7
        call desenha_sprite
        ld a, ($9B3D)
        add a, $02
        ld ($9B3D), a
        ret


L_92A5:
        ld a, ($9B3D)
        add a, $20
        ld e, a
        ld a, ($9B3E)
        add a, $08
        ld l, a
        call L_92C1
        ld a, ($9357)
        add a, l
        add a, $08
        ld l, a
        ld a, ($9B3D)
        add a, $20
        ld e, a

L_92C1:
        ld a, $2A
        call L_92F8
        ld a, $2E
        call L_92F8
        ld d, $00

        _do
                ld a, $28
                call L_92F8
                dec d
        _while nz

        ld a, $2E
        call L_92F8
        ld a, $2B

L_92DC:
        push hl
        push de
        push hl
        push de
        push af
        ld a, e
        sub $20
        ld e, a
        call L_9106
        ld a, (apenas_brite_and_ink)
        ld (hl), a
        pop af
        pop de
        pop hl
        call L_8D51
        call desenha_sprite
        pop de
        pop hl
        ret


L_92F8:
        call L_92DC
        inc e
        inc e
        ret


L_92FE:
        ld a, ($9B3D)
        add a, $20
        ld e, a
        inc e
        inc e
        push de
        ld a, ($9B3E)
        ld l, a
        call L_931A
        ld a, ($9B3E)
        ld l, a
        pop de
        ld a, ($92CC)
        inc a
        add a, a
        add a, e
        ld e, a

L_931A:
        ld a, $2C
        call L_92DC
        ld a, l
        add a, $10
        ld l, a
        ld d, $00

        _do
                ld a, $29
                call L_92DC
                ld a, l
                add a, $08
                ld l, a
                dec d
        _while nz

        ld a, l
        add a, $08
        ld l, a
        ld a, $2D
        jp L_92DC


L_933A:
        ld a, ($9B3D)
        add a, $04
        srl a
        ld ($935F), a
        ld a, ($9B3E)
        add a, $10
        ld e, a
        ld d, $00
        sla e
        rl d
        ld ix, screen_memory_map
        add ix, de
        ld c, $00

        _do 
                ld l, (ix)
                ld h, (ix+$01)
                ld de, $0000
                add hl, de
                ld b, $00

                _do
                        ld (hl), d
                        inc hl
        
                _djnz

                inc ix
                inc ix
                dec c
        _while nz
        ret


verifica_se_clicaram_tecla:
        di
        push hl
        ld l, a
        bit 4, a
        _if_not nz
                push bc
                ld bc, $FFFE
                and $E0
                rrca
                rrca
                add a, $80
                ld ($9390), a
                ld a, l
                rlca
                rlca
                rlca
                and $38
                add a, $47
                ld ($9394), a
                res 0, b
                in a, (c)
                bit 0, a
                pop bc
                pop hl
                ei
                ret
        _end_if

        rlca
        rlca
        rlca
        and $38
        add a, $47
        ld ($93A8), a
        in a, ($1F)
        xor $FF
        bit 0, a
        pop hl
        ret


L_93AB:
        ld a, ($9409)
        ld ($9D30), a
        ret


        ; Start of unknown area $93B2 to $940A
        defb $0E, $00, $21, $4D, $9D, $11, $53, $9D, $DD, $21, $59, $9D, $06, $06
        defb $7E, $CD, $70, $93, $28, $17, $1A, $CD, $70, $93, $28, $11, $3A, $8F, $72, $A7
        defb $28, $08, $DD, $7E, $00, $CD, $70, $93, $28, $03, $A7, $18, $01, $37, $CB, $11
        defb $23, $13, $DD, $23, $10, $DA, $79, $32, $09, $94, $21, $05, $94, $0E, $FF, $06
        defb $04, $7E, $CD, $70, $93, $20, $03, $A7, $18, $01, $37, $CB, $11, $23, $10, $F1
        defb $79, $32, $0A, $94, $C9, $C1, $60, $40, $03, $00, $00
        ; End of unknown area $93B2 to $940A


janela_do_jogo_preto:
        xor a
        ld (background_color), a
        ld bc, $1E11
        ld de, $0601
        call L_8D97
        ld hl, $5D44
        ld ($8DC1), hl
        ld ($9113), hl
        ret


copia_color_attributes_para_ecra:
        ld hl, $5800
        ld ($8DC1), hl
        ld ($9113), hl
        ld de, $58C1
        ld hl, $5E05
        ld c, $11

        _do
                ld b, $1E

                _do

                        ld a, (hl)
                        set 6, a
                        ld (de), a
                        inc hl
                        inc de
                
                _djnz

                inc hl
                inc de
                inc hl
                inc de
                dec c

        _while nz

        ret


L_9445:
        push af
        push bc

        _do
                ld bc, ($9D2E)

                _do
                        ld a, ($9D2F)
                        cp b
                _while z

                and $03
        _while z
        pop bc
        pop af
        ret


L_9458:
        call janela_do_jogo_preto
        call limpa_a_area_de_jogo
        xor a
        ld ($9D48), a
        ld ($9D47), a
        call desenha_nivel
        ld a, ($7929)
        and a
        _if_not nz
                ld hl, $68B8
                ld a, (nivel)
                cp $50
                _if_not z
                        ld hl, $30B8
                        cp $67
                        _if_not z
                        
                                ld hl, $3064
                                cp $7E
                                jr nz, L_94A0
                        _end_if
                _end_if

                ld ix, $8A0F
                ld (ix+$03), h
                ld (ix+$06), l

                _do
                        call L_7401
                        ld a, (ix+$03)
                        add a, $08
                        ld (ix+$03), a
                        cp (ix+$06)
                _while c
        _end_if
L_94A0:
        ld a, (nivel)
        cp $55
        _if_not nz
                ld a, ($7893)
                and a
                _if_not z
                        ld hl, $3690
                        call L_89D3
                        ld hl, $3A90
                        call L_89D3
                _end_if
        _end_if

        ld a, (nivel)
        cp $70
        _if_not nz
                ld a, ($7974)
                and a
                _if_not nz
                        ld hl, $4BA0
                        call L_89D3
                        ld hl, $4A94
                        call L_89D3
                        ld hl, $4A88
                        call L_89D3
                        ld hl, $4B7C
                        call L_89D3
                        ld hl, $4C70
                        call L_89D3
                _end_if 
        _end_if

        call L_95A6
        call L_891F
        call L_8B24
        call L_9948
        call copia_color_attributes_para_ecra
        jp function_nome_nivel


desenha_nivel:
        ld a, (nivel)
        cp $7F
        ret z
        ld hl, sprites_dos_niveis
        xor a
        ld (sprites_repetidos), a

L_9503:

        _do
                ld (posicao_atual_index_001), a
                ld de, numero_de_sprites_por_nivel
                add a, e
                ld e, a

                _if_not nc
                        inc d
                _end_if

                ld a, (de)
                ld (valor_atual_index_001), a
                and a
                
                ;_if_not z
                jp z, L_959B
                        ld a, (posicao_atual_index_001)
                        ld bc, (nivel)
                        sub c
                        ld b, a

                        _do
                                ld e, (hl)
                                inc hl
                                ld d, (hl)
                                inc hl
                                bit 7, e
                                _if_not z
                                        bit 5, (hl)
                                        _if_not z
                                                ld a, (hl)
                                                rlca
                                                rlca
                                                and $7F
                                                inc a
                                                ld (sprites_repetidos), a
                                                inc hl
                                        _else
                                                ld a, (hl)
                                                and $47
                                                ld (apenas_brite_and_ink), a
                                                ld a, (hl)
                                                rlca
                                                and $01
                                                ld (sprite_espelho), a
                                                ld a, (hl)
                                                and $18
                                                rrca
                                                rrca
                                                rrca
                                                ld (background_color), a
                                                inc hl
                                        _end_if
                                _end_if

                                res 7, e
                                ld (sprite_left), de
                                ld a, (sprites_repetidos)
                                and a

                                _if_not z
                                        dec a
                                        ld (sprites_repetidos), a
                                _else

                                        ld a, (hl)
                                        inc hl
                                        ld (next_sprite_index), a
                                _end_if

                                ld a, b
                                and a
                                _if_not nz
                                        push bc
                                        push hl
                                        call function_print_sprite
                                        ld a, (background_color)
                                        push af
                                        xor a
                                        ld (background_color), a
                                        call L_8DD7
                                        pop af
                                        ld (background_color), a
                                        call desenha_sprite
                                        ld a, (next_sprite_index)
                                        cp $5B
                                        call z, L_89EA
                                        ld a, (next_sprite_index)
                                        cp $73
                                        call z, L_89E0
                                        pop hl
                                        pop bc
                                _end_if

                                ld a, (valor_atual_index_001)
                                dec a
                                ld (valor_atual_index_001), a
                        _while nz
                ;_end_if
L_959B:
                ld a, (posicao_atual_index_001)
                inc a

        ;_while p
        jp p, L_9503

        ret


valor_atual_index_001:
        defb $00

posicao_atual_index_001:
        defb $00

sprites_repetidos:
        defb $00

L_95A6:
        ld b, $1E
        ld ix, $FFA2

        _do
                ld a, (nivel)
                cp (ix+$02)

                _if_not nz
                        push bc
                        push ix
                        xor a
                        ld bc, $0046
                        ld e, (ix)
                        ld l, (ix+$01)
                        call L_8D3E
                        call desenha_sprite
                        call L_8DD7
                        pop ix
                        pop bc
                _end_if

                ld de, $0003
                add ix, de
        _djnz 
        ret


L_95D5:
        ld a, $FF
        ld ($9D2A), a
        ld b, $1E
        ld ix, $FFA2
        ld de, $0003

        _do     
                res 7, (ix+$02)
                add ix, de
        _djnz 

L_95EB:
        ld a, ($9D2A)
        inc a
        ld ($9D2A), a
        ld hl, $FF90
        call L_9122
        ld hl, $FF8B
        call L_9141
        ld hl, $FF90
        call L_912F
        jp L_8A47


L_9607:
        ld b, $03
        ld a, $3A
        call L_9624
        ld bc, ($9D2C)
        ld a, $2F
        call L_9624
        ld hl, $FF93
        call L_9141
        ld hl, $FF98
        jp L_912F


        ; Start of unknown area $9623 to $9623
        defb $C9
        ; End of unknown area $9623 to $9623


L_9624:
        ld hl, $FF98

        _do
                ld (hl), a
                inc hl        
        _djnz

        ret


L_962C:
        ld hl, $9D2C
        ld a, ($9D2B)
        cp (hl)
        ret z
        _if_not c
                inc (hl)
                ld a, (hl)
        _else
                add a, (hl)
                srl a
                ld (hl), a
        _end_if

        add a, a
        add a, a
        add a, a
        xor $FF
        ld ($FF3D), a
        ld a, $04
        ld (sound_to_play), a
        ld a, ($9D2C)
        add a, a
        and $07
        ld e, a
        ld d, $00
        ld hl, $9681
        add hl, de
        ld c, (hl)
        ld hl, $4134
        ld de, $00F8
        ld b, $06

        _do 
                push bc
                ld a, ($9D2C)
                add a, a
                ld b, $08

L_9668:
                sub $08
                _if_not c
                        ld (hl), $FF
                        inc l
                        djnz L_9668
                _else

                        ld (hl), c
                        inc l
                        jr L_967A ; if b >0


                        _do
                                ld (hl), $00
                                inc l

L_967A:
                        _djnz

                _end_if

                add hl, de
                pop bc
        _djnz 
        ret


        ; Start of unknown area $9681 to $9688
        defb $80, $C0, $E0, $F0, $F8, $FC, $FE, $FF
        ; End of unknown area $9681 to $9688


function_nome_nivel:
        ld hl, $FF77
        call L_9141

        ld hl, $FBB1
        ld a, (nivel)
        cp $01
        _if_not z
                cp $18
                jr z, L_96D6
                ld hl, $FC69
                cp $1E
                jr z, L_96D6
                ld hl, $FC92
                cp $09
                jr z, L_96D6
                ld hl, $FD56
                cp $54
                jr z, L_96D6
                add a, $80
                ld b, a
                ld hl, nomes_niveis

L_96B8:
                ld a, (hl)
                cp $FF
                jr z, L_96D6
                cp b
                jr z, L_96D6
                inc hl

L_96C1:
                _do
                        ld a, (hl)
                        inc hl
                        cp $FF
                        jr z, L_96B8
                        and $0F
                        cp $0F
                        jr nz, L_96C1 ; continue 
                        ld a, (hl)
                        cp $F0
                _while nz
                inc hl
                jp L_96B8; jp não mexer
        _end_if

L_96D6:
        ld a, $20
        ld (valor_inicia_do_a_20), a
        inc a
        ld (valor_inicia_do_a_21), a
        inc hl
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        call coloca_em_de_hl_6020_B800
        call L_91A1
        jp coloca_em_de_hl_5E22_B830


L_96EC:
        ld a, $01
        ld ($9D27), a
        call L_9141
        call L_73E5
        jp L_A287


L_96FA:
        ld b, a
        ld c, $00

        _do
                ld a, c
                call L_98C7
                cp $02
                ret c
                cp b
                ret z
                inc c
        _while_true


L_9709:
        ld a, ($9D32)
        and a
        ret z
        ld hl, $846C
        call L_9926
        ld hl, $8478
        call L_9926
        ld a, (dados_mapa_65)
        ld ($84C0), a
        ld a, $01
        ld ($9D3F), a

L_9725:
        push ix
        ld a, $01
        ld ($9D27), a
        ld hl, inicio_qq_usado_em_9725
        call L_9141
        ld b, $00

        _do
                push bc
                call L_98D2
                pop bc
                inc b
                ld a, b
                cp $04
        _while nz

        ld hl, $FA5F
        ld a, ($8CBD)
        and a
        call z, L_9141
        ld a, ($9D33)
        ld hl, $FA3D
        and a
        _if_not nz
                ld hl, $FA20
        _end_if

        call L_9141
        ld bc, $FF02
        ld a, ($9D3F)
        and a
        ld a, b
        jr nz, L_9796
        ld b, $03

L_9764:
        ld a, ($9D2F)
        ld c, a

        _do
                ld a, ($9D2F)
                cp c
        _while z
        
        ld a, ($9D35)
        inc a
        and $07
        ld ($9D35), a
        ld hl, $9D36
        ld e, a
        ld d, $00
        add hl, de
        ld a, (hl)
        ld ($9B3C), a
        push bc
        call L_98D2
        call L_98B5
        pop bc
        ld c, a
        bit 3, c
        _if_not nz
                ld a, ($8CBD)
                and a
                ld a, b

                _if_not z

L_9796:
                        and a
                        _if_not z
                                bit 5, c
                                _if_not nz
                                        bit 2, c
                                        jr z, L_97A2

                                _end_if
                                dec a
                        _end_if
L_97A2:
                        cp $03
                        _if_not z
                                bit 4, c
                                jr nz, L_97AE
                                bit 1, c
                                _if_not z

L_97AE:
                                        inc a

                                _end_if
                        _end_if

                _end_if
                cp b
                jr z, L_9764
                call L_98C7
                ld a, d
                jr z, L_9796
                push af
                ld a, $42
                ld ($9B3C), a
                ld a, b
                cp $FF
                call nz, L_98D2
                pop bc
                jr L_9764
        _end_if


        ld a, b
        call L_98C7
        ld ($9819), a
        cp $01
        _if_not z
                call L_9826
                ld a, ($9819)
                call L_9912
                ld a, ($9947)
                and a
                _if_not z
                        ld a, ($9819)
                        cp $40
                        jr nz, L_97F6
                        ld hl, $85B0
                        call L_9926
                        ld a, ($9947)
                        and a
                        jr nz, L_97F6
                _end_if

                jr L_980F


L_97F6:
                ld hl, L_980F
                push hl
                ld a, ($9819)
                cp $01
                ret z
                cp $4D
                jr z, L_981A
                cp $4E
                jr z, L_9820
                pop hl
                call L_9841
        _end_if

        call L_A287

L_980F:
        xor a
        ld ($9D3F), a
        ld ($9D33), a
        pop ix
        ret


        ; Start of unknown area $9819 to $9819
        defb $00
        ; End of unknown area $9819 to $9819


L_981A:
        ld hl, $F495
        jp L_96EC


L_9820:
        ld hl, $F4B5
        jp L_96EC


L_9826:
        ld b, a
        ld ix, dados_mapa_0
        ld de, $000F
        
        _do
                add ix, de
        _djnz

        ret


        ; Start of unknown area $9833 to $9840
        defb $3E, $FF, $32, $47, $99, $C9, $CD, $47, $98, $DD, $36, $00, $FF
        defb $C9
        ; End of unknown area $9833 to $9840


L_9841:
        call L_9847
        jp L_9867


L_9847:
        ld a, ($9819)
        call L_9826
        ld c, a
        ld hl, $8CBC

        _do
                inc hl
                ld a, (hl)
                cp $01
                ret z
                cp c
        _while nz

        _do
                inc hl
                ld a, (hl)
                dec hl
                cp $01
                jr z, L_9864 ; break
                ld (hl), a
                inc hl
        _while_true


L_9864:
        ld (hl), $00
        ret


L_9867:
        ld a, (nivel)
        ld (ix), a
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        and $FE
        add a, $22
        ld (ix+$02), a
        cp $38

        _if_not c
                ld a, (nivel)
                cp $54
                jr z, L_9890
                ld a, (ix+$02)
        _end_if

        cp $50
        _if_not nc
                ld a, (nivel)
                cp $56
                _if_not nz

L_9890:
                        ld a, $90
                        jr L_989B

                _end_if
        _end_if


        ld a, ($9D0E)
        and $F8
        sub $08

L_989B:
        ld (ix+$03), a
        ld b, a
        ld a, (ix+$04)
        ld (next_sprite_index), a
        cp $13

        _if_not nz
                ld a, b
                sub $08
                ld (ix+$03), a
        _end_if

        ld a, $02
        ld (sound_to_play), a
        ret


L_98B5:
        call L_93AB
        and a
        _if_not z
                ld c, a
                ld a, ($9D3E)
                and a
                ld a, c
        _end_if

        ld ($9D3E), a
        ret z
        xor a
        ret


L_98C7:
        ld e, a
        ld d, $00
        ld hl, $8CBD
        add hl, de
        ld d, a
        ld a, (hl)
        and a
        ret


L_98D2:
        ld a, b
        rlca
        rlca
        rlca
        add a, $58
        ld ($9B3E), a
        ld a, $0C
        ld ($9B3D), a
        ld a, b
        call L_98C7
        ld hl, $FA7A
        jp z, L_9141
        ld hl, $7475
        ld de, $000F
        ld b, a

        _do
                add hl, de
        _djnz

        ld e, (hl)
        inc hl
        ld h, (hl)
        ld l, e
        cp $01
        jp nz, L_9141
        ld a, $74
        ld ($9B3E), a
        jp L_9141


L_9905:
        ld hl, $0000
        ld ($8CBD), hl
        ld hl, $0100
        ld ($8CBF), hl
        ret


L_9912:
        ld a, $FF
        ld ($9947), a
        push ix
        pop hl
        ld a, l
        or h
        ret z
        ld l, (ix+$07)
        ld h, (ix+$08)
        ld a, l
        or h
        ret z

L_9926:
        ld a, $FF
        ld ($9947), a
        ld a, (nivel)
        cp (hl)
        ret nz
        inc hl
        ld e, (hl)
        inc hl
        ld d, (hl)
        inc hl
        ld a, (hl)
        inc hl
        ld b, (hl)
        inc hl
        push hl
        ld l, a
        ld h, b
        ex de, hl
        call L_89B1
        pop hl
        ret nc
        xor a
        ld ($9947), a
        jp (hl)


        ; Start of unknown area $9947 to $9947
        defb $FF
        ; End of unknown area $9947 to $9947


L_9948:
        ld a, (nivel)
        cp $74
        ret nz
        ld a, (dados_mapa_56)
        cp $74
        ret nz
        ld a, ($77B9)
        cp $02
        ret nz
        ld a, $23
        ld hl, ($99C2)
        ld ($99BD), hl
        ld ($99BF), hl
        ld (next_sprite_index), a
        call function_print_sprite
        ld ix, $99BD
        ld hl, (primeiro_byte_da_sprite_a_desenhar)
        ld bc, (altura_sprite_a_desenhar)

        _do
                ld a, ($99C1)
                ld b, a

L_997A:
                push hl
                push bc
                ld a, (largura_sprite_a_desenhar)
                rrca
                ld d, a

                _do
                        ld e, $08
                        ld c, (hl)

                        _do
                                rlc c
                                _if_not nc
                                        ld a, ($99C1)
                                        ld b, a

                                
                                        _do

                                                exx
                                                call L_9AC2
                                                inc (ix)
                                                exx
                                        
                                        _djnz

                                _else

                                        ld a, ($99C1)
                                        add a, (ix)
                                        ld (ix), a
                                _end_if

                                dec e
                        
                        _while nz
                        inc hl
                        dec d
                _while nz

                ld a, (ix+$02)
                ld (ix), a
                inc (ix+$01)
                pop bc
                dec b
                _if_not z
                        pop hl
                        jr L_997A

                _end_if

                pop af
                dec c
        _while nz
        ret


        ; Start of unknown area $99BD to $99C3
        defb $00, $00, $00
        defb $00, $03, $64, $64
        ; End of unknown area $99BD to $99C3


L_99C4:
        ld ix, color_attribute_temp
        ld b, $03
        ld de, $00C8
        ld hl, $1000


 
        _do

                call L_9A88
                add ix, de
        
        _djnz

        ld de, $0800

        _do 
                push de
                halt
                ld a, ($9D2E)
                ld b, a
                ld a, ($9D2F)
                sub b
                cp $03

                _if_not c
                        ld a, ($9D2F)
                        ld ($9D2E), a
                _end_if

                ld ix, color_attribute_temp
                ld b, $03


        
                _do

                        push bc
                        push ix
                        call L_9A29
                        pop ix
                        ld de, $00C8
                        add ix, de
                        pop bc
                
                _djnz

                pop de
                dec de
                ld a, d
                or e
        _while nz
        ret


L_9A0B:
        ld a, (ix+$01)
        cp $C0

        jr nc, label_0002

        ld b, $32
        ld de, $0004


        _do

                exx
                call L_9AC2
                exx
                call L_9AFA
                exx
                call L_9AC2
                exx
                add ix, de
                
        _djnz

        ret


L_9A29:
        bit 0, (ix+$02)
        jr nz, L_9A0B
        call L_9AA7
        call L_9AFA
        ld a, (ix+$03)
        and a
        _if_not z
                jr L_9AA7
        _end_if

        push ix
        push bc
        ld e, (ix)
        ld d, (ix+$01)
        ld b, $32

        _do
                push bc
                ld (ix), e
                ld (ix+$01), d
                ld a, (hl)
                inc l
                and $3F
                sub $20
                ld (ix+$02), a
                set 0, (ix+$02)
                ld a, (hl)
                inc l
                and $07
                sub $0F
                ld (ix+$03), a
                exx
                call L_9AC2
                exx
                ld bc, $0004
                add ix, bc
                pop bc
        _djnz 
        pop bc
        pop ix
        ret

label_0002:


        push ix
        ld de, $0004
        ld b, $32

        _do

                exx
                call L_9AC2
                exx
                add ix, de
               
        _djnz

        pop ix

L_9A88:
        ld a, (hl)
        inc l
        ld (ix), a
        ld (ix+$01), $B8
        ld a, (hl)
        inc l
        and $3F
        sub $20
        ld (ix+$02), a
        res 0, (ix+$02)
        ld a, (hl)
        inc l
        and $0F
        sub $19
        ld (ix+$03), a

L_9AA7:
        exx
        call L_9AC2
        inc (ix)
        call L_9AC2
        inc (ix+$01)
        call L_9AC2
        dec (ix)
        call L_9AC2
        dec (ix+$01)
        exx
        ret


L_9AC2:
        ld a, (ix+$01)
        sub $30
        cp $88
        ret nc
        add a, $30
        ld de, screen_memory_map
        ld l, a
        ld h, $00
        add hl, hl
        add hl, de
        ld a, (hl)
        inc l
        ld h, (hl)
        ld l, a
        ld a, (ix)
        sub $08
        cp $F0
        ret nc
        add a, $08
        and $F8
        rrca
        rrca
        rrca
        add a, l
        ld l, a
        ld a, (ix)
        and $07
        ld bc, $9B19
        add a, c
        ld c, a

        _if_not nc
                inc b
        _end_if

        ld a, (bc)
        xor (hl)
        ld (hl), a
        ret


L_9AFA:
        ld a, (ix+$02)
        sra a
        sra a
        sra a
        add a, (ix)
        ld (ix), a
        ld a, (ix+$03)
        inc a
        ld (ix+$03), a
        sra a
        add a, (ix+$01)
        ld (ix+$01), a
        ret


        ; Start of unknown area $9B19 to $9B20
        defb $80, $40, $20, $10, $08, $04, $02
        defb $01
        ; End of unknown area $9B19 to $9B20


next_sprite_index:
        defb $00

sprite_left:
        defb $00

sprite_top:
        defb $00

apenas_brite_and_ink:
        defb $00

largura_sprite_a_desenhar:
        defb $00

altura_sprite_a_desenhar:
        defb $00

background_color:
        defb $00

sprite_espelho:
        defb $00

primeiro_byte_da_sprite_a_desenhar:
        defb $00

        ; Start of unknown area $9B2A to $9B2A
        defb $00
        ; End of unknown area $9B2A to $9B2A


valor_de:
        defb $22

        ; Start of unknown area $9B2C to $9B2C
        defb $5E
        ; End of unknown area $9B2C to $9B2C


valor_hl:
        defb $30

        ; Start of unknown area $9B2E to $9B2E
        defb $B8
        ; End of unknown area $9B2E to $9B2E


altura_sprite_a_desenhar_copy:
        defb $00

largura_sprite_a_desenhar_copy:
        defb $00

        ; Start of unknown area $9B31 to $9B31
        defb $00
        ; End of unknown area $9B31 to $9B31


sprite_top_copy:
        defb $00

sprite_left_copy:
        defb $00

        ; Start of unknown area $9B34 to $9B3E
        defb $00, $00, $0F, $0F, $FF, $FF, $F0, $F0, $07, $0A, $0A
        ; End of unknown area $9B34 to $9B3E


valor_inicia_do_a_20:
        defb $0A

L_9B40:
        ld (altura_do_novo_boneco), a
        push ix
        push hl
        ld a, l
        ld (linha_debaixo_onde_se_desenha_o_boneco), a
        pop hl
        ld a, e
        ld (hero_left_position_in_nibbles), a
        srl a
        ld de, $5C00
        ld (de), a
        inc de
        ld a, (altura_do_novo_boneco)
        di
        exx
        push bc
        push de
        push hl
        exx
        ld ($9CB3), sp
        ld h, $00
        ld l, a
        add hl, hl
        ld bc, index_mask_image_hero
        add hl, bc
        ld c, (hl)
        inc hl
        ld b, (hl)
        ld hl, mask_images_hero
        add hl, bc
        ld sp, hl
        pop bc
        ld a, c
        ld ($9CB1), a
        ld (de), a
        inc de
        ld a, (linha_debaixo_onde_se_desenha_o_boneco)
        sub c
        ld l, a
        ld h, $00
        add hl, hl
        ld bc, screen_memory_map
        add hl, bc
        ld a, l
        ld (de), a
        inc de
        ld a, h
        ld (de), a
        inc de
        ld (screen_memory_hero_top_line), hl
        ld ix, (screen_memory_hero_top_line)
        ld a, (hero_left_position_in_nibbles)
        ld c, a
        ld a, ($9CB1)
        srl c
        jr c, rotate_hero_image_4_bits_to_the_right

L_9B9E:
        ld l, (ix)
        inc ix
        ld h, (ix)
        inc ix
        ld b, $00
        add hl, bc
        ex af, af'
        exx
        pop bc
        pop de
        pop hl
        exx
        ld a, (hl)
        exx
        and c
        xor b
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc hl
        inc de
        ld a, (hl)
        exx
        and e
        xor d
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc hl
        inc de
        ld a, (hl)
        exx
        and l
        xor h
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc de
        xor a
        ld (de), a
        inc de
        ex af, af'
        dec a
        jp nz, L_9B9E
        ld sp, ($9CB3)
        exx
        pop hl
        pop de
        pop bc
        exx
        pop ix
        ei
        ret


rotate_hero_image_4_bits_to_the_right:
        ld l, (ix)
        inc ix
        ld h, (ix)
        inc ix
        ld b, $00
        add hl, bc
        ex af, af'
        exx
        pop bc
        pop de
        pop hl
        ld a, $FF
        scf
        rr c
        rr e
        rr l
        rra
        rr c
        rr e
        rr l
        rra
        rr c
        rr e
        rr l
        rra
        rr c
        rr e
        rr l
        rra
        ld ($9CB8), a
        xor a
        srl b
        rr d
        rr h
        rra
        rr b
        rr d
        rr h
        rra
        rr b
        rr d
        rr h
        rra
        rr b
        rr d
        rr h
        rra
        ld ($9CB9), a
        exx
        ld a, (hl)
        exx
        and c
        xor b
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc hl
        inc de
        ld a, (hl)
        exx
        and e
        xor d
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc hl
        inc de
        ld a, (hl)
        exx
        and l
        xor h
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc hl
        inc de
        ld a, (hl)
        exx
        ld hl, ($9CB8)
        and l
        xor h
        exx
        ld b, a
        xor (hl)
        ld (de), a
        ld (hl), b
        inc de
        ex af, af'
        dec a
        jp nz, rotate_hero_image_4_bits_to_the_right
        ld sp, ($9CB3)
        exx
        pop hl
        pop de
        pop bc
        exx
        pop ix
        ei
        ret


L_9C7B:
        di
        ld ($9CB3), sp
        ld sp, $5C00
        pop bc
        ld a, c
        ld ($9C91), a
        pop hl
        ld a, b

        _do
                ex af, af'
                ld e, (hl)
                inc hl
                ld d, (hl)
                inc hl
                ex de, hl
                ld bc, $0000
                add hl, bc
                pop bc
                ld a, (hl)
                xor c
                ld (hl), a
                inc hl
                ld a, (hl)
                xor b
                ld (hl), a
                inc hl
                pop bc
                ld a, (hl)
                xor c
                ld (hl), a
                inc hl
                ld a, (hl)
                xor b
                ld (hl), a
                ex de, hl
                ex af, af'
                dec a
        _while nz

        ld sp, ($9CB3)
        ei
        ret


altura_do_novo_boneco:
        defb $00

        ; Start of unknown area $9CB1 to $9CB1
        defb $00
        ; End of unknown area $9CB1 to $9CB1


linha_debaixo_onde_se_desenha_o_boneco:
        defb $00

        ; Start of unknown area $9CB3 to $9CB4
        defb $00, $00
        ; End of unknown area $9CB3 to $9CB4


screen_memory_hero_top_line:
        defw $0000

hero_left_position_in_nibbles:
        defb $00

        ; Start of unknown area $9CB8 to $9D0C
        defb $00, $00, $F5, $3E, $13, $18, $03, $F5
        defb $3E, $10, $01, $FD, $7F, $ED, $79, $F1, $C9, $CD, $BA, $9C, $3A, $45, $9D, $A7
        defb $28, $05, $3D, $28, $10, $18, $1C, $CD, $33, $C0, $3A, $46, $9D, $A7, $28, $24
        defb $CD, $E3, $C1, $18, $0E, $CD, $33, $D3, $3A, $46, $9D, $3D, $28, $16, $CD, $E3
        defb $D4, $18, $00, $3A, $46, $9D, $A7, $28, $08, $3D, $20, $08, $CD, $00, $D3, $18
        defb $03, $CD, $00, $C0, $3A, $46, $9D, $32, $45, $9D, $C3, $BF, $9C
        ; End of unknown area $9CB8 to $9D0C


posicao_hero_x_em_nibbles_copia_2:
        defb $19

        ; Start of unknown area $9D0E to $9D0E
        defb $78
        ; End of unknown area $9D0E to $9D0E


posicao_hero_x_em_nibbles_copia:
        defb $19

        ; Start of unknown area $9D10 to $9D14
        defb $78, $00, $00, $00, $00
        ; End of unknown area $9D10 to $9D14


frame_movimento_do_hero:
        defb $00

        ; Start of unknown area $9D16 to $9D19
        defb $00, $00, $00, $00
        ; End of unknown area $9D16 to $9D19


posicao_hero_x_em_nibbles:
        defb $00

        ; Start of unknown area $9D1B to $9D1B
        defb $00
        ; End of unknown area $9D1B to $9D1B


sera_o_nivel_copia_3:
        defb $00

        ; Start of unknown area $9D1D to $9D22
        defb $00, $00, $00
        defb $00, $00, $00
        ; End of unknown area $9D1D to $9D22


nivel:
        defb $00

nivel_copy:
        defb $00

        ; Start of unknown area $9D25 to $9D42
        defb $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $02, $03, $04, $05, $06, $05, $04, $03, $00, $00
        defb $00, $FF, $00
        ; End of unknown area $9D25 to $9D42


sound_to_play:
        defb $FF

        ; Start of unknown area $9D44 to $9D63
        defb $FF, $FF, $FF, $04, $00, $00, $00, $FF, $FF, $C2, $E2, $C0
        defb $01, $02, $E0, $81, $82, $80, $84, $83, $81, $13, $12, $14, $11, $10, $13, $00
        defb $00, $00, $00, $FF
        ; End of unknown area $9D44 to $9D63


L_9D64:
        push ix
        ld a, ($9D89)
        ld ix, $9D89
        dec a
        xor (ix+$01)
        rla
        rr (ix+$02)
        ld (ix), a
        cpl
        rla
        xor $30
        xor (ix+$01)
        ld (ix+$01), a
        xor (ix+$02)
        pop ix
        ret


        ; Start of unknown area $9D89 to $9D8B
        defb $59, $A3, $13
        ; End of unknown area $9D89 to $9D8B


L_9D8C:
        xor a
        ld ($9D60), a
        ld ($9D61), a
        ld ($9D62), a
        ld ($9D5F), a
        ld ($9D30), a
        ld a, ($9D2B)
        and a
        ret z
        call L_93AB
        ld c, a
        ld a, ($9D16)
        and a
        _if_not nz
                ld a, ($9D31)
                and a
                _if_not nz
                        bit 3, c
                        _if_not z
                                ld a, $01
                                ld ($9D5F), a
                                ret
                        _end_if
                _end_if
        _end_if


        bit 2, c

        _if_not z
                ld a, $01
                ld ($9D60), a
        _end_if

        bit 1, c
        _if_not z
                ld a, $01
                ld ($9D61), a
        _end_if

        bit 0, c
        _if_not z
                ld a, $01
                ld ($9D62), a
        _end_if

        ld a, ($9D63)
        and a
        ret nz
        ld bc, ($9D60)
        ld l, b
        ld h, c
        ld ($9D60), hl
        ret


L_9DE5:
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        ld (posicao_hero_x_em_nibbles_copia), a
        ld e, a
        ld a, ($9D0E)
        ld ($9D10), a
        inc a
        ld l, a
        ld d, $00
        ld h, d
        ld a, ($9D12)
        ld ($9D13), a
        jp L_9B40


L_9E00:
        ld a, $38
        ld (posicao_hero_x_em_nibbles_copia_2), a
        ld a, (nivel)
        dec a
        jp L_9E41


L_9E0C:
        ld a, $02
        ld (posicao_hero_x_em_nibbles_copia_2), a
        ld a, (nivel)
        inc a
        cp $2E
        jp nz, L_9E41
        ld a, $11
        ld (posicao_hero_x_em_nibbles_copia_2), a
        ld a, $2E
        jp L_9E41


L_9E24:
        ld a, ($9D0E)
        add a, $76
        ld ($9D0E), a
        ld a, (nivel)
        sub $17
        jp L_9E41


L_9E34:
        ld a, ($9D0E)
        sub $72
        ld ($9D0E), a
        ld a, (nivel)
        add a, $17

L_9E41:
        ld (nivel_copy), a
        ld a, $01
        ld ($9D27), a
        ret


label_0001:       
        ld a, (frame_movimento_do_hero)
        and a
        jp z, L_9EAE
        jp L_9F15


function_9254:
        ld a , ($9d2f)
        and $03
        ret nz
        ld hl, $5d44

        ld ($9113), hl
        call function_9e6a

        ld hl, $5800
        ld ($9113), hl
        ret


function_9e6a:
        call L_9C7B
        
        ld a, ($9D16)
        cp $06
        jp z, L_9F15
        ld a, ($9D2B)
        and a

        _if_not nz
                ld a, ($9D16)
                cp $07
                _if_not nz
                        xor a
                        ld ($9D60), a
                        ld ($9D61), a
                        ld a, (frame_movimento_do_hero)
                        cp $07
                        jp nz, L_9F15
                        ld a, $06
                        ld (frame_movimento_do_hero), a
                        xor a
                        ld ($9D44), a
                        jr L_9F15
                _end_if

                xor a
                ld (frame_movimento_do_hero), a
                ld a, $07
                ld ($9D16), a
                jr L_9F15
        _end_if


        ld a, ($9D16)
        cp $03

        jr nc, label_0001

L_9EAE:
        ld a, ($8B85)
        and a
        _if_not z
                ld a, ($9D14)
                and a
                jr z, L_9F15

        _end_if
        ld a, ($9D16)
        and a
        _if_not z
                ld a, (frame_movimento_do_hero)
                and $03
                srl a
                _if_not nc
                _end_if
        _end_if


        ld a, ($9D4B)
        and a
        _if_not z
                ld a, ($8B85)
                and a
                _if_not z
                        ld hl, (posicao_hero_x_em_nibbles_copia_2)
                        ld a, (nivel)
                        ld (posicao_hero_x_em_nibbles), hl
                        ld (sera_o_nivel_copia_3), a
                _end_if
        _end_if

        call L_9D8C
        ld a, ($9D60)
        cp $01
        _if_not nz
                ld a, $01
        _else

                ld a, ($9D61)
                cp $01
                _if_not nz
                        ld a, $02
                _else
                        xor a
                _end_if
        _end_if


        ld b, a
        ld a, ($9D62)
        and a
        _if_not z
                xor a
                ld (sound_to_play), a
                xor a
                ld (frame_movimento_do_hero), a
                ld a, $F8
                ld ($9D11), a
                ld a, $03
        _end_if

        add a, b
        ld ($9D16), a

L_9F15:
        ld a, (frame_movimento_do_hero)
        ld e, a
        ld a, ($9D63)
        and a
        ld a, ($9D16)
        _if_not nz
                ld hl, $A18D
                ld c, a
                ld b, $00
                add hl, bc
                ld a, (hl)
        _end_if

        sla a
        rla
        rla
        add a, e
        ld c, a
        ld b, $00
        ld hl, $A145
        add hl, bc
        ld a, (hl)
        ld ($9D12), a
        ld a, e
        inc a
        and $07
        ld (frame_movimento_do_hero), a
        ld a, (nivel)
        ld ($9D25), a
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        ld b, a
        ld ix, $9D60
        sub (ix)
        add a, (ix+$01)
        cp $01
        jp z, L_9E00
        cp $39
        jp z, L_9E0C
        cp $10
        jp nc, L_9F6E
        ld b, a
        ld a, (nivel)
        cp $2E
        jp z, L_9E00
        ld a, b

L_9F6E:
        ld (posicao_hero_x_em_nibbles_copia_2), a
        ld b, a
        ld a, (posicao_hero_x_em_nibbles_copia)
        cp b
        _if_not z
                jp c, L_A093
                jp L_A05A
        _end_if

L_9F7E:
        ld a, ($8B85)
        and a
        _if_not nz
                ld a, ($9D11)
                and a
                ld a, $01
                jp p, L_9F9E
        _end_if

        ld a, ($9D16)
        cp $06
        jr z, L_9FAC
        cp $08
        ld a, $FA
        _if_not z
                ld a, ($9D11)
                inc a
        _end_if
L_9F9E:
        ld ($9D11), a
        bit 7, a
        jp nz, L_9FB8
        jr L_9FED


L_9FA8:
        xor a
        ld ($9D14), a

L_9FAC:
        ld a, (nivel)
        ld b, a
        ld a, ($9D25)
        cp b
        ret nz
        jp L_9DE5


L_9FB8:
        neg
        ld b, a
        call L_A0E6
        ld de, $FFD8
        add ix, de
        ld a, ($9D19)
        sub $14
        ld ($9D19), a


 
        _do

                push bc
                call L_A0F8
                pop bc
                jr nz, L_9FA8  
                dec ix
                dec ix
                ld a, ($9D19)
                dec a
                ld ($9D19), a
                ld a, ($9D0E)
                dec a
                cp $42
                jp c, L_9E24
                ld ($9D0E), a
        
        _djnz

        jr L_9FA8


L_9FED:
        cp $08
        _if_not c
                ld a, $07
                ld ($9D11), a
        _end_if

        add a, $04
        ld b, a
        call L_A0E6
        ld de, $FFFA
        add ix, de
        ld a, ($9D19)
        sub $03
        ld ($9D19), a
        ld a, ($9D0E)
        sub $04
        ld ($9D0E), a


 
        _do

                push bc
                call L_A0F8
                pop bc
                jr nz, L_A034
                inc ix
                inc ix
                ld a, ($9D19)
                inc a
                ld ($9D19), a
                ld a, ($9D0E)
                inc a
                cp $B6
                jp nc, L_9E34
                ld ($9D0E), a
        
        _djnz

        jp L_9FA8


L_A034:
        ld a, ($9D0E)
        cp $42
        jp c, L_9E24
        jp z, L_9FA8
        ld ($9D0E), a
        ld a, $01
        ld ($9D14), a
        ld a, ($9D11)
        cp $02
        
        _if_not c
                ld a, $01
                ld (sound_to_play), a

        _end_if

        xor a
        ld ($9D11), a
        jp L_9FAC


L_A05A:
        call L_A0E6
        ld de, $FFEC
        add ix, de
        ld a, ($9D19)
        sub $0A
        ld ($9D19), a
        ld b, $03

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, (posicao_hero_x_em_nibbles_copia_2)
                ld ($9D18), a
                call L_A134
                and a
                pop bc
                call nz, L_A0CE
                ld a, ($9D19)
                sub $04
                ld ($9D19), a
                ld de, $FFF8
                add ix, de
        _djnz
        jp L_9F7E


L_A093:
        call L_A0E6
        ld de, $FFEC
        add ix, de
        ld a, ($9D19)
        sub $0A
        ld ($9D19), a
        ld b, $03

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, (posicao_hero_x_em_nibbles_copia_2)
                add a, $05
                ld ($9D18), a
                call L_A134
                and a
                pop bc
                call nz, L_A0CE
                ld a, ($9D19)
                sub $04
                ld ($9D19), a
                ld de, $FFF8
                add ix, de
        _djnz
        jp L_9F7E


L_A0CE:
        ld a, ($9D18)
        ld e, a
        ld a, ($9D19)
        ld l, a
        call L_9106
        bit 6, (hl)
        ret nz
        ld a, (posicao_hero_x_em_nibbles_copia)
        ld (posicao_hero_x_em_nibbles_copia_2), a
        pop af
        jp L_9F7E


L_A0E6:
        ld a, ($9D0E)
        ld ($9D19), a
        ld l, a
        ld h, $00
        add hl, hl
        ld de, screen_memory_map
        add hl, de
        push hl
        pop ix
        ret


L_A0F8:
        ld a, (posicao_hero_x_em_nibbles_copia_2)
        inc a
        ld ($9D18), a
        ld b, $05
        dec b

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, ($9D18)
                call L_A134
                and a
                pop bc
                call nz, L_A11F
                ld a, ($9D18)
                inc a
                ld ($9D18), a
                dec b
        _while nz
        ret


L_A11F:
        ld a, ($9D18)
        ld e, a
        ld a, ($9D19)
        ld l, a
        call L_9106
        ld a, (hl)
        bit 6, a
        ret nz
        pop hl
        xor $40
        bit 6, a
        ret


L_A134:
        ld c, a
        ld b, $00
        srl c
        _if_not c
                add hl, bc
                ld a, (hl)
                and $F0
                ret
        _end_if

        add hl, bc
        ld a, (hl)
        and $0F
        ret


        ; Start of unknown area $A145 to $A195
        defb $00, $01, $00, $01, $00, $01, $00, $01, $09, $0A, $0B
        defb $0C, $0D, $0E, $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $02, $03, $04
        defb $05, $06, $07, $08, $01, $19, $1A, $1B, $1C, $1D, $1E, $1F, $09, $20, $21, $22
        defb $23, $24, $25, $26, $11, $04, $05, $05, $06, $06, $05, $05, $04, $00, $01, $08
        defb $08, $07, $06, $07, $07, $08, $07, $06, $05, $04, $03, $02, $01, $00, $02, $01
        defb $03, $05, $04, $06, $07, $08
        ; End of unknown area $A145 to $A195


L_A196:
        ld de, (posicao_hero_x_em_nibbles)
        ld a, (sera_o_nivel_copia_3)
        cp $67

        _if_not z
                cp $7E
                jr nz, L_A1AA
        _end_if


 
       
        ld a, $50
        ld de, $6B16

L_A1AA:
        ld (posicao_hero_x_em_nibbles_copia_2), de
        ld (nivel_copy), a
        ld (nivel), a
        cp $56

        _if_not z
                cp $54
                jr nz, L_A1DD
                ld a, e
                cp $18
                jr c, L_A1DD
        _else
                ld a, e
                cp $30
                jr nc, L_A1DD
        _end_if


        ld a, $9F
        ld ($9D0E), a
        ld a, $A0
        ld ($7509), a
        ld ($7518), a
        ld ($7527), a
        ld ($7536), a
        jr L_A205


L_A1DD:
        ld a, (nivel)
        cp $4C
        _if_not z
                cp $4F
                jr nz, L_A1F0

        _end_if

        ld a, d
        cp $90
        jr c, L_A205
        ld a, (nivel)

L_A1F0:
        ld hl, $A267
        ld b, $04

        _do
                cp (hl)
                _if_not nz
                        ld de, ($9D1D)
                        ld (posicao_hero_x_em_nibbles_copia_2), de
                        jr L_A205
                _end_if

                inc hl
        _djnz 

L_A205:
        ld hl, $0000
        ld ($9D5F), hl
        ld ($9D61), hl
        xor a
        ld ($9D11), a
        ld ($9D14), a
        ld ($9D16), a
        ld (frame_movimento_do_hero), a
        ld ($9D2C), a
        ld a, $1F
        ld ($9D2B), a
        ld a, $0F
        ld ($9D31), a
        ld a, $01
        ld ($9D12), a
        ld ($9D44), a
        ld a, $01
        ld ($9D27), a
        ld hl, dados_mapa_52
        call L_7CCF
        call L_9458
        
        _do
                call L_895C
                call L_962C
                call playsound

                _do
                        ld a, ($9D2E)
                        ld b, a
                        ld a, ($9D2F)
                        sub b
                        cp $03
                _while c

                ld a, ($9D2F)
                ld ($9D2E), a
                ld a, (dados_mapa_52)
                inc a
        _while nz
        call L_9DE5

        ; Start of unknown area $A262 to $A26A
        defb $AF, $32, $27, $9D, $C9, $4C, $4F, $5C, $54
        ; End of unknown area $A262 to $A26A


L_A26B:
        ld a, (nivel_copy)
        ld (nivel), a
        and $FE
        cp $2C
        ld a, $FF

        _if_not nz
                xor a
        _end_if

        ld ($9D63), a
        ld hl, (posicao_hero_x_em_nibbles_copia_2)
        ld ($9D1D), hl
        xor a
        ld ($791A), a

L_A287:
        ld a, $01
        ld ($9D27), a
        call L_9458
        call L_9DE5

after_call_force_disassemle_005:
        xor a
        ld ($9D27), a
        ret


stack:
        defb $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A, $2A

numero_de_sprites_por_nivel:
        defb $30, $32, $26, $00, $00, $00, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $1E, $00, $00, $00, $00, $00, $21, $00, $2D, $00, $00, $46, $28, $00, $00, $00, $00, $00, $06, $00, $2C, $1E, $24, $32, $00, $00, $00, $48, $3E, $29, $43, $3F, $37, $31, $4F, $3B, $00, $00, $00, $00, $32, $22, $3E, $00, $00, $2B, $36, $3A, $4B, $39, $5B, $42, $23, $38, $42, $22, $3D, $46, $4D, $29, $19, $2D, $1C, $54, $00, $5B, $00, $00, $38, $00, $00, $00, $00, $00, $00, $00, $00, $42, $4C, $36, $00, $00, $00, $00, $00, $00, $00, $48, $3E, $00, $00, $39, $2B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $31, $00


        include "sprite_niveis.asm"
        include "sprites.asm"
        include "texts.asm"


inicio_qq_usado_em_9725:
        defb $F4

        ; Start of unknown area $FA0C to $FB96
        defb $F8, $06, $38, $F9
        defb $16, $08, $F5, $FD, $DC, $4C, $03, $91, $0D, $13, $99, $DC, $56, $D3, $F2, $FF
        defb $F7, $F8, $0E, $88, $F9, $0E, $02, $F5, $F8, $12, $98, $D1, $84, $47, $10, $52
        defb $1D, $60, $24, $F8, $15, $A0, $C7, $10, $49, $0A, $94, $D7, $FF, $F7, $F8, $0C
        defb $88, $F9, $10, $02, $F5, $F8, $10, $98, $DC, $4C, $03, $91, $0D, $13, $99, $DC
        defb $56, $D3, $F8, $10, $A0, $24, $40, $D6, $CD, $18, $02, $40, $84, $BA, $FF, $F8
        defb $16, $60, $F7, $6F, $81, $96, $04, $F8, $1C, $60, $2F, $81, $F6, $08, $F8, $22
        defb $60, $5F, $82, $56, $06, $F8, $28, $60, $D3, $FF, $FF, $1D, $B5, $20, $36, $A0
        defb $A4, $6E, $A2, $0A, $94, $D7, $FF, $74, $D6, $10, $D6, $3D, $35, $D1, $0D, $75
        defb $D7, $17, $FF, $30, $D7, $19, $74, $63, $B0, $72, $19, $14, $FF, $30, $D0, $C9
        defb $65, $6D, $30, $24, $9D, $18, $FF, $30, $D7, $45, $74, $61, $A0, $3D, $7D, $7B
        defb $1F, $F0, $30, $A3, $D3, $D3, $19, $FF, $30, $B1, $3D, $2F, $F0, $30, $B5, $D3
        defb $82, $65, $6D, $30, $94, $AF, $F0, $36, $03, $6D, $15, $16, $20, $B3, $D6, $D7
        defb $FF, $30, $D1, $B4, $28, $0A, $C7, $21, $9F, $F0, $30, $D0, $B3, $D1, $D5, $0D
        defb $13, $2F, $F0, $28, $10, $EA, $13, $2D, $61, $EA, $0D, $13, $D5, $1F, $F0, $28
        defb $10, $EA, $A9, $56, $D5, $D6, $1E, $A0, $D7, $42, $54, $6F, $F0, $28, $10, $83
        defb $6A, $B1, $FF, $1D, $BD, $13, $B5, $D0, $C9, $FF, $30, $D0, $5D, $30, $72, $5D
        defb $1D, $5F, $F0, $DA, $5D, $D3, $9A, $7B, $3D, $C1, $90, $29, $5A, $16, $2F, $F0
        defb $28, $10, $D3, $4B, $A0, $D1, $94, $77, $FF, $30, $D0, $3D, $30, $4D, $20, $9C
        defb $D0, $D0, $57, $8F, $F0, $74, $D6, $12, $85, $6D, $30, $72, $5D, $1D, $5D, $CF
        defb $F0, $28, $10, $D7, $4D, $A1, $90, $D7, $5B, $BF, $F0, $30, $D0, $CD, $1D, $51
        defb $2F, $F0, $30, $D0, $CD, $1D, $51, $20, $4D, $20, $84, $20, $DA, $32, $19, $FF
        defb $A4, $93, $0D, $29, $4D, $3F, $F0, $DD, $3D, $57, $EA, $09, $56, $D3, $FF, $D0
        defb $3D, $1D, $5A, $44, $90, $D5, $1D, $CF, $F0, $DA, $11, $AD, $55, $BB, $19, $0D
        defb $74, $25, $46, $FF, $1D, $6D, $72, $DC, $0D, $65, $BD, $50, $D0, $42, $2B, $1F
        defb $F0, $30, $93, $5B, $56, $D3, $FF
        ; End of unknown area $FA0C to $FB96


nomes_niveis:
        defb $80

        ; Start of unknown area $FB98 to $FDFF
        defb $7D, $7D, $10, $49, $0D, $25, $91, $02
        defb $40, $72, $39, $2F, $F0, $82, $D1, $46, $D3, $93, $2C, $B3, $25, $46, $7D, $EF
        defb $F0, $AF, $DD, $3D, $57, $EA, $02, $4D, $A1, $9F, $F0, $97, $DA, $17, $20, $24
        defb $DA, $19, $FF, $AE, $D6, $59, $94, $9E, $DD, $65, $99, $49, $DF, $FF, $C5, $D6
        defb $35, $60, $83, $BB, $FF, $C6, $16, $29, $36, $D1, $10, $83, $BB, $FF, $C7, $5D
        defb $11, $0D, $73, $B3, $D1, $10, $16, $29, $36, $D1, $1F, $F0, $DC, $28, $10, $D1
        defb $9D, $CD, $72, $FF, $F3, $28, $10, $A1, $1D, $71, $72, $0A, $C6, $D3, $14, $6F
        defb $F0, $F4, $28, $10, $4C, $D0, $B5, $12, $21, $FF, $AC, $D1, $C9, $54, $C7, $19
        defb $03, $6A, $0D, $1C, $95, $4C, $71, $9F, $F0, $AD, $28, $10, $D1, $81, $77, $D0
        defb $43, $9A, $FF, $C8, $3D, $19, $47, $70, $28, $10, $D0, $95, $AD, $31, $FF, $C9
        defb $28, $10, $29, $4B, $BD, $09, $5A, $D3, $1F, $F0, $CA, $7B, $11, $D7, $DC, $08
        defb $4B, $B4, $DA, $FF, $CB, $28, $10, $7D, $A4, $9A, $05, $60, $28, $10, $72, $46
        defb $1F, $F0, $B3, $28, $10, $D0, $39, $AE, $A7, $02, $91, $18, $4C, $71, $FF, $B4
        defb $4C, $20, $46, $03, $0B, $5D, $6D, $0F, $F0, $B5, $28, $10, $DA, $32, $D1, $8E
        defb $F2, $4D, $A1, $9F, $F0, $CC, $28, $10, $A9, $3D, $AD, $09, $5A, $D3, $1F, $F0
        defb $B6, $28, $10, $D1, $83, $D7, $1B, $FF, $CD, $28, $10, $28, $94, $61, $09, $44
        defb $D6, $FF, $A0, $28, $10, $23, $BB, $17, $20, $24, $DA, $19, $FF, $B7, $28, $10
        defb $CD, $7D, $71, $90, $D3, $3B, $B1, $9D, $CF, $F0, $CE, $28, $10, $D3, $93, $6A
        defb $08, $3B, $BF, $F0, $B8, $30, $24, $DA, $19, $0D, $A5, $28, $03, $0D, $95, $1D
        defb $AF, $F0, $CF, $D1, $37, $2B, $10, $D0, $3D, $1D, $50, $A4, $49, $FF, $B9, $56
        defb $02, $81, $0D, $1B, $4C, $A7, $FF, $E5, $28, $10, $D2, $49, $D3, $42, $21, $60
        defb $AC, $6D, $31, $46, $FF, $E6, $28, $10, $71, $D1, $91, $20, $D7, $37, $73, $D3
        defb $1F, $F0, $D0, $DC, $10, $4B, $A1, $0D, $A1, $BB, $FF, $E7, $A4, $DA, $60, $30
        defb $DA, $1B, $BF, $F0, $FE, $72, $5D, $1D, $5D, $C0, $16, $AF, $F0, $A3, $28, $10
        defb $29, $11, $02, $4D, $7F, $F0, $BA, $CD, $70, $30, $29, $11, $FF, $D1, $D0, $C7
        defb $8D, $C0, $D3, $94, $D9, $1F, $F0, $A4, $24, $D7, $04, $D2, $02, $81, $0D, $64
        defb $64, $B5, $28, $FF, $BB, $CD, $70, $28, $10, $D6, $46, $4B, $52, $8F, $F0, $D2
        defb $28, $10, $D6, $DC, $72, $19, $54, $C7, $0D, $64, $64, $B5, $28, $FF, $D3, $DA
        defb $15, $9A, $81, $6D, $31, $FF, $D6, $28, $10, $83, $C6, $21, $A0, $7D, $A3, $D6
        defb $D7, $FF, $D5, $D3, $44, $A0, $DA, $52, $D1, $80, $D3, $B1, $6A, $3E, $A7, $05
        defb $7B, $1F, $F0, $AA, $28, $10, $83, $9D, $7D, $CE, $A7, $01, $DC, $95, $1F, $F0
        defb $C0, $D1, $B5, $D6, $D0, $56, $D3, $03, $0D, $94, $BD, $13, $64, $FF, $C2, $81
        defb $BB, $D3, $32, $1F, $F0, $D7, $28, $10, $84, $20, $DA, $32, $19, $0D, $31, $DC
        defb $71, $9F, $F0, $D9, $A1, $7D, $11, $62, $05, $62, $40, $28, $10, $A1, $D7, $28
        defb $7F, $F0, $EF, $28, $10, $D1, $93, $D1, $D5, $70, $4D, $20, $D3, $18, $16, $63
        defb $FF, $F0, $83, $A1, $7F, $F0, $C1, $28, $10, $A4, $9D, $63, $62, $0D, $94, $BD
        defb $13, $64, $FF, $C1, $28, $10, $3D, $12, $5D, $91, $0D, $94, $BD, $13, $64, $FF
        defb $FF, $7D, $5D, $CF, $F0, $06, $00, $78, $CD, $70, $93, $C8, $04, $78, $E6, $07
        defb $FE, $05, $20, $F3, $78, $C6, $1B, $47, $20, $ED, $04, $C9, $00, $C3, $40, $FF
        ; End of unknown area $FB98 to $FDFF


lista_de_fd:
        defb $FD

        ; Start of unknown area $FE01 to $FF00
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
        defb $FD
        ; End of unknown area $FE01 to $FF00


playsound:
        ld a, (sound_to_play)
        cp $FF
        ret z
        add a, a
        add a, a
        ld d, $00
        ld e, a
        ld hl, sons
        add hl, de
        ld a, $FF
        ld (sound_to_play), a
        ld b, (hl)
        inc hl
        ld c, (hl)
        inc hl
        ld d, (hl)
        ld e, $00

        _do

                ld a, c

                _do
                        dec a
                _while nz

                ld a, e
                xor $10
                ld e, a
                out ($FE), a
                ld a, c
                add a, d
                ld c, a
        
        _djnz

        ret


sons:
        db $64, $96, $FF, $FF
        db $0A, $FF, $00, $FF
        db $28, $64, $00, $FF
        db $64, $3C, $00, $FF
        db $0A, $FF, $00, $FF

        
        defb $F3, $F5, $C5, $D5, $E5, $DD, $E5, $D9, $08, $F5, $C5, $D5, $E5, $FD, $E5, $3A
        defb $8E, $72, $A7, $C4, $C9, $9C, $3A, $2F, $9D, $3C, $32, $2F, $9D, $3A, $27, $9D
        defb $A7, $CC, $54, $9E, $CD, $B2, $93, $FD, $E1, $E1, $D1, $C1, $F1, $D9, $08, $DD
        defb $E1, $E1, $D1, $C1, $F1, $FB, $C9, $F6, $F8, $08, $18, $00, $00, $00, $00, $00
        defb $00, $00, $00, $00, $00, $00, $00, $F8, $20, $10, $FF, $F6, $F8, $19, $08, $FF
        defb $30, $30, $00, $F6, $F8, $20, $08, $FF, $20, $20, $20, $00, $F7, $F8, $00, $00
        defb $11, $FF, $28, $A0, $01, $48, $80, $17, $30, $98, $1E, $4E, $38, $20, $3E, $50
        defb $2C, $22, $90, $2D, $3C, $60, $33, $3E, $98, $38, $4C, $38, $39, $38, $58, $3A
        defb $3E, $A0, $42, $3A, $38, $45, $42, $90, $46, $26, $60, $49, $2E, $40, $4B, $38
        defb $90, $4D, $24, $60, $4F, $3A, $40, $51, $28, $98, $52, $36, $38, $53, $24, $98
        defb $54, $38, $90, $55, $24, $90, $57, $2E, $78, $5C, $26, $78, $66, $44, $A0, $67
        defb $26, $88, $6F, $2E, $50, $6F, $26, $A0, $70, $4A, $A0, $74
        ; End of unknown area $FF30 to $FFFB


 
