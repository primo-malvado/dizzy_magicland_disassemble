color_attribute_temp equ $5de4
screen_memory_map equ $5c64
espelho_bytes equ $5b00
screenpixels equ $4000
screenattributes equ $5800
data_ffff equ $ffff

dizzy_image_xor_background equ $5c00


        org $5e49

        db $0c, $11, $cd, $3e, $5e, $21, $00, $c0, $11, $00, $40, $01, $00, $1b, $ed, $b0, $3e, $10, $cd, $3e, $5e

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
        ld de, screenpixels
        ld b, $c0

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
        out ($fe), a
        im 2
        ld a, $fe
        ld i, a
        ld bc, $5000 ; static


        _do

                in a, ($1f)
                or c
                ld c, a
                ei
                halt
                di
        
        _djnz

        ld a, c
        and $e0
        ld a, $ff

        _if_not z
                xor a
        _end_if

        ld (data_728f), a
        ei

        jp restart_game


        ; start of unknown area 0x5eb3 to 0x6043
        db $63, $22, $d6, $5e, $7a, $32, $fa, $5d, $f1, $08, $e1, $7c, $ed
        db $47, $7d, $ed, $4f, $f1, $fd, $e1, $dd, $e1, $c1, $d1, $e1, $d9, $c1, $d1, $e1
        db $ed, $7b, $14, $5f, $00, $cd, $00, $50, $c3, $d6, $5d, $db, $3f, $aa, $0f, $38
        db $fa, $db, $1f, $5f, $7a, $d3, $3f, $ee, $81, $57, $c9, $d3, $1f, $7a, $d3, $3f
        db $ee, $81, $57, $db, $3f, $aa, $0f, $30, $fa, $c9, $23, $5e, $78, $08, $31, $00
        db $40, $10, $3a, $5c, $c0, $e2, $fd, $7f, $9b, $36, $58, $27, $fd, $7f, $00, $00
        db $00, $a1, $2b, $2d, $a8, $5d, $c1, $fb, $c9, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $a8, $00, $00, $00, $69, $cf, $96, $01
        db $01, $fd, $7f, $ed, $79, $11, $00, $c0, $21, $00, $61, $01, $00, $40, $ed, $b0
        db $01, $fd, $7f, $3e, $10, $ed, $79, $c9, $3e, $13, $18, $e4, $3e, $11, $18, $e0
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        db $00, $00, $00, $00
        ; end of unknown area 0x5eb3 to 0x6043



        include "image_mask.asm"

data_728e:
        db $01

data_728f:
        db $00

        db $01


restart_game:
        ld hl, color_attribute_temp
        ld de, color_attribute_temp+1
        ld bc, $025f ; static ,  copiar 608 bytes, 19 linhas menos um byte
        ld (hl), $42
        ldir

        ld a, $01
        ld (data_9d27), a
        xor a
        ld (nivel), a

        call l_9458
        ld hl, texts ; posicao onde comeca o nome do nivel
        call write_on_screen
        ld a, $46
        ld (apenas_brite_and_ink), a
        ld a, $1b
        ld e, $3a
        ld l, $3c
        call l_8d51
        call l_8dd7
        call desenha_sprite
        xor a
        ld (data_9d46), a
        ld a, (data_ffff)
        and a

        _if_not nz
                ld hl, data_ff9c 
                call write_on_screen
        _end_if

        _do 
                call l_93ab
                and $09
        _while z

        ld a, $ff
        ld (data_9d46), a
        call l_88a0
        call l_95d5
        call l_9905
        ld a, $03
        ld (data_9d2d), a
        ld de, $781d ; static value
        ld (posicao_hero_x_em_nibbles), de
        ld a, $53
        ld (sera_o_nivel_copia_3), a
        ld (data_9d41), a

l_72fd:
        call l_a196
        call l_9607
        ld a, $01
        ld (data_9d46), a
        ld hl, $0000  ; static
        ld (data_9d2e), hl

l_730e:
        xor a
        ld (data_9d32), a
        dec a
        ld (data_9d4c), a
        ld hl, data_9d31
        dec (hl)

        
        jp p, l_7330 ;  _if_not p
                inc (hl)
                ld a, (data_9d16)
                and a
                _if_not nz
                        ld a, (data_9d30)
                        bit 3, a
                        _if_not z
                                ld a, $ff
                                ld (data_9d32), a
                        _end_if
                _end_if
        ;_end_if
l_7330:
        call l_895c
        call l_962c
        call l_8a55
        call l_9709
        call l_8b87
        call l_8c18
        call l_8cc1
        call l_8a92
        call playsound
        ld bc, (nivel)
        ld a, c
        cp b
        _if_not z
                cp $2a
                _if_not nz
                        ld a, (data_9d0d)
                        add a, $20
                        ld l, a
                        ld a, (data_9d0e)
                        sub $0a
                        ld h, a
                        ld (data_8b7d), hl

                _end_if
                call l_a26b
        _end_if

        ld a, (data_940a)
        cp $fd
        _if_not z

                _do
                        ld bc, (data_9d2e)
                        ld a, b
                        sub c
                        cp $03
                _while c


                ld a, b
                ld (data_9d2e), a
                ld a, (data_9d41)
                and a
                jr z, l_73c3
                ld a, (data_9d4c)
                ld (data_9d4b), a
                ld a, (data_9d2c)
                and a
                jp nz, l_730e ; jp não mexer
                ld a, (data_9d44)
                and a
                jp nz, l_730e ; jp não mexer
                ld a, $01
                ld (data_9d27), a
                ld hl, data_f85e ; posicao onde comeca o nome do nivel
                call write_on_screen
                ld hl, (posicao_texto_a_escrever)
                call write_on_screen
                ld a, $ff
                ld (data_9d46), a
                call l_73e5
                call l_9c7b

                ld hl, data_9d2d
                dec (hl)
                jp nz, l_72fd ; jp não mexer

        _end_if

        ld a, $ff
        ld (data_9d46), a
        jp restart_game  ; jp não mexer


l_73c3:
        ld a, $01
        ld (data_9d27), a
        ld a, $02
        ld (nivel), a
        call l_9458
        ld hl, data_f231 ; posicao onde comeca o nome do nivel
        call write_on_screen
        call l_73e5
        call l_9458
        call l_99c4
        jp restart_game ; jp não mexer


        ; start of unknown area 0x73e2 to 0x73e4
        db $cd, $41, $91
        ; end of unknown area 0x73e2 to 0x73e4


l_73e5:
        _do
                call l_93ab
                and a
        _while nz

        _do 
                call playsound
                call l_93ab
                and a
        _while z
        ret


l_73f5:
        set 5, (ix+$0a)
        call l_7401
        res 5, (ix+$0a)
        ret


l_7401:
        push ix
        ld a, (ix+$04)
        ld e, (ix+$02)
        ld l, (ix+$03)
        ld (next_sprite_index), a
        ld a, e
        ld (sprite_left), a
        ld a, l
        ld (sprite_top), a
        ld a, (ix+$0a)
        and $47
        ld (apenas_brite_and_ink), a
        ld a, (ix+$0a)
        rlca
        and $01
        ld (sprite_espelho), a
        ld a, (ix+$0a)
        and $08
        rrca
        rrca
        rrca
        ld (dynamic_743d+1), a
        call function_print_sprite
        bit 5, (ix+$0a)
        call z, l_7453
dynamic_743d:        
        ld a, $01
        ld (background_color), a
        call desenha_sprite
        pop ix
        push ix
        bit 5, (ix+$0a)
        call nz, l_745f
        pop ix
        ret


l_7453:
        bit 4, (ix+$0a)
        ret nz
        xor a
        ld (background_color), a
        jp l_8dd7


l_745f:
        bit 4, (ix+$0a)
        ret nz
        xor a
        ld (background_color), a
        ld a, $47
        ld (apenas_brite_and_ink), a
        jp l_8dd7


        include "dados_mapa.asm"

function_index:
        defw function_88f1, l_7401, function_88f1, l_7401, l_7401, l_7401, l_7401, l_7401, function_7b9c, l_7401, l_7401, function_83a6, function_862c, function_7c4e, l_7401, l_7401, l_7401, l_7401, function_7e8f, function_8091, function_81f8, l_7401, l_7401, l_7401, l_7401, l_7401, function_7c23, l_7401, function_7d74, function_7d74, function_7d74, function_8268, l_7401, function_833f, function_8306

function_index_04:
        defw function_88f1, function_88f1, function_7a6a, function_7b6e, function_887d, function_7b85, function_880c, function_7a6a, function_7a6a, function_7bba, function_7c9b, function_83b4, function_8637, function_7c56, function_7d43, function_7e57, function_7f26, function_8107, function_7e94, function_809c, function_822d, function_8134, function_8189, function_81c4, function_8737, function_7bc6, function_7c4d, function_7cf0, function_7dfa, function_7db1, function_7d7a, function_8298, function_82d8, function_834b, function_88f1

data_7a60:        
        dw $0000, $0000, $0000, $0000, $0000 ; static

function_7a6a:
        ld a, (data_9d32)
        and a
        ret z
        call l_8998
        ret nc
        xor a
        ld (data_9d32), a
        ld a, (ix+$04)
        cp $07
        jp z, l_7b24 ; jp não mexer
        cp $0b
        jp z, l_7ae1 ; jp não mexer
        cp $0f
        jp z, l_7b04 ; jp não mexer
        cp $13
        jp z, l_7aed ; jp não mexer
        cp $1d
        _if_not c
                cp $27
                jp c, l_7b32 ; jp não mexer
        _end_if
l_7a97:
        ld hl, data_8cbd
        ld b, $00

        _do
                ld a, (hl)
                cp $01
                jr z, l_7ac0
                and a
                
                _break_if z

                inc hl
                inc b
        _while_true


l_7aa8:
        _do

                ld a, b
                and a

                _break_if z

                dec hl
                ld a, (hl)
                inc hl
                ld (hl), a
                dec hl
        
        _djnz


        ld a, (data_9d40)
        ld (data_8cbd), a

l_7ab9:
        ld (ix), $ff
        jp l_9725 ; jp não mexer


l_7ac0:
        _do
                dec hl
                ld a, (hl)
                cp $4e
                
                _continue_if z 
                
                cp $4d
                
        _while z

        ld (data_9d34), a
        push ix
        push bc
        call l_9826
        call l_9867
        pop bc
        pop ix
        dec b
        ld a, $01
        ld (data_9d33), a
        jr l_7aa8


l_7ae1:
        push ix
        ld hl, data_ebe6
        call l_96ec
        pop ix
        jr l_7a97


l_7aed:
        ld a, (dados_mapa_4)
        inc a
        jr z, l_7a97
        push ix
        ld a, $ff
        ld (dados_mapa_4), a
        ld hl, data_f605
        call l_96ec
        pop ix
        jr l_7a97


l_7b04:
        ld a, $4d
        call l_96fa
        _if_not z
                ld hl, data_f41e
                jp l_96ec ; jp não mexer
        _end_if

        ld (hl), $4e
        push ix
        ld a, $ff
        ld (dados_mapa_77), a
        ld hl, data_f451
        call l_96ec
        pop ix
        jr l_7ab9


l_7b24:
        ld a, $42
        call l_96fa
        jp nz, l_7a97 ; jp não mexer
        ld a, $ff
        ld (data_9d32), a
        ret


l_7b32:
        sub $1d
        ld hl, data_7a60
        ld c, a
        ld b, $00
        add hl, bc
        ld a, $ff
        ld (data_9d32), a
        ld a, (hl)
        ld (hl), $01
        and a
        ret nz
        xor a
        ld (data_9d32), a
        ld l, (ix+$05)
        ld h, (ix+$06)

l_7b4f:
        ld a, $01
        ld (data_9d27), a
        call write_on_screen

        _do 
                call l_73e5
                call l_924f
                ld hl, (posicao_onde_comeca_o_nome_do_nivel)
                dec hl
                ld (posicao_onde_comeca_o_nome_do_nivel), hl
                cp $ff
                jp z, l_a287 ; jp não mexer
                call l_9152
        _while_true


function_7b6e:
        inc (ix+$07)
        ld a, (ix+$07)
        cp $15
        jp nz, function_7a6a
        ld (ix+$07), $00
        ld a, $d6
        call l_83f9
        jp function_7a6a


function_7b85:
        inc (ix+$09)
        ld a, (ix+$09)
        cp $15
        jp nz, function_7a6a
        xor a
        ld (ix+$09), a
        ld a, $cf
        call l_83f9
        jp function_7a6a


function_7b9c:
        ld (ix+$04), $73
        ld a, (ix+$03)
        push af
        sub $0d
        ld (ix+$03), a
        call l_7401
        call l_89e0
        pop af
        ld (ix+$03), a
        ld (ix+$04), $13
        jp l_7401


function_7bba:
        call l_8998
        ret nc
        ld a, $01
        ld hl, data_f9d7
        jp l_8a30


function_7bc6:
        ld hl, $7848; static
        ld de, $3010
        call l_89b1
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
        ld hl, data_f0b1
        jp l_7b4f


function_index_02_02:
        ld a, (dados_mapa_85+9)
        and a
        _if_not nz
                ld a, $55
                call l_96fa
                ret nz
                inc (ix+$09)
                ld hl, data_f15b
                jp l_96ec
        _end_if

function_index_02_03:
        ld a, (dados_mapa_85+9)
        and a
        ret z
        ld (ix+$09), $03
        ld hl, data_f19d
        jp l_7b4f


function_index_02_04:
        ld a, (data_9d2a)
        cp $1e
        ret c
        xor a
        ld (data_9d41), a
        ld hl, data_f1f7
        jp l_96ec


function_7c23:
        ld hl, data_7c43
        ld (ix+$04), $dd
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
                call l_7401
                pop bc
                pop hl
                inc (ix+$04)
        _djnz 

        ret

data_7c43:
        db $30, $56, $2c, $4d, $28, $6a, $30, $81, $2a, $8b ; its a list


function_7c4d:
        ret


function_7c4e:
        ld a, (dados_mapa_2)
        inc a
        ret z
        jp l_7401


function_7c56:
        ld a, (dados_mapa_2)
        inc a
        ret z
        call l_7401
        ld a, (ix+$03)
        add a, $04
        cp $aa
        _if_not c
                ld a, (ix+$0c)
                ld (ix+$02), a
                inc (ix+$09)
                ld a, (ix+$0d)
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

        call l_8998
        jp nc, l_7401
        ld a, $04
        ld hl, data_f919
        call l_8a30
        jp l_7401


function_7c9b:
        call l_7401
        dec (ix+$09)
        jp p, l_7cb4
        ld a, $ff
        ld (ix), a
        ld (ix+$0a), $47
        ld a, (ix+$07)
        ld (ix+$01), a
        ret


l_7cb4:
        ld a, (ix+$09)
        srl a
        ld e, a
        ld d, $00
        ld hl, index_001
        add hl, de
        ld a, (hl)
        ld (ix+$04), a
        jp l_7401


index_001:
        db $3a, $fc, $fd, $fe, $ff, $fe, $fd, $fc

l_7ccf:
        push ix
        push hl
        pop ix
        ld a, (ix+$01)
        ld (ix+$07), a
        ld (ix+$01), $0a
        ld (ix+$04), $fc
        ld (ix+$0a), $5c
        ld (ix+$09), $10
        call l_7401
        pop ix
        ret


function_7cf0:
        ld a, (ix+$09)
        _if_not z
                dec (ix+$09)
                _if_not nz
                        ld (ix+$04), $7d
                        call l_7401
                _end_if
        _end_if

        ld a, (dados_mapa_26)
        cp (ix)
        ret z
        call l_7401
        ld (ix+$04), $7c
        ld (ix+$09), $05
        call l_7401
        ld a, (ix)
        ld (dados_mapa_26), a
        ld a, $fc
        ld (dados_mapa_26+6), a
        ld a, (ix+$07)
        xor $02
        ld (ix+$07), a
        dec a
        ld (dados_mapa_26+5), a
        ld l, (ix+$02)
        inc l
        ld h, (ix+$03)
        ld (dados_mapa_26+2), hl
        push ix
        ld ix, dados_mapa_26
        call l_7401
        pop ix
        ret


function_7d43:
        call l_73f5
        ld a, (ix+$05)
        add a, (ix+$02)
        ld (ix+$02), a
        inc (ix+$06)
        ld a, (ix+$03)
        add a, (ix+$06)
        ld (ix+$03), a
        cp $c0
        _if_not nc
                call l_7401
                call l_8998
                ret nc
                ld a, $02
                ld hl, data_f93a
                jp l_8a30
        _end_if

        ld a, $ff
        ld (ix), a
        ret


function_7d74:
        call prepara_dados_mapa
        jp l_7401


function_7d7a:
        ld a, (data_9d0e)
        cp $8c
        ret nc
        call l_7fbb
        push bc
        call l_7401
        ld a, $df
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
        call l_7401
        call l_8998
        ret nc
        ld a, (data_9d2b)
        and a
        ret z
        ld hl, data_f8cc
        ld a, $ff
        jp l_8a30


function_7db1:
        ld a, (data_9d0e)
        cp $af
        _if_not nz
                ld a, $4e
                call l_96fa
                _if_not z
                        ld a, (ix+$02)
                        cp $51
                        _if_not nc
                                ld b, a
                                ld a, (data_9d0d)
                                add a, $20
                                cp b
                                _if_not c
                                        call l_73f5
                                        inc (ix+$02)
                                        call l_7401
                                _end_if
                        _end_if
                _end_if
        _end_if

        call l_8998
        ret nc
        ld a, (data_9d2b)
        and a
        ret z
        ld a, $4e
        call l_96fa
        ld hl, data_f9b7
        ld a, $ff
        jp nz, l_8a30
        ld hl, dados_mapa_40
        call l_7ccf
        ld hl, data_f68b
        jp l_96ec


function_7dfa:
        call l_7fbb
        push bc
        ld a, $4c
        call l_96fa
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
                call l_7401
                pop bc
                ld a, (ix+$02)
                bit 0, c
                
                _if_not nz
                        dec a
                        dec a

                _end_if

                inc a
                ld (ix+$02), a
                call l_7401

        _end_if

        call l_8998
        ret nc
        ld bc, (nivel)
        ld a, b
        cp c
        ret nz
        ld a, (data_9d2b)
        and a
        ret z
        push ix
        ld hl, data_f7eb
        call l_96ec
        pop ix
        ld hl, data_f9a9
        ld a, $ff
        jp l_8a30


function_7e57:
        call l_73f5
        inc (ix+$06)
        ld a, (ix+$03)
        add a, (ix+$06)
        ld (ix+$03), a
        cp $c0
        _if_not c
                ld a, $32
                ld (ix+$03), a
                ld a, (data_9d0d)
                add a, $23
                add a, (ix+$02)
                srl a
                ld (ix+$02), a
                xor a
                ld (ix+$06), a
        _end_if

        call l_7401
        call l_8998
        ret nc
        ld a, $02
        ld hl, data_f94d
        jp l_8a30


function_7e8f:
        xor a
        ld (ix+$09), a
        ret


function_7e94:
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
                        call l_9106
                        ld a, (hl)
                        and $07
                        cp $06
                        _if_not nz
                                call l_7401
                                inc (ix+$09)
                        _end_if
                _end_if

                pop hl
                inc hl
                inc hl
                inc hl
                dec (ix+$07)
                _if_not nz
                        ld hl, data_ffa2
                        ld (ix+$07), $1e
                _end_if

                ld (ix+$05), l
                ld (ix+$06), h
                ret

        _end_if

        call l_7401
        ld a, (ix+$09)
        and $07
        cp $07
        _if_not z
                inc (ix+$09)
                ld hl, data_7f1f
                ld e, a
                ld d, $00
                add hl, de
                ld a, (hl)
                ld (ix+$04), a
                jp l_7401
        _end_if


        ld (ix+$09), $00
data_7f1f;
        ret : db $95, $96, $97, $96, $95, $94


function_7f26:
        call l_7f9a
        call l_801b
        call l_8051
        call l_7fca
        call l_7ff5
        call l_8998
        _if_not nc
                ld hl, data_f962
                ld a, (ix+$0e)
                cp $98
                _if_not z
                        ld hl, data_f998
                        cp $64
                        _if_not z
                                ld hl, data_f983
                        _end_if
                _end_if
                
                ld a, $01
                call l_8a30

        _end_if

        call l_7401
        ld a, (ix+$0e)
        cp $73


        _if_not nz
                ld a, (ix+$0a)
                xor $80
                ld (ix+$0a), a
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


                        add a, (ix+$0e)
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
        jp l_7401


l_7f9a:
        ld a, (ix+$04)
        ld (next_sprite_index), a
        call function_print_sprite
        ld b, $00
        ret


l_7fa6:
        ld hl, list_003
        ld e, a
        ld d, $00
        add hl, de
        ld a, (hl)
        ret


list_003:
        db $00, $00, $00, $00, $05, $0a, $05, $0a, $0a, $0a, $05, $05

l_7fbb:
        ld a, (data_9d0d)
        ld c, $00
        add a, $20
        cp (ix+$02)
        ret z
        inc c
        ret nc
        inc c
        ret


l_7fca:
        ld a, (ix+$07)
        and $0c
        ld e, a
        ld a, b
        and $0c
        srl a
        srl a
        or e
        call l_7fa6
        and $0c
        ld c, a
        ld a, (ix+$07)
        and $03
        add a, a
        add a, a
        ld e, a
        ld a, b
        and $03
        or e
        call l_7fa6
        and $03
        or c
        ld c, a
        ld (ix+$07), c
        ret


l_7ff5:
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


l_801b:
        ld a, (altura_sprite_a_desenhar)
        srl a
        add a, (ix+$03)
        ld l, a
        ld a, (ix+$02)
        ld c, a
        sub $21
        ld e, a
        call l_9106
        ld de, $0544
        add hl, de
        ld a, c
        cp $28
        _if_not c
                bit 6, (hl)
                jr nz, l_803d
        _end_if
        set 1, b

l_803d:
        ld a, c
        cp $5a
        _if_not nc
                ld a, (largura_sprite_a_desenhar)
                srl a
                add a, l
                ld l, a
                inc l
                bit 6, (hl)
                jr nz, l_8050

        _end_if

        set 0, b

l_8050:
        ret


l_8051:
        ld a, (largura_sprite_a_desenhar)
        srl a
        srl a
        add a, (ix+$02)
        sub $1f
        ld e, a
        ld a, (ix+$03)
        ld c, a
        sub $04
        ld l, a
        call l_9106
        ld de, $0544
        add hl, de
        ld a, c
        cp $3c
        _if_not c
                bit 6, (hl)
                jr nz, l_8077
        _end_if
        set 3, b

l_8077:
        ld a, c
        cp $a0
        _if_not nc
                ld a, (altura_sprite_a_desenhar)
                and $f8
                add a, $04
                ex de, hl
                ld l, a
                ld h, $00
                add hl, hl
                add hl, hl
                add hl, de
                bit 6, (hl)
                jr nz, l_8090

        _end_if
        set 2, b

l_8090:
        ret


function_8091:
        ld (ix+$0a), $4f
        ld (ix+$07), $ff
        jp l_7401


function_809c:
        call l_9445
        call l_7401
        ld a, (ix+$02)
        ld b, (ix+$07)
        cp (ix+$06)

        _if_not c
                ld b, $ff
        _end_if

        cp (ix+$05)
        _if_not nc
                ld b, $01
        _end_if

        add a, b
        ld (ix+$02), a
        ld (ix+$07), b
        ld a, $4f
        call l_96fa
        ld b, $4f
        _if_not nz
                inc (ix+$09)
                bit 2, (ix+$09)
                _if_not z
                        ld b, $4d
                _end_if
        _end_if

        ld (ix+$0a), b
        ld a, (ix+$07)
        and $80
        or b
        ld (ix+$0a), a
        ld a, (ix+$02)
        and $01
        add a, (ix+$0d)
        ld (ix+$03), a
        call l_7401
        call l_8998
        ret nc
        ld a, $4f
        call l_96fa

        _if_not z
                ld a, $04
                ld hl, data_f8e0
                jp l_8a30
        _end_if

        call l_7401
        push ix
        pop hl
        jp l_7ccf


function_8107:
        call l_73f5
        ld a, (ix+$03)
        ld b, (ix+$07)
        cp (ix+$06)

        _if_not c
                ld b, $fe
        _end_if

        cp (ix+$05)

        _if_not nc
                ld b, $02
        _end_if

        add a, b
        ld (ix+$03), a
        ld (ix+$07), b
        call l_7401
        call l_8998
        ret nc
        ld a, $04
        ld hl, data_f971
        jp l_8a30


function_8134:
        call l_8998
        ld hl, data_f8f3
        ld a, $03
        call c, l_8a30
        ld a, (dados_mapa_62+9)
        and a
        ret z
        cp $8c
        ret nc
        ld a, (ix+$09)
        and $03
        ld a, $d6
        call z, l_83f9
        call l_73f5
        ld a, (ix+$02)
        cp $3c
        _if_not nc
                inc (ix+$09)
                ld a, (ix+$09)
                and $03
                jp nz, l_7401
                ld a, $d3
                sub (ix+$04)
                ld (ix+$04), a
                inc (ix+$02)
                jp l_7401

        _end_if

        inc (ix+$09)
        inc (ix+$03)
        ld a, (ix+$03)
        cp $bc

        _if_not nc
                jp l_7401
        _end_if

        ld (ix), $ff
        ret


function_8189:
        ld a, (ix+$09)
        cp $02
        ret nz
        call l_7401
        dec (ix+$02)
        ld a, (ix+$02)
        cp $44

        _if_not nc
                ld (ix+$03), $58
        _end_if

        ld a, $c3
        sub (ix+$04)
        ld (ix+$04), a
        call l_7401
        ld a, (ix+$02)
        cp $32

        _if_not nz
                ld a, $ff
                ld (dados_mapa_20), a
                ld hl, data_f5ed
                jp l_96ec
        _end_if

        and a
        ret p
        ld (ix), $ff
        ret


function_81c4:
        ld hl, data_81ca
        jp l_9926


data_81ca:
        db $49, $2c, $4c, $08, $20, $3e, $14
        
        db $32, $0d, $9d, $3e, $f7, $32, $11, $9d, $3e, $05, $32, $16, $9d, $3e, $01
        ;81e0
        db $32, $15, $9d, $32, $61, $9d, $af, $32, $60, $9d, $3e, $08, $21, $07, $f9, $cd
        ;81f0
        db $30, $8a, $21, $0b, $f3, $c3, $ec, $96
        


function_81f8:
        set 6, (ix+$0a)
        res 4, (ix+$0a)
        call l_7401
        res 6, (ix+$0a)
        set 4, (ix+$0a)
        ld a, $10

l_820d:
        ld h, a
        ld a, (ix+$0d)
        ld (sprite_top), a
        ld a, $2e
        ld (sprite_left), a
        ld l, $28
        ld (largura_sprite_a_desenhar), hl
        xor a
        ld (background_color), a
        ld a, (apenas_brite_and_ink)
        and $07
        ld (apenas_brite_and_ink), a
        jp l_8dd7


function_822d:
        call l_824e
        call l_9445
        call l_7401
        ld a, (ix+$05)
        ld (ix+$02), a
        ld a, (ix+$0a)
        and $7f
        ld b, a
        ld a, (ix+$06)
        and $80
        or b
        ld (ix+$0a), a
        jp l_7401


l_824e:
        ld a, (ix+$02)
        ld b, (ix+$06)
        cp $50
        _if_not c
                ld b, $ff
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
        set 6, (ix+$0a)
        res 4, (ix+$0a)
        call l_7401
        res 6, (ix+$0a)
        set 4, (ix+$0a)
        ld a, (ix+$0d)
        ld (sprite_top), a
        ld a, (ix+$0c)
        ld (sprite_left), a
        ld a, $08
        ld (altura_sprite_a_desenhar), a
        xor a
        ld (background_color), a
        ld a, $04
        ld (apenas_brite_and_ink), a
        jp l_8dd7


function_8298:
        call l_9445
        call l_7401
        ld l, (ix+$02)
        ld h, (ix+$03)
        dec h
        dec h
        ld de, $0207
        call l_89b1
        _if_not c
                ld a, (ix+$03)
                dec a
                cp $a0

                _if_not nc
                        ld a, $a0
                _end_if

                ld (ix+$03), a
                
        _else

                ld a, (data_9d16)
                cp $03
                _if_not c
                        cp $06
                        _if_not nc
                                ld a, (frame_movimento_do_hero)
                                cp $07
                                jr z, l_82d5
                                and a
                                jr z, l_82d5
                        _end_if
                _end_if 

                inc (ix+$03)

        _end_if
l_82d5:
        jp l_7401


function_82d8:
        ld a, (data_9d32)
        and a
        ret z
        call l_8998
        ret nc
        ld a, (ix+$09)
        and a
        ret nz
        xor a
        ld (data_9d32), a
        ld a, $01
        ld (ix+$09), a
        set 7, (ix+$0a)
        ld a, $02
        ld (dados_mapa_6+9), a
        ld (dados_mapa_7+9), a
        ld a, $50
        ld (dados_mapa_6+5), a
        ld hl, data_f593
        jp l_96ec


function_8306:
        ld a, (ix+$09)
        and a
        ld hl, data_832d

        _if_not nz
                ld hl, data_8336
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
                call l_7401
                pop hl
                pop bc
        _djnz
        ret


data_832d:
        db $28
data_832e:
        db $40
data_832f:
        db $2a
data_8330:
        db $2a
data_8331:
        db $40
data_8332:
        db $28
data_8333:
        db $2c
data_8334:
        db $40
data_8335:
        db $2b
data_8336:
        db $2c
data_8337:
        db $48
data_8338:
        db $2c
data_8339:
        db $2c
data_833a:
        db $50
data_833b:
        db $29
data_833c:
        db $2c
data_833d:
        db $58
data_833e:
        db $2d


function_833f:
        ld (ix+$02), $50
        call l_7401
        ld a, $02
        jp l_820d


function_834b:
        ld a, (ix+$09)
        and a
        ret z
        inc (ix+$06)
        bit 0, (ix+$06)
        ret z
        ld a, (ix+$05)
        cp $2e

        _if_not nc
                ld (ix+$09), $02
        _end_if

        cp $50

        _if_not c
                ld (ix+$09), $fe
        _end_if

        ld a, (ix+$05)
        add a, (ix+$09)
        ld (ix+$05), a


        _do
                ld a, (ix+$02)
                cp (ix+$05)
                ret z

                _if_not c
                        dec (ix+$02)
                        dec (ix+$02)
                        call l_7401
                        
                        _continue

                _end_if

                call l_7401
                inc (ix+$02)
                inc (ix+$02)
        _while_true
        


        ; start of unknown area 0x8393 to 0x83a5
        db $4f, $22, $80, $10, $18, $cd, $39, $98, $3e, $ff, $32, $9d, $74
        db $21, $d6, $f4, $c3, $ec, $96
        ; end of unknown area 0x8393 to 0x83a5


function_83a6:
        ld hl, area_negra
        ld de, $8445
        ld bc, $0027
        ld (hl), $00
        ldir
        ret


function_83b4:
        ld iy, area_negra
        ld b, $0a

        _do
                push bc
                ld a, (iy+$03)
                and a
                _if_not z
                        ld (iy+$03), $40
                        rlca
                        _if_not c
                                call l_842f
                                dec (iy+$01)
                                ld a, (iy+$01)
                                cp $28
                                jr z, l_83ec
                                and $0f
                                _if_not nz
                                        inc (iy+$02)
                                        ld a, (iy+$02)
                                        cp $d2
                                        jr z, l_83ec
                                        cp $d9
                                        jr z, l_83ec
                                _end_if
                        _end_if

                        call l_842f
                        jr l_83f0


l_83ec:
                        ld (iy+$03), $00
                _end_if
l_83f0:
                pop bc
                ld de, $0004
                add iy, de
        _djnz 

        ret


l_83f9:
        ld c, a
        ld b, $0a
        ld de, $0004
        ld iy, area_negra

        _do
                ld a, (iy+$03)
                and a
                jr z, l_840e
                add iy, de
        _djnz
        ret


l_840e:
        ld d, (ix+$02)
        ld e, (ix+$03)
        ld (iy), d
        ld (iy+$01), e
        ld (iy+$02), c
        ld (iy+$03), $80
        call l_9d64
        and $01
        add a, (iy)
        add a, $02
        ld (iy), a
        ret


l_842f:
        ld h, (iy)
        ld l, (iy+$01)
        ld (ix+$02), h
        ld (ix+$03), l
        ld h, (iy+$02)
        ld (ix+$04), h
        jp l_7401


area_negra:
        db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

data_846c
        db $4b, $44, $9a, $05
        ;8470
        db $10, $e1, $21, $e2, $f3, $c3, $ec, $96

data_8478
        db $47, $24, $50, $0a, $10, $21, $8c, $84

        ;8480
        db $7e, $a7, $c8, $36, $00, $e1, $21, $c0, $f3, $c3, $ec, $96


data_848c:
        db $ff

        ; start of unknown area 0x848d to 0x84bf
        db $50, $36, $64
        db $04, $10, $3e, $ff, $32, $29, $79, $cd, $39, $98, $3e, $68, $32, $32, $79, $3e
        db $50, $32, $2f, $79, $21, $74, $f6, $c3, $ec, $96, $67, $22, $30, $3c, $88, $dd
        db $7e, $09, $a7, $c2, $33, $98, $dd, $36, $09, $ff, $21, $55, $f5, $c3, $ec, $96
        ; end of unknown area 0x848d to 0x84bf

 
data_84c0:
        db $ff, $22, $30, $3c, $88, $3a, $ba, $75, $3c, $c2, $33, $98, $2a, $41, $78, $3a
        ;84d0
        db $0d, $9d, $c6, $20, $95, $f2, $da, $84, $ed, $44, $fe, $0c, $d2, $33, $98, $7c
        ;84e0
        db $d6, $28, $67, $22, $bc, $75, $3a, $3f, $78, $32, $ba, $75, $af, $32, $bf, $75
        ;84f0
        db $32, $be, $75, $3e, $0d, $32, $c3, $75, $3a, $0d, $9d, $c6, $20, $bd, $3e, $4c
        ;8500
        db $38, $02, $c6, $80, $32, $c4, $75, $21, $ba, $75, $21, $75, $f5, $c3, $ec, $96
        ;8510
        db $6f, $40, $8c, $04, $10, $dd, $34, $09, $cd, $39, $98, $21, $31, $f6, $c3, $ec
        ;8520
        db $96, $55, $40, $8c, $04, $10, $dd, $7e, $04, $fe, $16, $20, $0c, $dd, $35, $09
        ;8530
        db $cd, $39, $98, $21, $14, $ef, $c3, $4f, $7b, $ed, $4b, $75, $78, $0c, $c2, $33
        ;8540
        db $98, $dd, $35, $09, $cd, $39, $98, $21, $ee, $77, $34, $21, $38, $f5, $dd, $7e
        ;8550
        db $04, $fe, $13, $20, $03, $21, $23, $f5, $3a, $ee, $77, $fe, $03, $c2, $ec, $96
        ;8560
        db $3e, $55, $32, $a8, $78, $cd, $e2, $73, $21, $e9, $ef, $c3, $ec, $96, $33, $40
        ;8570
        db $50, $04, $10, $cd, $39, $98, $3e, $33, $32, $12, $78, $dd, $e5, $dd, $21, $f4
        ;8580
        db $77, $cd, $f5, $73, $21, $f4, $77, $cd, $cf, $7c, $dd, $e1, $21, $6a, $f0, $c3
        ;8590
        db $ec, $96, $01, $22, $30, $10, $88, $cd, $39, $98, $3e, $01, $32, $6b, $79, $21
        ;85a0
        db $8e, $74, $cd, $cf, $7c, $3e, $ff, $32, $70, $74, $21, $3a, $f8, $c3, $ec, $96
data_85b0
        db $49, $4a, $68, $0a, $10, $21, $87, $75, $dd, $7e, $04, $fe, $17, $28, $18, $7e
        ;85c0
        db $a7, $c2, $33, $98, $34, $dd, $cb, $09, $ce, $cd, $e3, $85, $3e, $ff, $32, $8d
        ;85d0
        db $75, $21, $b8, $f5, $c3, $ec, $96, $7e, $3d, $c2, $33, $98, $34, $21, $da, $f5
        ;85e0
        db $c3, $ec, $96, $dd, $7e, $09, $fe, $03, $c0, $c3, $39, $98, $57, $30, $64, $14
        ;85f0
        db $28, $3e, $51, $cd, $fa, $96, $36, $52, $21, $9f, $f6, $c3, $ec, $96
   

l_85fe:
        ld (data_8627), a
        ld a, (ix)
        ld l, (ix+$02)
        ld h, (ix+$03)
        push ix
        ld ix, dados_mapa_21
        ld (ix), a
        ld (ix+$0c), l
        ld (ix+$0d), h
        ld (ix+$09), $00
        xor a
        ld (data_8628), a
        call function_862c
        pop ix
        ret


data_8627:
        db $00

data_8628:
        db $00

data_8629:
        db $00

        ; start of unknown area 0x862a to 0x862a
        db $00
        ; end of unknown area 0x862a to 0x862a


data_862b:
        db $00


function_862c:
        ld b, $08

        _do
                ld c, (ix+$09)
                call l_86eb
        _djnz

        ret


function_8637:
        ld a, (data_8628)
        and a
        _if_not nz
                ld b, $08

                _do
                        ld c, (ix+$09)
                        call l_86eb
                        ld c, (ix+$09)
                        inc c
                        call l_86eb
                _djnz 

                inc (ix+$09)
                ld a, (ix+$09)
                cp $14
                ret nz
                ld (data_8628), a
                xor a
                ld (data_862b), a
                ld hl, (dados_mapa_67+2)
                ld a, (dados_mapa_67)
                cp (ix)
                _if_not z
                        ld hl, (data_9d0d)
                        ld de, $f723
                        add hl, de
                        ld a, (data_8627)
                        and a
                        jr z, l_86d6

                _end_if
                
                ld (data_8629), hl
                ret
        _end_if

        ld b, $08
        ld hl, (data_8629)
        ld a, (ix+$0c)
        ld (ix+$05), a
        add a, l
        rr a
        ld (ix+$0c), a
        ld a, (ix+$0d)
        ld (ix+$06), a
        add a, h
        rr a
        ld (ix+$0d), a

        _do
                ld c, (ix+$09)
                call l_86e3
                ld c, (ix+$09)
                dec c
                call l_86eb
        _djnz

        dec (ix+$09)
        ret nz
        call l_86d6
        ld a, (nivel)
        cp $4a
        ret nz
        ld a, (dados_mapa_53)
        inc a
        ret z
        ld bc, (dados_mapa_21+2)
        ld hl, (dados_mapa_53+2)
        ld de, $2006
        call l_89bd
        ret nc
        ld a, $ff
        ld (dados_mapa_53+9), a
        ld a, $01
        ld (data_862b), a
        ld hl, dados_mapa_53
        jp l_7ccf


l_86d6:
        call function_862c
        xor a
        ld (data_8628), a
        ld a, $ff
        ld (ix), a
        ret


l_86e3:
        ld h, (ix+$05)
        ld l, (ix+$06)
        jr l_86f1


l_86eb:
        ld h, (ix+$0c)
        ld l, (ix+$0d)

l_86f1:
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
        call l_73f5
        call l_8998
        _if_not nc
                ld a, (dados_mapa_67)
                cp $ff
                _if_not z
                        ld bc, (nivel)
                        cp c
                        _if_not z
                                ld a, $01
                                ld hl, data_f919
                                call l_8a30
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
        call l_73f5
        ld a, (ix+$09)
        and a

        _if_not z
                dec (ix+$09)
                jp l_7cb4
        _end_if

        ld a, $72
        ld (ix+$04), a
        inc (ix+$05)
        inc (ix+$06)
        ld a, (ix+$06)
        cp $02
        ld a, $ff
        _if_not nc
                xor a
        _end_if

        call l_85fe
        jp l_7401


function_index_03_02:
        ld a, (dados_mapa_21)
        inc a
        ret nz
        inc (ix+$05)
        ret


function_index_03_03:
        ld hl, dados_mapa_22
        call l_7ccf
        ld a, (data_862b)
        and a
        
        _if_not nz
                ld a, (ix+$06)
                cp $02
                _if_not nc
                        ld hl, data_f349
                        jp l_96ec
                _end_if

                ld hl, data_f388
                jp l_96ec
        _end_if

        ld hl, data_ed4b
        call l_7b4f
        jp l_8890


        ; start of unknown area 0x87a1 to 0x880b
        db $51, $40, $90, $04, $10, $dd, $7e, $04, $fe, $0d, $28, $19, $dd, $cb, $09
        db $46, $c2, $33, $98, $dd, $cb, $09, $c6, $cd, $e3, $85, $3e, $51, $32, $7b, $78
        db $21, $06, $f5, $c3, $ec, $96, $21, $a9, $77, $cd, $cf, $7c, $cd, $39, $98, $21
        db $b0, $eb, $cd, $ec, $96, $c3, $90, $88, $47, $24, $50, $0a, $10, $3e, $47, $32
        db $21, $78, $21, $9a, $77, $cd, $cf, $7c, $cd, $39, $98, $21, $11, $ec, $cd, $4f
        db $7b, $c3, $90, $88, $4d, $40, $8c, $04, $10, $cd, $39, $98, $3e, $4d, $32, $e6
        db $76, $3e, $0d, $32, $ef, $76, $21, $1e, $ee, $c3, $4f, $7b
        ; end of unknown area 0x87a1 to 0x880b


function_880c:
        ld a, (ix+$09)
        and a
        _if_not z
                call l_73f5
                dec (ix+$09)
                jp nz, l_7cb4
                ld (ix+$0a), $4f
                ld a, $25
                ld (ix+$04), a
                jp l_7401
        _end_if

        ld hl, dados_mapa_42
        call l_7ccf
        ld hl, dados_mapa_58
        call l_7ccf
        ld hl, data_ee82
        call l_96ec
        jp l_8890


        ; start of unknown area 0x883c to 0x887c
        db $74, $39, $8c, $10
        db $23, $21, $b8, $77, $7e, $3c, $ca, $33, $98, $dd, $7e, $04, $fe, $03, $28, $1b
        db $cd, $39, $98, $3e, $ff, $21, $c3, $f9, $cd, $30, $8a, $21, $c3, $f6, $3e, $05
        db $32, $c1, $99, $3e, $50, $32, $c3, $99, $c3, $ec, $96, $cd, $39, $98, $21, $b8
        db $77, $cd, $cf, $7c, $21, $e7, $f6, $cd, $4f, $7b, $c3, $90, $88
        ; end of unknown area 0x883c to 0x887c


function_887d:
        call l_8998
        ret nc
        ld hl, dados_mapa_57
        call l_7ccf
        ld hl, data_ec64
        call l_7b4f
        jp l_8890


l_8890:
        ld hl, data_9d42
        dec (hl)
        ret nz
        ld a, $80
        ld (data_fdc6), a
        ld hl, data_f290
        jp l_7b4f


l_88a0:
        ld b, $5c
        ld ix, dados_mapa_0
        ld de, $000f

        _do

                call prepara_dados_mapa
                add ix, de
        _djnz

        ld a, $05
        ld (dados_mapa_54+10), a
        ld a, $17
        ld (dados_mapa_58+10), a
        ld a, $4a
        ld (dados_mapa_40+10), a
        ld hl, dados_mapa_5+10
        res 7, (hl)
        ld a, $c1
        ld (data_fdc6), a
        xor a
        ld (dados_mapa_22+6), a
        ld a, $ff
        ld (data_9d63), a
        ld (sound_to_play), a
        ld (data_848c), a
        ld a, $03
        ld (data_99c1), a
        ld a, $78
        ld (data_99c3), a
        ld a, $06
        ld (data_9d42), a
        ld hl, data_7a60
        ld b, $0a

 
        _do

                ld (hl), $00
                inc hl
                
        _djnz


function_88f1:
        ret


prepara_dados_mapa:
        ld a, (ix+$0b)
        ld (ix), a
        ld a, (ix+$0c)
        ld (ix+$02), a
        ld a, (ix+$0d)
        ld (ix+$03), a
        ld a, (ix+$0e)
        ld (ix+$04), a
        xor a
        ld (ix+$09), a
        ld a, (ix+$01)
        cp $0a
        ret nz
        ld a, (ix+$07)
        ld (ix+$01), a
        ld (ix+$0a), $47
        ret


l_891f:
        ld a, (nivel)
        ld (dados_mapa_8), a
        ld (dados_mapa_9), a
        ld a, $28
        call l_892f
        ld a, $20

l_892f:
        ld (data_893e), a
        ld b, $5c
        ld ix, dados_mapa_0

        _do
                push bc
                ld a, (ix+$01)
                cp $07

data_893e: ;  dinamic                
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
                ld de, $000f
                add ix, de
        _djnz
        ret


l_895c:
        ld b, $5c
        ld ix, dados_mapa_91

        _do
                ld a, b
                dec a
                ld (data_9d40), a
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
                ld de, $fff1
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


l_8990:
        ld l, (ix)
        ld h, (ix+$01)
        jr l_89a1


l_8998:
        ld l, (ix+$02)
        ld h, (ix+$03)
        ld a, (ix+$04)

l_89a1:
        ld (next_sprite_index), a
        push hl
        call function_print_sprite
        pop hl
        ld a, (altura_sprite_a_desenhar)
        ld d, a
        ld a, (largura_sprite_a_desenhar)
        ld e, a

l_89b1:
        ld a, (data_9d0d)
        add a, $20
        ld c, a
        ld a, (data_9d0e)
        sub $12
        ld b, a

l_89bd:
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


l_89d3:
        ld ix, data_8a1a
        ld (ix+$03), l
        ld (ix+$02), h
        call l_7401

l_89e0:
        ld hl, data_8c75
        ld de, data_9d47
        ld c, $00
        jr l_89f8


l_89ea:
        ld a, (apenas_brite_and_ink)
        ld (data_9d4a), a
        ld c, $03
        ld hl, data_8c99
        ld de, data_9d48

l_89f8:
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

data_8a0f
        db $00

        ;8a10
        db $00, $3b, $00, $b2, $00, $00, $00, $00, $00, $46

data_8a1a:
        db $00, $00, $00, $00
        
        db $73, $00
        db $00, $00, $00, $00, $42

        ; end of unknown area 0x8a0f to 0x8a24

data_8a25
        db $ff, $00, $00, $00, $e9, $00, $01, $00, $01, $00, $1f


l_8a30:
        ld b, a
        xor a
        ld (data_9d4c), a
        ld a, (data_9d2b)
        and a
        ret z
        ld (posicao_texto_a_escrever), hl
        ld hl, data_9d2b
        ld a, (hl)
        sub b

        _if_not nc
                xor a
        _end_if

        ld (hl), a
        ret


l_8a47:
        ld hl, data_9d2b
        ld a, (hl)
        add a, $08
        cp $1f

        _if_not c
                ld a, $1f
        _end_if

        ld (hl), a
        ret


l_8a55:
        ld a, (data_9d32)
        and a
        ret z
        ld b, $1e
        ld ix, data_ffa2

        _do
                ld a, (nivel)
                cp (ix+$02)
                _if_not nz
                        push bc
                        xor a
                        call l_8990
                        _if_not nc
                                set 7, (ix+$02)
                                push ix
                                ld a, $03
                                ld (sound_to_play), a
                                call l_95eb
                                xor a
                                ld (data_9d32), a
                                ld hl, data_f9eb
                                call l_96ec
                                pop ix

                        _end_if

                        pop bc  
                _end_if

                ld de, $0003
                add ix, de
        _djnz 
        ret


l_8a92:
        ld a, $ff
        ld (data_8b86), a
        ld b, $00
        ld iy, data_8b55
        ld ix, data_8a25


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
                                call l_9445
                                call l_7401

                        _end_if

                        dec (iy+$01)
                        ld a, (iy+$01)
                        cp $28
                        
                        _if_not nc
                                call l_9d64
                                and $0f
                                add a, $38
                                ld (iy), a
                                ld (ix+$02), a
                                ld (iy+$01), $a0
                        _end_if

                        ld a, (iy+$01)
                        ld (ix+$03), a
                        ld a, (nivel)
                        cp (iy+$03)
                        call z, l_7401
                _end_if

                ld a, (nivel)
                cp (iy+$03)
                _if_not nz
                        ld l, (iy)
                        inc l
                        ld h, (iy+$01)
                        ld e, (iy+$02)
                        ld d, $01
                        call l_89b1
                        _if_not nc
                                xor a
                                ld (data_8b86), a
                        _end_if
                _end_if

                pop bc
                ld de, $0004
                add iy, de
                inc b
                ld a, (data_fdc6)
                cp $80
                ld a, $0c
                _if_not z
                        ld a, $08
                _end_if

                cp b
        
        _while nz

        ld a, (data_8b86)
        ld (data_8b85), a
        ret


l_8b24:
        ld a, (data_fdc6)
        cp $80
        ret nz
        ld ix, data_8a25
        ld b, $04
        ld iy, data_8b75

        _do
                ld a, (nivel)
                cp (iy+$03)
                _if_not nz
                        push bc
                        ld h, (iy)
                        ld l, (iy+$01)
                        ld (ix+$02), h
                        ld (ix+$03), l
                        call l_7401
                        pop bc

                _end_if

                ld de, $0004
                add iy, de
        _djnz

        ret

data_8b55
     
        db $45, $6c, $0c, $38, $2a, $44, $0b, $39, $4c, $3a, $0b
        db $39, $3a, $68, $12, $39, $26, $84, $0f, $39, $50, $84, $0f, $39, $3d, $53, $0f
        db $4f, $4e, $46, $0b, $52

data_8b75
        db $50, $64, $08, $41, $46, $3c, $08, $41


data_8b7d:
        db $3c

        ; start of unknown area 0x8b7e to 0x8b84
        db $80, $08
        db $2a, $5a, $46, $08, $2a
        ; end of unknown area 0x8b7e to 0x8b84


data_8b85:
        db $ff

data_8b86:
        db $ff

l_8b87:
        ld a, (data_9d4a)
        ld (apenas_brite_and_ink), a
        ld a, (data_9d48)
        ld ix, data_8c99
        and a
        ret z
        ld b, a

        _do
                push bc
                push ix
                ld a, (data_9d4a)
                ld c, a
                ld a, (ix+$02)
                inc a
                and $03
                ld (ix+$02), a
                add a, $5c
                ld b, $01
                ld e, (ix)
                ld l, (ix+$01)
                call l_8d3e
                call desenha_sprite
                pop ix
                ld l, (ix)
                ld h, (ix+$01)
                ld de, $1408 ; static
                call l_89b1
                call c, l_8bd1
                ld de, $0003 ; static
                add ix, de
                pop bc
        _djnz

        ret


l_8bd1:
        ld bc, (nivel)
        ld a, b
        cp c
        ret nz
        ld a, (data_9d16)
        cp $06
        ret z
        ld a, $06
        ld (data_9d16), a
        xor a
        ld (data_9d44), a
        ld a, (ix+$01)
        add a, $0e
        ld (data_9d0e), a
        xor a
        ld (data_9d11), a
        ld hl, data_f88c
        ld a, (nivel)
        cp $41
        _if_not z
                cp $6f
                _if_not z
                        ld hl, data_f8b4
                        cp $57
                        _if_not z
                                ld hl, data_f89f
                        _end_if
                _end_if
        _end_if

        ld a, $ff
        call l_8a30
        push ix
        call l_9d8c
        pop ix
        ret


l_8c18:
        ld a, (data_9d47)
        ld ix, data_8c75
        and a
        ret z
        ld b, a

        _do
                push bc
                call l_8c4a
                ld a, (ix+$02)
                inc a
                and $0f
                ld (ix+$02), a
                call l_8c4a
                ld a, $73
                call l_8990
                
                _if_not nc
                        ld a, $01
                        ld hl, data_f878
                        call l_8a30
                _end_if

                ld de, $0003 ; static
                add ix, de
                pop bc
        _djnz 

        ret


l_8c4a:
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
        call l_8d3e
        call desenha_sprite
        pop ix
        xor a
        ld (background_color), a
        jp l_8dd7



data_8c75
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00

        ;8c80 
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        ;8c90
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
data_8c99        
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        ;8ca0
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
        db $00
data_8cbc        
        db $00
        
data_8cbd        
        db $00, $00
data_8cbf:
        db $00, $00



l_8cc1:
        ld a, $3e
        call l_96fa
        _if_not z
                ld a, $3f
                call l_96fa
                jr z, l_8cfc
                ld a, (nivel)
                ld bc, (dados_mapa_63)
                cp c
                ret nz
                ld hl, data_8d21
                inc (hl)
                ld a, (hl)
                cp $3c
                ret c
                ld (hl), $00
                ld ix, dados_mapa_63
                ld a, $cf
                jp l_83f9


        _end_if
        ld hl, dados_mapa_62+9
        ld a, (hl)
        and a
        _if_not z
                dec a
                _if_not z
                        dec (hl)
                        and $07
                        ret nz
                        dec (hl)
                        jr l_8d06

                _end_if
        _end_if
l_8cfc:
        ld hl, data_8d21
        inc (hl)
        ld a, (hl)
        cp $3c
        ret c
        ld (hl), $00

l_8d06:
        ld a, (data_9d0d)
        add a, $21
        ld (data_8d1f), a
        ld a, (data_9d0e)
        sub $12
        ld (data_8d20), a
        ld ix, $8d1d
        ld a, $cf
        jp l_83f9


data_8d1f:
        db $00

data_8d20:
        db $00
data_8d21:
        db $00


coloca_em_de_hl_5e22_b830:
        push hl
        push de
        ld de, $5e22
        ld hl, $b830

l_8d2a:
        ld (valor_de), de
        ld (valor_hl), hl
        pop de
        pop hl
        ret


coloca_em_de_hl_6020_b800:
        push hl
        push de
        ld de, $6020
        ld hl, $b800
        jr l_8d2a


l_8d3e:
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

l_8d51:
        ld (next_sprite_index), a
        ld a, e
        ld (sprite_left), a
        ld a, l
        ld (sprite_top), a

function_print_sprite:
        xor a
        ld (data_9d26), a
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
        cp $ff
        _if_not nz
                ld (data_9d26), a
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
        ld (sprit_actual_byte_to_draw), hl
        ret


l_8d89:
        ld bc, $1e11
        ld de, $0601
        ld hl, dinamic_data_8dcc
        ld (hl), $00
        jp colocar_attributos_de_cor


l_8d97:
        ld l, a
        xor a
        ld (dinamic_data_8dcc), a
        ld a, (background_color)
        cp $01
        ld a, l
        
        _if_not nz 
                xor $47
                ld l, a
                ld a, $ae
                ld (dinamic_data_8dcc), a
                ld a, l
        _end_if

colocar_attributos_de_cor:
        ld (dinamic_cor_a_pintar+1), a
        ld a, b
        ld (dinamic_largura_cor_em_casas + 1), a
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

dinamic_8dc0: 
        ld de, screenattributes
        add hl, de
        ld de, $0020

        _do
                push hl
dinamic_largura_cor_em_casas: 
                ld b, $01

        
                _do
dinamic_cor_a_pintar:
                        ld a, $01
dinamic_data_8dcc:
                        xor (hl)
                        ld (hl), a
                        inc hl
                        
                _djnz

                pop hl
                add hl, de
                dec c
        _while nz

        ret


l_8dd7:
        ld a, (data_9d26)
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
        jp l_8d97


data_8e49:
        db $00


; arguments: 
;
; data_9d26
; valor_de
; altura_sprite_a_desenhar
; altura_sprite_a_desenhar_copy
; largura_sprite_a_desenhar
; largura_sprite_a_desenhar_copy
; sprite_left
; de 
; valor_hl
; altura_sprite_a_desenhar
; sprite_top
; sprite_top_copy
; altura_sprite_a_desenhar_copy

desenha_sprite:
        ld a, (data_9d26)
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
                ld hl, (sprit_actual_byte_to_draw)
                ld a, (largura_sprite_a_desenhar)
                srl a
                ld c, a
                ld a, b
                ld b, $00

                _do
                        add hl, bc
                        inc a
                _while nz

                ld (sprit_actual_byte_to_draw), hl
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
        ld (dynamic_8fac+1), a
        ld (dynamic_9001+1), a
        ld a, (sprite_left)
        sub e
        _if_not nc
                neg
                ld b, a
                and $01
                ld (dynamic_9001+1), a
                ld a, (largura_sprite_a_desenhar_copy)
                sub b
                ld (largura_sprite_a_desenhar_copy), a
                ld a, (sprite_left_copy)
                add a, b
                ld (sprite_left_copy), a
                ld a, b
                srl a
                ld (dynamic_8fac+1), a
                ld c, a
                ld b, $00
                push hl
                ld hl, (sprit_actual_byte_to_draw)
                add hl, bc
                ld a, (sprite_espelho)
                and a
                _if_not z
                        sbc hl, bc
                        and a
                        sbc hl, bc

                _end_if

                ld (sprit_actual_byte_to_draw), hl
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
                ld a, (dynamic_8fac+1)
                add a, b
                ld (dynamic_8fac+1), a
        _end_if

        ld hl, $2313 ; inc de : inc hl
        ld a, (sprite_espelho)
        and a
        _if_not z
                ld hl, (sprit_actual_byte_to_draw)
                ld a, (largura_sprite_a_desenhar)
                srl a
                dec a
                ld c, a
                ld b, $00
                add hl, bc
                ld (sprit_actual_byte_to_draw), hl
                ld a, (largura_sprite_a_desenhar)
                res 0, a
                ld b, a
                ld a, (dynamic_8fac+1)
                neg
                add a, b
                ld (dynamic_8fac+1), a
                ld hl, $8fbb ; static;  cp e : adc a,a
                ld a, $c3
        _end_if

        ld (dynamic_8fa4), a
        ld (dynamic_8fa5), hl
        ld a, (sprite_top_copy)
        ld l, a
        ld h, $00
        add hl, hl
        ld bc, screen_memory_map
        add hl, bc
        push hl
        pop ix
        ld de, (sprit_actual_byte_to_draw)
        ld a, (sprite_left_copy)
        sub $20
        srl a
        jp c, l_8fc6
        ld (dynamic_8f9a + 1), a
        ld a, (dynamic_9001+1)
        and a
        ld a, (dynamic_8f9a + 1)
        jp nz, l_8fc6
        ld a, (background_color)
        and a
        _if_not z
                ld a, $ae
        _end_if

        ld (dynamic_8fa7), a
        ld a, (largura_sprite_a_desenhar_copy)
        srl a
        ld (largura_sprite_a_desenhar_copy), a

        _do
                ld l, (ix)
                inc ix
                ld h, (ix)
                inc ix
dynamic_8f9a:
                ld bc, $0000
                add hl, bc
                dec hl
                ld a, (largura_sprite_a_desenhar_copy)
                ld b, a

                _do
                        ld a, (de)
dynamic_8fa4:
                        nop

dynamic_8fa5:
                        inc de : inc hl

dynamic_8fa7:
                        and (hl)
                        ld (hl), a
                
                _djnz

                ex de, hl
dynamic_8fac:                
                ld bc, $0000
                add hl, bc
                ex de, hl
                ld a, (altura_sprite_a_desenhar_copy)
                dec a
                ld (altura_sprite_a_desenhar_copy), a
        _while nz

        ret


        ; start of unknown area 0x8fbb to 0x8fc5
        db $c5, $06, $5b, $4f, $0a
        db $c1, $23, $1b, $c3, $a7, $8f
        ; end of unknown area 0x8fbb to 0x8fc5


l_8fc6:
        ld (dynamic_8ffd+1), a
        ld a, (dynamic_8fac+1)
        ld (dynamic_900e+1), a
        ld hl, function_9041
        ld a, (background_color)
        and a
        ld a, (sprite_espelho)
        jp z, l_8fe9
        ld hl, function_901d
        and a
        jp z, l_8ff0
        ld hl, function_9074
        jp l_8ff0


l_8fe9:
        and a
        jp z, l_8ff0
        ld hl, function_90a4

l_8ff0:
        ld (dynamic_900a+1), hl

        _do
                ld l, (ix)
                inc ix
                ld h, (ix)
                inc ix
dynamic_8ffd:                
                ld bc, $0000
                add hl, bc
dynamic_9001:                
                ld a, $00
                ld (data_9b31), a
                ld a, (largura_sprite_a_desenhar_copy)
                ld b, a
dynamic_900a:                            
                call function_901d
                ex de, hl
dynamic_900e:
                ld bc, $0000
                add hl, bc
                ex de, hl
                ld a, (altura_sprite_a_desenhar_copy)
                dec a
                ld (altura_sprite_a_desenhar_copy), a
        _while nz
        ret


function_901d:
        ld a, (data_9b31)
        and a
        _if_not z
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                jp l_9039

        _end_if

        _do
                        ld a, (de)
                        rlca
                        rlca
                        rlca
                        rlca
                        ld c, a
                        and $0f
                        xor (hl)
                        ld (hl), a
                        inc hl
                        dec b
                        ret z
                        ld a, c

l_9039:
                        and $f0
                        xor (hl)
                        ld (hl), a
                        inc de
        _djnz
        ret


function_9041:
        ld a, (data_9b31)
        and a
        _if_not z
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                ld (data_8e49), a
                jp l_9065
        _end_if

        _do
                ld a, (hl)
                and $f0
                ld c, a
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                ld (data_8e49), a
                and $0f
                add a, c
                ld (hl), a
                inc hl
                dec b
                ret z

l_9065:
                ld a, (hl)
                and $0f
                ld c, a
                ld a, (data_8e49)
                and $f0
                add a, c
                ld (hl), a
                inc de
        _djnz 
        ret


function_9074:
        ld a, (data_9b31)
        and a
        _if_not z
                ld a, (de)
                push bc
                ld b, $5b
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                jp l_909c
        _end_if


        _do
                ld a, (de)
                push bc
                ld b, $5b
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld c, a
                and $0f
                xor (hl)
                ld (hl), a
                inc hl
                dec b
                ret z
                ld a, c

l_909c:
                and $f0
                xor (hl)
                ld (hl), a
                dec de
        _djnz
        ret


function_90a4:
        ld a, (data_9b31)
        and a
        _if_not z
                ld a, (de)
                push bc
                ld b, $5b
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld (data_8e49), a
                jp l_90d4
        _end_if

        _do
                ld a, (hl)
                and $f0
                ld c, a
                ld a, (de)
                push bc
                ld b, $5b
                ld c, a
                ld a, (bc)
                pop bc
                rlca
                rlca
                rlca
                rlca
                ld (data_8e49), a
                and $0f
                add a, c
                ld (hl), a
                inc hl
                dec b
                ret z

l_90d4:
                ld a, (hl)
                and $0f
                ld c, a
                ld a, (data_8e49)
                and $f0
                add a, c
                ld (hl), a
                dec de
        _djnz 
        ret


limpa_a_area_de_jogo:
        ld ix, screen_memory_map + 3*32
        ld a, $88
        ld de, $0001

        _do
                ld l, (ix)
                ld h, (ix+$01)
                inc ix
                inc ix
                add hl, de
                ld b, $1e

                _do

                        ld (hl), $00
                        inc hl
                
                _djnz

                dec a
        _while nz

        ld a, $47
        jp l_8d89


l_9106:
        ld a, l
        and $f8
        ld h, $00
        ld d, h
        ld l, a
        add hl, hl
        add hl, hl
        srl e
        add hl, de
dinamic_9112:
        ld de, $5d44
        add hl, de
        ret


        ; start of unknown area 0x9117 to 0x9121
        db $06, $2f, $04, $d6, $64, $30, $fb, $c6, $64
        db $70, $23
        ; end of unknown area 0x9117 to 0x9121


l_9122:
        ld b, $2f

        _do
                inc b
                sub $0a
        _while nc

        add a, $3a
        ld (hl), b
        inc hl
        ld (hl), a
        ret


l_912f:
        call coloca_em_de_hl_6020_b800

        _do
                ld a, (hl)
                and a

                _break_if z 
                
                push hl
                call desenha_uma_letra_no_ecra
                pop hl
                inc hl
        _while_true
        

        jp coloca_em_de_hl_5e22_b830


write_on_screen:
        call coloca_em_de_hl_6020_b800
        call l_914a
        jp coloca_em_de_hl_5e22_b830


l_914a:
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        ld a, $01
        ld (valor_inicia_do_a_21), a

l_9152:
        call get_first_or_second_nibble
        cp $0f
        _if_not z
                ld b, $0d
                cp $0d
                _if_not z
                        ld b, $1d
                        cp $0e
                        jr nz, l_9169

                _end_if
                call get_first_or_second_nibble
                add a, b

l_9169:
                ld hl, indice_letras
                ld c, a
                ld b, $00
                add hl, bc
                ld a, (hl)
                call desenha_uma_letra_no_ecra
                jr l_9152
        _end_if

        call get_first_or_second_nibble
        cp $0f
        ret z
        cp $08
        _if_not c
                jr z, l_9193
                cp $09
                jr z, l_91da
                cp $0d
                jr z, l_91a1
                jr l_9152
        _end_if

        add a, $40
        ld (data_9b3c), a
        jr l_9152


l_9193:
        call l_924f
        ld (data_9b3d), a
        call l_924f
        ld (data_9b3e), a
        jr l_9152


l_91a1:
        ld hl, (posicao_onde_comeca_o_nome_do_nivel)
        ld a, (valor_inicia_do_a_21)
        push hl
        push af
        ld b, $00

l_91ab:
        call get_first_or_second_nibble
        cp $0f
        _if_not z
                inc b
                cp $0e
                _if_not z
                        cp $0d
                        jr nz, l_91ab
                _end_if

                call get_first_or_second_nibble
                jr l_91ab
        _end_if


        ld a, (valor_inicia_do_a_20)
        sub b
        ld (data_9b3d), a
        ld a, (data_9b3e)
        add a, $08
        ld (data_9b3e), a
        pop af
        pop hl
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        ld (valor_inicia_do_a_21), a
        jp l_9152


l_91da:
        ld a, $0a
        ld (data_9d31), a
        xor a
        ld (data_9d32), a
        ld (background_color), a
        ld (sprite_espelho), a
        ld a, (data_9b3c)
        ld (apenas_brite_and_ink), a
        call l_924f
        ld (dynamic_92cb+1), a
        ld (dynamic_9362+1), a
        ld bc, (data_9b3d)
        add a, c
        add a, $04
        ld (valor_inicia_do_a_20), a
        call l_924f
        ld (dynamic_9323+1), a
        add a, a
        add a, a
        add a, a
        ld (dynamic_9356+1), a
        call l_92a5
        call l_92fe
        call l_933a
        ld a, (data_9b3e)
        add a, $0c
        ld (data_9b3e), a
        jp l_9152


indice_letras:
        db $3a

        ; start of unknown area 0x9223 to 0x924e
        db $45, $54, $41, $4f, $49, $4e, $53, $48, $52, $44, $4c, $55, $42
        db $43, $46, $47, $4a, $4b, $4d, $50, $51, $56, $57, $58, $59, $5a, $40, $3f, $30
        db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3b, $26, $27, $3c, $3e, $3d
        ; end of unknown area 0x9223 to 0x924e


l_924f:
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
                and $0f
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
        db $00

        ; start of unknown area 0x9280 to 0x9280
        db $00
        ; end of unknown area 0x9280 to 0x9280


desenha_uma_letra_no_ecra:
        ld b, a
        ld a, (data_9b3e)
        ld l, a
        ld a, (data_9b3d)
        add a, $20
        ld e, a
        ld a, (data_9b3c)
        ld c, a
        ld a, b
        ld b, $00
        call l_8d3e
        call l_8dd7
        call desenha_sprite
        ld a, (data_9b3d)
        add a, $02
        ld (data_9b3d), a
        ret


l_92a5:
        ld a, (data_9b3d)
        add a, $20
        ld e, a
        ld a, (data_9b3e)
        add a, $08
        ld l, a
        call l_92c1
        ld a, (dynamic_9356+1)
        add a, l
        add a, $08
        ld l, a
        ld a, (data_9b3d)
        add a, $20
        ld e, a

l_92c1:
        ld a, $2a
        call l_92f8
        ld a, $2e
        call l_92f8

dynamic_92cb:
        ld d, $00

        _do
                ld a, $28
                call l_92f8
                dec d
        _while nz

        ld a, $2e
        call l_92f8
        ld a, $2b

l_92dc:
        push hl
        push de
        push hl
        push de
        push af
        ld a, e
        sub $20
        ld e, a
        call l_9106
        ld a, (apenas_brite_and_ink)
        ld (hl), a
        pop af
        pop de
        pop hl
        call l_8d51
        call desenha_sprite
        pop de
        pop hl
        ret


l_92f8:
        call l_92dc
        inc e
        inc e
        ret


l_92fe:
        ld a, (data_9b3d)
        add a, $20
        ld e, a
        inc e
        inc e
        push de
        ld a, (data_9b3e)
        ld l, a
        call l_931a
        ld a, (data_9b3e)
        ld l, a
        pop de
        ld a, (dynamic_92cb+1)
        inc a
        add a, a
        add a, e
        ld e, a

l_931a:
        ld a, $2c
        call l_92dc
        ld a, l
        add a, $10
        ld l, a

dynamic_9323:
        ld d, $00

        _do
                ld a, $29
                call l_92dc
                ld a, l
                add a, $08
                ld l, a
                dec d
        _while nz

        ld a, l
        add a, $08
        ld l, a
        ld a, $2d
        jp l_92dc


l_933a:
        ld a, (data_9b3d)
        add a, $04
        srl a
        ld (dynamic_935e+1), a
        ld a, (data_9b3e)
        add a, $10
        ld e, a
        ld d, $00
        sla e
        rl d
        ld ix, screen_memory_map
        add ix, de
dynamic_9356:
        ld c, $00

        _do 
                ld l, (ix)
                ld h, (ix+$01)
dynamic_935e:
                ld de, $0000
                add hl, de
dynamic_9362:
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
                ld bc, $fffe
                and $e0
                rrca
                rrca
                add a, $80
                ld (dynamic_938f+1), a
                ld a, l
                rlca
                rlca
                rlca
                and $38
                add a, $47
                ld (dynamic_9393+1), a
dynamic_938f:
                res 0, b
                in a, (c)
dynamic_9393:
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
        ld (dynamic_93a7+1), a
        in a, ($1f)
        xor $ff
dynamic_93a7:        
        bit 0, a
        pop hl
        ret


l_93ab:
        ld a, (data_9409)
        ld (data_9d30), a
        ret


function_93b2:
        ld c, $00
        ld hl, data_9d4d
        ld de, data_9d53
        ld ix, data_9d59
        ld b, $06

l_93c0:
        ld a, (hl)
        call verifica_se_clicaram_tecla
        jr z, l_93dd
        ld a, (de)
        call verifica_se_clicaram_tecla
        jr z, l_93dd
        ld a, (data_728f)
        and a
        jr z, l_93da
        ld a, (ix)
        call verifica_se_clicaram_tecla
        jr z, l_93dd

l_93da:
        and a
        jr l_93de


l_93dd:
        scf

l_93de:
        rl c
        inc hl
        inc de
        inc ix
        djnz l_93c0
        ld a, c
        ld (data_9409), a
        ld hl, data_9405
        ld c, $ff
        ld b, $04

l_93f1:
        ld a, (hl)
        call verifica_se_clicaram_tecla
        jr nz, l_93fa
        and a
        jr l_93fb


l_93fa:
        scf

l_93fb:
        rl c
        inc hl
        djnz l_93f1
        ld a, c
        ld (data_940a), a
        ret


data_9405:
        db $c1

data_9406:
        db $60
        
data_9407:
        db $40
data_9408:
        db $03




data_9409:
        db $00

data_940a:
        db $00

janela_do_jogo_preto:
        xor a
        ld (background_color), a
        ld bc, $1e11
        ld de, $0601
        call l_8d97
        ld hl, $5d44
        ld (dinamic_8dc0+1), hl
        ld (dinamic_9112+1), hl
        ret


copia_color_attributes_para_ecra:
        ld hl, screenattributes
        ld (dinamic_8dc0+1), hl
        ld (dinamic_9112+1), hl
        ld de, screenattributes + 6*32 +1 ;0x58c1
        ld hl, color_attribute_temp+ 1*32+1
        ld c, $11

        _do
                ld b, $1e

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


l_9445:
        push af
        push bc

        _do
                ld bc, (data_9d2e)

                _do
                        ld a, (data_9d2f)
                        cp b
                _while z

                and $03
        _while z
        pop bc
        pop af
        ret


l_9458:
        call janela_do_jogo_preto
        call limpa_a_area_de_jogo
        xor a
        ld (data_9d48), a
        ld (data_9d47), a
        call desenha_nivel
        ld a, (dados_mapa_80+9)
        and a
        _if_not nz
                ld hl, $68b8 ; static
                ld a, (nivel)
                cp $50
                _if_not z
                        ld hl, $30b8; static
                        cp $67
                        _if_not z
                        
                                ld hl, $3064; static
                                cp $7e
                                jr nz, l_94a0
                        _end_if
                _end_if

                ld ix, data_8a0f
                ld (ix+$03), h
                ld (ix+$06), l

                _do
                        call l_7401
                        ld a, (ix+$03)
                        add a, $08
                        ld (ix+$03), a
                        cp (ix+$06)
                _while c
        _end_if
l_94a0:
        ld a, (nivel)
        cp $55
        _if_not nz
                ld a, (dados_mapa_70+9)
                and a
                _if_not z
                        ld hl, $3690
                        call l_89d3
                        ld hl, $3a90
                        call l_89d3
                _end_if
        _end_if

        ld a, (nivel)
        cp $70
        _if_not nz
                ld a, (dados_mapa_85+9)
                and a
                _if_not nz
                        ld hl, $4ba0
                        call l_89d3
                        ld hl, $4a94
                        call l_89d3
                        ld hl, $4a88
                        call l_89d3
                        ld hl, $4b7c
                        call l_89d3
                        ld hl, $4c70
                        call l_89d3
                _end_if 
        _end_if

        call l_95a6
        call l_891f
        call l_8b24
        call l_9948
        call copia_color_attributes_para_ecra
        jp function_nome_nivel


desenha_nivel:
        ld a, (nivel)
        cp $7f
        ret z
        ld hl, sprites_dos_niveis
        xor a
        ld (sprites_repetidos), a

l_9503:

        ;_do
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
                jp z, l_959b
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
                                                and $7f
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
                                        call l_8dd7
                                        pop af
                                        ld (background_color), a
                                        call desenha_sprite
                                        ld a, (next_sprite_index)
                                        cp $5b
                                        call z, l_89ea
                                        ld a, (next_sprite_index)
                                        cp $73
                                        call z, l_89e0
                                        pop hl
                                        pop bc
                                _end_if

                                ld a, (valor_atual_index_001)
                                dec a
                                ld (valor_atual_index_001), a
                        _while nz
                ;_end_if
l_959b:
                ld a, (posicao_atual_index_001)
                inc a

        ;_while p
        jp p, l_9503

        ret


valor_atual_index_001:
        db $00

posicao_atual_index_001:
        db $00

sprites_repetidos:
        db $00

l_95a6:
        ld b, $1e
        ld ix, data_ffa2

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
                        call l_8d3e
                        call desenha_sprite
                        call l_8dd7
                        pop ix
                        pop bc
                _end_if

                ld de, $0003
                add ix, de
        _djnz 
        ret


l_95d5:
        ld a, $ff
        ld (data_9d2a), a
        ld b, $1e
        ld ix, data_ffa2
        ld de, $0003

        _do     
                res 7, (ix+$02)
                add ix, de
        _djnz 

l_95eb:
        ld a, (data_9d2a)
        inc a
        ld (data_9d2a), a
        ld hl, $ff90
        call l_9122
        ld hl, data_ff8b ; posicao onde comeca o nome do nivel
        call write_on_screen
        ld hl, $ff90
        call l_912f
        jp l_8a47


l_9607:
        ld b, $03
        ld a, $3a
        call l_9624
        ld bc, (data_9d2c)
        ld a, $2f
        call l_9624
        ld hl, data_ff93 ; posicao onde comeca o nome do nivel
        call write_on_screen
        ld hl, data_ff98
        jp l_912f


        ; start of unknown area 0x9623 to 0x9623
        db $c9
        ; end of unknown area 0x9623 to 0x9623


l_9624:
        ld hl, data_ff98

        _do
                ld (hl), a
                inc hl        
        _djnz

        ret


l_962c:
        ld hl, data_9d2c
        ld a, (data_9d2b)
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
        xor $ff
        ld (data_ff3d), a
        ld a, $04
        ld (sound_to_play), a
        ld a, (data_9d2c)
        add a, a
        and $07
        ld e, a
        ld d, $00
        ld hl, $9681
        add hl, de
        ld c, (hl)
        ld hl, $4134
        ld de, $00f8
        ld b, $06

        _do 
                push bc
                ld a, (data_9d2c)
                add a, a
                ld b, $08

l_9668:
                sub $08
                _if_not c
                        ld (hl), $ff
                        inc l
                        djnz l_9668
                _else

                        ld (hl), c
                        inc l
                        jr l_967a ; if b >0


                        _do
                                ld (hl), $00
                                inc l

l_967a:
                        _djnz

                _end_if

                add hl, de
                pop bc
        _djnz 
        ret


        ; start of unknown area 0x9681 to 0x9688
        db $80, $c0, $e0, $f0, $f8, $fc, $fe, $ff
        ; end of unknown area 0x9681 to 0x9688


function_nome_nivel:
        ld hl, data_ff77 ; posicao onde comeca o nome do nivel
        call write_on_screen

        ld hl, data_fbb1
        ld a, (nivel)
        cp $01
        _if_not z
                cp $18
                jr z, l_96d6
                ld hl, data_fc69
                cp $1e
                jr z, l_96d6
                ld hl, data_fc92
                cp $09
                jr z, l_96d6
                ld hl, data_fd56
                cp $54
                jr z, l_96d6
                add a, $80
                ld b, a
                ld hl, nomes_niveis

l_96b8:
                ld a, (hl)
                cp $ff
                jr z, l_96d6
                cp b
                jr z, l_96d6
                inc hl

                _do
                        ld a, (hl)
                        inc hl
                        cp $ff
                        jr z, l_96b8
                        and $0f
                        cp $0f
                        
                        _continue_if nz

                        ld a, (hl)
                        cp $f0
                _while nz
                inc hl
                jp l_96b8; jp não mexer
        _end_if

l_96d6:
        ld a, $20
        ld (valor_inicia_do_a_20), a
        inc a
        ld (valor_inicia_do_a_21), a
        inc hl
        ld (posicao_onde_comeca_o_nome_do_nivel), hl
        call coloca_em_de_hl_6020_b800
        call l_91a1
        jp coloca_em_de_hl_5e22_b830


l_96ec:
        ld a, $01
        ld (data_9d27), a
        call write_on_screen
        call l_73e5
        jp l_a287


l_96fa:
        ld b, a
        ld c, $00

        _do
                ld a, c
                call l_98c7
                cp $02
                ret c
                cp b
                ret z
                inc c
        _while_true


l_9709:
        ld a, (data_9d32)
        and a
        ret z
        ld hl, data_846c
        call l_9926
        ld hl, data_8478
        call l_9926
        ld a, (dados_mapa_65)
        ld (data_84c0), a
        ld a, $01
        ld (data_9d3f), a

l_9725:
        push ix
        ld a, $01
        ld (data_9d27), a
        ld hl, data_fa0b ; posicao onde comeca o nome do nivel
        call write_on_screen
        ld b, $00

        _do
                push bc
                call l_98d2
                pop bc
                inc b
                ld a, b
                cp $04
        _while nz

        ld hl, data_fa5f ; posicao onde comeca o nome do nivel
        ld a, (data_8cbd)
        and a
        call z, write_on_screen
        ld a, (data_9d33)
        ld hl, data_fa3d
        and a
        _if_not nz
                ld hl, data_fa20 ; posicao onde comeca o nome do nivel
        _end_if

        call write_on_screen
        ld bc, $ff02
        ld a, (data_9d3f)
        and a
        ld a, b
        jr nz, l_9796
        ld b, $03

l_9764:
        ld a, (data_9d2f)
        ld c, a

        _do
                ld a, (data_9d2f)
                cp c
        _while z
        
        ld a, (data_9d35)
        inc a
        and $07
        ld (data_9d35), a
        ld hl, data_9d36
        ld e, a
        ld d, $00
        add hl, de
        ld a, (hl)
        ld (data_9b3c), a
        push bc
        call l_98d2
        call l_98b5
        pop bc
        ld c, a
        bit 3, c
        _if_not nz
                ld a, (data_8cbd)
                and a
                ld a, b

                _if_not z

l_9796:
                        and a
                        _if_not z
                                bit 5, c
                                _if_not nz
                                        bit 2, c
                                        jr z, l_97a2

                                _end_if
                                dec a
                        _end_if
l_97a2:
                        cp $03
                        _if_not z
                                bit 4, c
                                jr nz, l_97ae
                                bit 1, c
                                _if_not z

l_97ae:
                                        inc a

                                _end_if
                        _end_if

                _end_if
                cp b
                jr z, l_9764
                call l_98c7
                ld a, d
                jr z, l_9796
                push af
                ld a, $42
                ld (data_9b3c), a
                ld a, b
                cp $ff
                call nz, l_98d2
                pop bc
                jr l_9764
        _end_if


        ld a, b
        call l_98c7
        ld (data_9819), a
        cp $01
        _if_not z
                call l_9826
                ld a, (data_9819)
                call l_9912
                ld a, (data_9947)
                and a
                _if_not z
                        ld a, (data_9819)
                        cp $40
                        jr nz, l_97f6
                        ld hl, data_85b0
                        call l_9926
                        ld a, (data_9947)
                        and a
                        jr nz, l_97f6
                _end_if

                jr l_980f


l_97f6:
                ld hl, l_980f
                push hl
                ld a, (data_9819)
                cp $01
                ret z
                cp $4d
                jr z, l_981a
                cp $4e
                jr z, l_9820
                pop hl
                call l_9841
        _end_if

        call l_a287

l_980f:
        xor a
        ld (data_9d3f), a
        ld (data_9d33), a
        pop ix
        ret


data_9819:
        db $00

l_981a:
        ld hl, data_f495
        jp l_96ec


l_9820:
        ld hl, data_f4b5
        jp l_96ec


l_9826:
        ld b, a
        ld ix, dados_mapa_0
        ld de, $000f ; static
        
        _do
                add ix, de
        _djnz

        ret


        ; start of unknown area 0x9833 to 0x9840
        db $3e, $ff, $32, $47, $99, $c9, $cd, $47, $98, $dd, $36, $00, $ff
        db $c9
        ; end of unknown area 0x9833 to 0x9840


l_9841:
        call l_9847
        jp l_9867


l_9847:
        ld a, (data_9819)
        call l_9826
        ld c, a
        ld hl, data_8cbc

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
                
                _break_if z

                ld (hl), a
                inc hl
        _while_true

        ld (hl), $00
        ret


l_9867:
        ld a, (nivel)
        ld (ix), a
        ld a, (data_9d0d)
        and $fe
        add a, $22
        ld (ix+$02), a
        cp $38

        _if_not c
                ld a, (nivel)
                cp $54
                jr z, l_9890
                ld a, (ix+$02)
        _end_if

        cp $50
        _if_not nc
                ld a, (nivel)
                cp $56
                _if_not nz

l_9890:
                        ld a, $90
                        jr l_989b

                _end_if
        _end_if


        ld a, (data_9d0e)
        and $f8
        sub $08

l_989b:
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


l_98b5:
        call l_93ab
        and a
        _if_not z
                ld c, a
                ld a, (data_9d3e)
                and a
                ld a, c
        _end_if

        ld (data_9d3e), a
        ret z
        xor a
        ret


l_98c7:
        ld e, a
        ld d, $00
        ld hl, data_8cbd
        add hl, de
        ld d, a
        ld a, (hl)
        and a
        ret


l_98d2:
        ld a, b
        rlca
        rlca
        rlca
        add a, $58
        ld (data_9b3e), a
        ld a, $0c
        ld (data_9b3d), a
        ld a, b
        call l_98c7
        ld hl, data_fa7a ; posicao onde comeca o nome do nivel
        jp z, write_on_screen
        ld hl, dados_mapa_0 + 5
        ld de, $000f ; static
        ld b, a

        _do
                add hl, de
        _djnz

        ld e, (hl)
        inc hl
        ld h, (hl)
        ld l, e
        cp $01
        jp nz, write_on_screen
        ld a, $74
        ld (data_9b3e), a
        jp write_on_screen


l_9905:
        ld hl, $0000
        ld (data_8cbd), hl
        ld hl, $0100
        ld (data_8cbf), hl
        ret


l_9912:
        ld a, $ff
        ld (data_9947), a
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

l_9926:
        ld a, $ff
        ld (data_9947), a
        ld a, (nivel)

        cp (hl) ;0 
        ret nz
        inc hl 
        ld e, (hl) ; 1
        inc hl
        ld d, (hl) ; 2
        inc hl
        ld a, (hl) ; 3
        inc hl
        ld b, (hl) ; 4
        inc hl 
        push hl
        ld l, a
        ld h, b
        ex de, hl
        call l_89b1
        pop hl
        ret nc
        xor a
        ld (data_9947), a
        jp (hl) ; 5


data_9947:
        db $ff


l_9948:
        ld a, (nivel)
        cp $74
        ret nz
        ld a, (dados_mapa_56)
        cp $74
        ret nz
        ld a, (dados_mapa_56+1)
        cp $02
        ret nz
        ld a, $23
        ld hl, (data_99c2)
        ld (data_99bd), hl
        ld (data_99bf), hl
        ld (next_sprite_index), a
        call function_print_sprite
        ld ix, data_99bd
        ld hl, (sprit_actual_byte_to_draw)
        ld bc, (altura_sprite_a_desenhar)

        _do
                ld a, (data_99c1)
                ld b, a

l_997a:
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
                                        ld a, (data_99c1)
                                        ld b, a

                                
                                        _do

                                                exx
                                                call l_9ac2
                                                inc (ix)
                                                exx
                                        
                                        _djnz

                                _else

                                        ld a, (data_99c1)
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
                        jr l_997a

                _end_if

                pop af
                dec c
        _while nz
        ret


data_99bd:
        db $00

        ; start of unknown area 0x99be to 0x99be
        db $00
        ; end of unknown area 0x99be to 0x99be


data_99bf:
        db $00

        ; start of unknown area 0x99c0 to 0x99c0
        db $00
        ; end of unknown area 0x99c0 to 0x99c0


data_99c1:
        db $03

data_99c2:
        db $64

data_99c3:
        db $64

l_99c4:
        ld ix, color_attribute_temp
        ld b, $03
        ld de, $00c8
        ld hl, $1000


 
        _do

                call l_9a88
                add ix, de
        
        _djnz

        ld de, $0800

        _do 
                push de
                halt
                ld a, (data_9d2e)
                ld b, a
                ld a, (data_9d2f)
                sub b
                cp $03

                _if_not c
                        ld a, (data_9d2f)
                        ld (data_9d2e), a
                _end_if

                ld ix, color_attribute_temp
                ld b, $03


        
                _do

                        push bc
                        push ix
                        call l_9a29
                        pop ix
                        ld de, $00c8
                        add ix, de
                        pop bc
                
                _djnz

                pop de
                dec de
                ld a, d
                or e
        _while nz
        ret


l_9a0b:
        ld a, (ix+$01)
        cp $c0

        jr nc, label_0002

        ld b, $32
        ld de, $0004


        _do

                exx
                call l_9ac2
                exx
                call l_9afa
                exx
                call l_9ac2
                exx
                add ix, de
                
        _djnz

        ret


l_9a29:
        bit 0, (ix+$02)
        jr nz, l_9a0b
        call l_9aa7
        call l_9afa
        ld a, (ix+$03)
        and a
        _if_not z
                jr l_9aa7
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
                and $3f
                sub $20
                ld (ix+$02), a
                set 0, (ix+$02)
                ld a, (hl)
                inc l
                and $07
                sub $0f
                ld (ix+$03), a
                exx
                call l_9ac2
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
                call l_9ac2
                exx
                add ix, de
               
        _djnz

        pop ix

l_9a88:
        ld a, (hl)
        inc l
        ld (ix), a
        ld (ix+$01), $b8
        ld a, (hl)
        inc l
        and $3f
        sub $20
        ld (ix+$02), a
        res 0, (ix+$02)
        ld a, (hl)
        inc l
        and $0f
        sub $19
        ld (ix+$03), a

l_9aa7:
        exx
        call l_9ac2
        inc (ix)
        call l_9ac2
        inc (ix+$01)
        call l_9ac2
        dec (ix)
        call l_9ac2
        dec (ix+$01)
        exx
        ret


l_9ac2:
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
        cp $f0
        ret nc
        add a, $08
        and $f8
        rrca
        rrca
        rrca
        add a, l
        ld l, a
        ld a, (ix)
        and $07
        ld bc, $9b19
        add a, c
        ld c, a

        _if_not nc
                inc b
        _end_if

        ld a, (bc)
        xor (hl)
        ld (hl), a
        ret


l_9afa:
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


        ; start of unknown area 0x9b19 to 0x9b20
        db $80, $40, $20, $10, $08, $04, $02
        db $01
        ; end of unknown area 0x9b19 to 0x9b20


next_sprite_index:
        db $00

sprite_left:
        db $00

sprite_top:
        db $00

apenas_brite_and_ink:
        db $00

largura_sprite_a_desenhar:
        db $00

altura_sprite_a_desenhar:
        db $00

background_color:
        db $00

sprite_espelho:
        db $00

sprit_actual_byte_to_draw:
        db $00

        ; start of unknown area 0x9b2a to 0x9b2a
        db $00
        ; end of unknown area 0x9b2a to 0x9b2a


valor_de:
        db $22

        ; start of unknown area 0x9b2c to 0x9b2c
        db $5e
        ; end of unknown area 0x9b2c to 0x9b2c


valor_hl:
        db $30

        ; start of unknown area 0x9b2e to 0x9b2e
        db $b8
        ; end of unknown area 0x9b2e to 0x9b2e


altura_sprite_a_desenhar_copy:
        db $00

largura_sprite_a_desenhar_copy:
        db $00

data_9b31:
        db $00

sprite_top_copy:
        db $00

sprite_left_copy:
        db $00

        ; start of unknown area 0x9b34 to 0x9b3b
        db $00, $00, $0f, $0f, $ff, $ff, $f0, $f0
        ; end of unknown area 0x9b34 to 0x9b3b


data_9b3c:
        db $07

data_9b3d:
        db $0a

data_9b3e:
        db $0a

valor_inicia_do_a_20:
        db $0a

l_9b40:
        ld (altura_do_novo_boneco), a
        push ix
        push hl
        ld a, l
        ld (linha_debaixo_onde_se_desenha_o_boneco), a
        pop hl
        ld a, e
        ld (hero_left_position_in_nibbles), a
        srl a
        ld de, dizzy_image_xor_background
        ld (de), a
        inc de
        ld a, (altura_do_novo_boneco)
        di
        exx
        push bc
        push de
        push hl
        exx
        ld (data_9cb3), sp
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
        ld (data_9cb1), a
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
        ld a, (data_9cb1)
        srl c
        jr c, rotate_hero_image_4_bits_to_the_right

l_9b9e:
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
        jp nz, l_9b9e
        ld sp, (data_9cb3)
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
        ld a, $ff
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
        ld (data_9cb8), a
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
        ld (data_9cb9), a
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
        ld hl, (data_9cb8)
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
        ld sp, (data_9cb3)
        exx
        pop hl
        pop de
        pop bc
        exx
        pop ix
        ei
        ret


l_9c7b:
        di
        ld (data_9cb3), sp
        ld sp, dizzy_image_xor_background
        pop bc
        ld a, c
        ld (dynamic_9c90+1), a
        pop hl
        ld a, b

        _do
                ex af, af'
                ld e, (hl)
                inc hl
                ld d, (hl)
                inc hl
                ex de, hl
dynamic_9c90:
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

        ld sp, (data_9cb3)
        ei
        ret


altura_do_novo_boneco:
        db $00

data_9cb1:
        db $00

linha_debaixo_onde_se_desenha_o_boneco:
        db $00

data_9cb3:
        db $00


        db $00


screen_memory_hero_top_line:
        defw $0000

hero_left_position_in_nibbles:
        db $00

data_9cb8:
        db $00

data_9cb9:
        db $00

        ; start of unknown area 0x9cba to 0x9d0c
        db $f5, $3e, $13, $18, $03, $f5

        ;9cc0
        db $3e, $10, $01, $fd, $7f, $ed, $79, $f1, $c9
        
function_9cc9
        db $cd, $ba, $9c, $3a, $45, $9d, $a7
        
        ;9cd0
        db $28, $05, $3d, $28, $10, $18, $1c, $cd, $33, $c0, $3a, $46, $9d, $a7, $28, $24
        ;9ce0
        db $cd, $e3, $c1, $18, $0e, $cd, $33, $d3, $3a, $46, $9d, $3d, $28, $16, $cd, $e3
        db $d4, $18, $00, $3a, $46, $9d, $a7, $28, $08, $3d, $20, $08, $cd, $00, $d3, $18
        db $03, $cd, $00, $c0, $3a, $46, $9d, $32, $45, $9d, $c3, $bf, $9c
        ; end of unknown area 0x9cba to 0x9d0c


data_9d0d:
        db $19

data_9d0e:
        db $78


posicao_hero_x_em_nibbles_copia:
        db $19


data_9d10:
        db $78
data_9d11:
        db $00
data_9d12:
        db $00
data_9d13:
        db $00
data_9d14:
        db $00

frame_movimento_do_hero:
        db $00

data_9d16:
        db $00
data_9d17:
        db $00
data_9d18:
        db $00
data_9d19:
        db $00


posicao_hero_x_em_nibbles:
        dw $0000


sera_o_nivel_copia_3:
        db $00


data_9d1d:
        db $00
        
        db $00, $00
        db $00, $00, $00



nivel:
        db $00

nivel_copy:
        db $00

        
data_9d25:        
        db $00
data_9d26:
        db $00
data_9d27:
        db $01
posicao_texto_a_escrever:
        db $00
        db $00

data_9d2a:
        db $00
data_9d2b:
        db $00
data_9d2c:
        db $00
data_9d2d:
        db $00
data_9d2e:
        db $00
data_9d2f:
        db $00
data_9d30:
        db $00
data_9d31:
        db $00
data_9d32:
        db $00
data_9d33:
        db $00
data_9d34:
        db $00
data_9d35:
        db $00

data_9d36:
        db $02, $03, $04, $05, $06, $05, $04, $03

data_9d3e:
        db $00
data_9d3f:
        db $00
data_9d40:
        db $00
data_9d41:
        db $ff
data_9d42:
        db $00


sound_to_play:
        db $ff

        ; start of unknown area data_9d44 to data_9d63
data_9d44:
        db $ff
data_9d45:
        db $ff
data_9d46:
        db $ff
data_9d47:
        db $04
data_9d48:
        db $00
        db $00
data_9d4a:
        db $00
data_9d4b:
        db $ff
data_9d4c:
        db $ff
data_9d4d:
        db $c2
        db $e2
        db $c0
        db $01
        db $02
        db $e0
data_9d53:
        db $81
        db $82
        db $80
        db $84
        db $83
        db $81
data_9d59:
        db $13
        db $12
        db $14
        db $11
        db $10
        db $13

data_9d5f:
        db $00
data_9d60:
        db $00
data_9d61:
        db $00
data_9d62:
        db $00
data_9d63:
        db $ff


l_9d64:
        push ix
        ld a, (data_9d89)
        ld ix, data_9d89
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

data_9d89:
        db $59
data_9d8a:
        db $a3
data_9d8b:
        db $13


l_9d8c:
        xor a
        ld (data_9d60), a
        ld (data_9d61), a
        ld (data_9d62), a
        ld (data_9d5f), a
        ld (data_9d30), a
        ld a, (data_9d2b)
        and a
        ret z
        call l_93ab
        ld c, a
        ld a, (data_9d16)
        and a
        _if_not nz
                ld a, (data_9d31)
                and a
                _if_not nz
                        bit 3, c
                        _if_not z
                                ld a, $01
                                ld (data_9d5f), a
                                ret
                        _end_if
                _end_if
        _end_if


        bit 2, c

        _if_not z
                ld a, $01
                ld (data_9d60), a
        _end_if

        bit 1, c
        _if_not z
                ld a, $01
                ld (data_9d61), a
        _end_if

        bit 0, c
        _if_not z
                ld a, $01
                ld (data_9d62), a
        _end_if

        ld a, (data_9d63)
        and a
        ret nz
        ld bc, (data_9d60)
        ld l, b
        ld h, c
        ld (data_9d60), hl
        ret


l_9de5:
        ld a, (data_9d0d)
        ld (posicao_hero_x_em_nibbles_copia), a
        ld e, a
        ld a, (data_9d0e)
        ld (data_9d10), a
        inc a
        ld l, a
        ld d, $00
        ld h, d
        ld a, (data_9d12)
        ld (data_9d13), a
        jp l_9b40


l_9e00:
        ld a, $38
        ld (data_9d0d), a
        ld a, (nivel)
        dec a
        jp l_9e41


l_9e0c:
        ld a, $02
        ld (data_9d0d), a
        ld a, (nivel)
        inc a
        cp $2e
        jp nz, l_9e41
        ld a, $11
        ld (data_9d0d), a
        ld a, $2e
        jp l_9e41


l_9e24:
        ld a, (data_9d0e)
        add a, $76
        ld (data_9d0e), a
        ld a, (nivel)
        sub $17
        jp l_9e41


l_9e34:
        ld a, (data_9d0e)
        sub $72
        ld (data_9d0e), a
        ld a, (nivel)
        add a, $17

l_9e41:
        ld (nivel_copy), a
        ld a, $01
        ld (data_9d27), a
        ret


label_0001:       
        ld a, (frame_movimento_do_hero)
        and a
        jp z, l_9eae
        jp l_9f15


function_9e54:
        ld a , (data_9d2f)
        and $03
        ret nz
        ld hl, $5d44

        ld (dinamic_9112+1), hl
        call function_9e6a

        ld hl, screenattributes
        ld (dinamic_9112+1), hl
        ret


function_9e6a:
        call l_9c7b
        
        ld a, (data_9d16)
        cp $06
        jp z, l_9f15
        ld a, (data_9d2b)
        and a

        _if_not nz
                ld a, (data_9d16)
                cp $07
                _if_not nz
                        xor a
                        ld (data_9d60), a
                        ld (data_9d61), a
                        ld a, (frame_movimento_do_hero)
                        cp $07
                        jp nz, l_9f15
                        ld a, $06
                        ld (frame_movimento_do_hero), a
                        xor a
                        ld (data_9d44), a
                        jr l_9f15
                _end_if

                xor a
                ld (frame_movimento_do_hero), a
                ld a, $07
                ld (data_9d16), a
                jr l_9f15
        _end_if


        ld a, (data_9d16)
        cp $03

        jr nc, label_0001

l_9eae:
        ld a, (data_8b85)
        and a
        _if_not z
                ld a, (data_9d14)
                and a
                jr z, l_9f15

        _end_if
        ld a, (data_9d16)
        and a
        _if_not z
                ld a, (frame_movimento_do_hero)
                and $03
                srl a
                _if_not nc
                _end_if
        _end_if


        ld a, (data_9d4b)
        and a
        _if_not z
                ld a, (data_8b85)
                and a
                _if_not z
                        ld hl, (data_9d0d)
                        ld a, (nivel)
                        ld (posicao_hero_x_em_nibbles), hl
                        ld (sera_o_nivel_copia_3), a
                _end_if
        _end_if

        call l_9d8c
        ld a, (data_9d60)
        cp $01
        _if_not nz
                ld a, $01
        _else

                ld a, (data_9d61)
                cp $01
                _if_not nz
                        ld a, $02
                _else
                        xor a
                _end_if
        _end_if


        ld b, a
        ld a, (data_9d62)
        and a
        _if_not z
                xor a
                ld (sound_to_play), a
                xor a
                ld (frame_movimento_do_hero), a
                ld a, $f8
                ld (data_9d11), a
                ld a, $03
        _end_if

        add a, b
        ld (data_9d16), a

l_9f15:
        ld a, (frame_movimento_do_hero)
        ld e, a
        ld a, (data_9d63)
        and a
        ld a, (data_9d16)
        _if_not nz
                ld hl, data_a18d
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
        ld hl, data_a145
        add hl, bc
        ld a, (hl)
        ld (data_9d12), a
        ld a, e
        inc a
        and $07
        ld (frame_movimento_do_hero), a
        ld a, (nivel)
        ld (data_9d25), a
        ld a, (data_9d0d)
        ld b, a
        ld ix, data_9d60
        sub (ix)
        add a, (ix+$01)
        cp $01
        jp z, l_9e00
        cp $39
        jp z, l_9e0c
        cp $10
        jp nc, l_9f6e
        ld b, a
        ld a, (nivel)
        cp $2e
        jp z, l_9e00
        ld a, b

l_9f6e:
        ld (data_9d0d), a
        ld b, a
        ld a, (posicao_hero_x_em_nibbles_copia)
        cp b
        _if_not z
                jp c, l_a093
                jp l_a05a
        _end_if

l_9f7e:
        ld a, (data_8b85)
        and a
        _if_not nz
                ld a, (data_9d11)
                and a
                ld a, $01
                jp p, l_9f9e
        _end_if

        ld a, (data_9d16)
        cp $06
        jr z, l_9fac
        cp $08
        ld a, $fa
        _if_not z
                ld a, (data_9d11)
                inc a
        _end_if
l_9f9e:
        ld (data_9d11), a
        bit 7, a
        jp nz, l_9fb8
        jr l_9fed


l_9fa8:
        xor a
        ld (data_9d14), a

l_9fac:
        ld a, (nivel)
        ld b, a
        ld a, (data_9d25)
        cp b
        ret nz
        jp l_9de5


l_9fb8:
        neg
        ld b, a
        call l_a0e6
        ld de, data_ffd8
        add ix, de
        ld a, (data_9d19)
        sub $14
        ld (data_9d19), a


 
        _do

                push bc
                call l_a0f8
                pop bc
                jr nz, l_9fa8  
                dec ix
                dec ix
                ld a, (data_9d19)
                dec a
                ld (data_9d19), a
                ld a, (data_9d0e)
                dec a
                cp $42
                jp c, l_9e24
                ld (data_9d0e), a
        
        _djnz

        jr l_9fa8


l_9fed:
        cp $08
        _if_not c
                ld a, $07
                ld (data_9d11), a
        _end_if

        add a, $04
        ld b, a
        call l_a0e6
        ld de, data_fffa
        add ix, de
        ld a, (data_9d19)
        sub $03
        ld (data_9d19), a
        ld a, (data_9d0e)
        sub $04
        ld (data_9d0e), a


 
        _do

                push bc
                call l_a0f8
                pop bc
                jr nz, l_a034
                inc ix
                inc ix
                ld a, (data_9d19)
                inc a
                ld (data_9d19), a
                ld a, (data_9d0e)
                inc a
                cp $b6
                jp nc, l_9e34
                ld (data_9d0e), a
        
        _djnz

        jp l_9fa8


l_a034:
        ld a, (data_9d0e)
        cp $42
        jp c, l_9e24
        jp z, l_9fa8
        ld (data_9d0e), a
        ld a, $01
        ld (data_9d14), a
        ld a, (data_9d11)
        cp $02
        
        _if_not c
                ld a, $01
                ld (sound_to_play), a

        _end_if

        xor a
        ld (data_9d11), a
        jp l_9fac


l_a05a:
        call l_a0e6
        ld de, data_ffec
        add ix, de
        ld a, (data_9d19)
        sub $0a
        ld (data_9d19), a
        ld b, $03

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, (data_9d0d)
                ld (data_9d18), a
                call l_a134
                and a
                pop bc
                call nz, l_a0ce
                ld a, (data_9d19)
                sub $04
                ld (data_9d19), a
                ld de, data_fff8
                add ix, de
        _djnz
        jp l_9f7e


l_a093:
        call l_a0e6
        ld de, data_ffec
        add ix, de
        ld a, (data_9d19)
        sub $0a
        ld (data_9d19), a
        ld b, $03

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, (data_9d0d)
                add a, $05
                ld (data_9d18), a
                call l_a134
                and a
                pop bc
                call nz, l_a0ce
                ld a, (data_9d19)
                sub $04
                ld (data_9d19), a
                ld de, data_fff8
                add ix, de
        _djnz
        jp l_9f7e


l_a0ce:
        ld a, (data_9d18)
        ld e, a
        ld a, (data_9d19)
        ld l, a
        call l_9106
        bit 6, (hl)
        ret nz
        ld a, (posicao_hero_x_em_nibbles_copia)
        ld (data_9d0d), a
        pop af
        jp l_9f7e


l_a0e6:
        ld a, (data_9d0e)
        ld (data_9d19), a
        ld l, a
        ld h, $00
        add hl, hl
        ld de, screen_memory_map
        add hl, de
        push hl
        pop ix
        ret


l_a0f8:
        ld a, (data_9d0d)
        inc a
        ld (data_9d18), a
        ld b, $05
        dec b

        _do
                push bc
                ld l, (ix)
                ld h, (ix+$01)
                ld a, (data_9d18)
                call l_a134
                and a
                pop bc
                call nz, l_a11f
                ld a, (data_9d18)
                inc a
                ld (data_9d18), a
                dec b
        _while nz
        ret


l_a11f:
        ld a, (data_9d18)
        ld e, a
        ld a, (data_9d19)
        ld l, a
        call l_9106
        ld a, (hl)
        bit 6, a
        ret nz
        pop hl
        xor $40
        bit 6, a
        ret


l_a134:
        ld c, a
        ld b, $00
        srl c
        _if_not c
                add hl, bc
                ld a, (hl)
                and $f0
                ret
        _end_if

        add hl, bc
        ld a, (hl)
        and $0f
        ret


data_a145:
        db $00, $01, $00, $01, $00, $01, $00, $01, $09, $0a, $0b
        db $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $02, $03, $04
        db $05, $06, $07, $08, $01, $19, $1a, $1b, $1c, $1d, $1e, $1f, $09, $20, $21, $22
        db $23, $24, $25, $26, $11, $04, $05, $05, $06, $06, $05, $05, $04, $00, $01, $08
        db $08, $07, $06, $07, $07, $08, $07, $06, $05, $04, $03, $02, $01
        
        
data_a18d:
        db $00, $02, $01, $03, $05, $04, $06, $07, $08
        


l_a196:
        ld de, (posicao_hero_x_em_nibbles)
        ld a, (sera_o_nivel_copia_3)
        cp $67

        _if_not z
                cp $7e
                jr nz, l_a1aa
        _end_if


 
       
        ld a, $50
        ld de, $6b16 

l_a1aa:
        ld (data_9d0d), de
        ld (nivel_copy), a
        ld (nivel), a
        cp $56

        _if_not z
                cp $54
                jr nz, l_a1dd
                ld a, e
                cp $18
                jr c, l_a1dd
        _else
                ld a, e
                cp $30
                jr nc, l_a1dd
        _end_if


        ld a, $9f
        ld (data_9d0e), a
        ld a, $a0
        ld (dados_mapa_10+3), a
        ld (dados_mapa_11+3), a
        ld (dados_mapa_12+3), a
        ld (dados_mapa_13+3), a
        jr l_a205


l_a1dd:
        ld a, (nivel)
        cp $4c
        _if_not z
                cp $4f
                jr nz, l_a1f0

        _end_if

        ld a, d
        cp $90
        _if_not c
                ld a, (nivel)

l_a1f0:
                ld hl, list_a267
                ld b, $04

                _do
                        cp (hl)
                        _if_not nz
                                ld de, (data_9d1d)
                                ld (data_9d0d), de
                                jr l_a205
                        _end_if

                        inc hl
                _djnz 
        _end_if
l_a205:
        ld hl, $0000
        ld (data_9d5f), hl
        ld (data_9d61), hl
        xor a
        ld (data_9d11), a
        ld (data_9d14), a
        ld (data_9d16), a
        ld (frame_movimento_do_hero), a
        ld (data_9d2c), a
        ld a, $1f
        ld (data_9d2b), a
        ld a, $0f
        ld (data_9d31), a
        ld a, $01
        ld (data_9d12), a
        ld (data_9d44), a
        ld a, $01
        ld (data_9d27), a
        ld hl, dados_mapa_52
        call l_7ccf
        call l_9458
        
        _do
                call l_895c
                call l_962c
                call playsound

                _do
                        ld a, (data_9d2e)
                        ld b, a
                        ld a, (data_9d2f)
                        sub b
                        cp $03
                _while c

                ld a, (data_9d2f)
                ld (data_9d2e), a
                ld a, (dados_mapa_52)
                inc a
        _while nz
        call l_9de5

        xor a 
        ld (data_9d27), a
        ret

        
list_a267        
        db $4c, $4f, $5c, $54
        ; end of unknown area 0xa262 to 0xa26a


l_a26b:
        ld a, (nivel_copy)
        ld (nivel), a
        and $fe
        cp $2c
        ld a, $ff

        _if_not nz
                xor a
        _end_if

        ld (data_9d63), a
        ld hl, (data_9d0d)
        ld (data_9d1d), hl
        xor a
        ld (dados_mapa_79+9), a

l_a287:
        ld a, $01
        ld (data_9d27), a
        call l_9458
        call l_9de5

after_call_force_disassemle_005:
        xor a
        ld (data_9d27), a
        ret


stack:
        db $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a, $2a

numero_de_sprites_por_nivel:
        db $30, $32, $26, $00, $00, $00, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $1e, $00, $00, $00, $00, $00, $21, $00, $2d, $00, $00, $46, $28, $00, $00, $00, $00, $00, $06, $00, $2c, $1e, $24, $32, $00, $00, $00, $48, $3e, $29, $43, $3f, $37, $31, $4f, $3b, $00, $00, $00, $00, $32, $22, $3e, $00, $00, $2b, $36, $3a, $4b, $39, $5b, $42, $23, $38, $42, $22, $3d, $46, $4d, $29, $19, $2d, $1c, $54, $00, $5b, $00, $00, $38, $00, $00, $00, $00, $00, $00, $00, $00, $42, $4c, $36, $00, $00, $00, $00, $00, $00, $00, $48, $3e, $00, $00, $39, $2b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $31, $00


        include "sprite_niveis.asm"
        include "sprites.asm"
        include "texts.asm"


data_fdc6:
        db $c1

        ; start of unknown area 0xfdc7 to 0xfdff
        db $28, $10, $a4, $9d, $63, $62, $0d, $94, $bd

        ;fdd0
        db $13, $64, $ff, $c1, $28, $10, $3d, $12, $5d, $91, $0d, $94, $bd, $13, $64, $ff
        ;fde0
        db $ff, $7d, $5d, $cf, $f0, $06, $00, $78, $cd, $70, $93, $c8, $04, $78, $e6, $07
        ;fdf0
        db $fe, $05, $20, $f3, $78, $c6, $1b, $47, $20, $ed, $04, $c9, $00
        
interrupt:        
        jp interrupt_handler


lista_de_fd:
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd
        db $fd


playsound:
        ld a, (sound_to_play)
        cp $ff
        ret z
        add a, a
        add a, a
        ld d, $00
        ld e, a
        ld hl, sons
        add hl, de
        ld a, $ff
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
                out ($fe), a
                ld a, c
                add a, d
                ld c, a
        
        _djnz

        ret

sons:
        db $64, $96, $ff, $ff
        db $0a, $ff, $00, $ff
        db $28, $64, $00, $ff
        db $64, $3c, $00, $ff
        db $0a


data_ff3d:
        db $ff

        ; start of unknown area 0xff3e to 0xfffb
        db $00, $ff

interrupt_handler:
	di  
	push af
	push bc
	push de
	push hl
	push ix
	exx 
	ex   af,af'
	push af
	push bc
	push de
	push hl
	push iy
	ld   a,(data_728e)
	and  a
	call nz,function_9cc9
	ld   a,(data_9d2f)
	inc  a
	ld   (data_9d2f),a
	ld   a,(data_9d27)
	and  a
	call z,function_9e54
	call function_93b2
	pop  iy
	pop  hl
	pop  de
	pop  bc
	pop  af
	exx 
	ex   af,af'
	pop  ix
	pop  hl
	pop  de
	pop  bc
	pop  af
	ei  
	ret 
        
data_ff77:        
        db $f6, $f8, $08, $18, $00, $00, $00, $00, $00
        db $00, $00, $00, $00, $00, $00, $00, $f8, $20, $10, $ff


data_ff8b:
        db $f6, $f8, $19, $08, $ff
        db $30, $30, $00
        
data_ff93:        
        db $f6, $f8, $20, $08, $ff

data_ff98:        
        db $20, $20, $20, $00
        

data_ff9c:
        db $f7, $f8, $00, $00

        ;ffa0        
        db $11, $ff
data_ffa2        
        db $28, $a0, $01
        db $48, $80, $17
        db $30, $98, $1e
        db $4e, $38, $20
        db $3e, $50, $2c
        db $22, $90, $2d
        db $3c, $60, $33
        db $3e, $98, $38
        db $4c, $38, $39
        db $38, $58, $3a
        db $3e, $a0, $42
        db $3a, $38, $45
        db $42, $90, $46
        db $26, $60, $49
        db $2e, $40, $4b
        db $38, $90, $4d
        db $24, $60, $4f
        db $3a, $40, $51
data_ffd8:
        db $28, $98, $52
        db $36, $38, $53
        db $24, $98, $54
        db $38, $90, $55
        db $24, $90, $57
        db $2e, $78, $5c, $26, $78
data_ffec
        db $66, $44, $a0, $67
        
        ;fff0
        db $26, $88, $6f, $2e, $50, $6f, $26, $a0
data_fff8:
        db $70, $4a
        
data_fffa
        db $a0, $74




 
