
        org $5E49


        ; Start of unknown area $5E49 to $5E5D
        defb $0C, $11, $CD, $3E, $5E, $21, $00
        defb $C0, $11, $00, $40, $01, $00, $1B, $ED, $B0, $3E, $10, $CD, $3E, $5E
        ; End of unknown area $5E49 to $5E5D


start:
        di
        ld sp, numero_de_sprites_por_nivel
        ld hl, $5B00

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

        ld hl, $5C64
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


index_mask_image_hero:
        defw $0002, $0082, $00FC, $016A, $01C0, $022E, $02A8, $0316, $036C, $03D4, $0454, $04D4, $054E, $05CE, $064E, $06CE, $0748, $07C8, $0848, $08C8, $0948, $09C8, $0A48, $0AC8, $0B42, $0BC2, $0C30, $0C8C, $0D06, $0D86, $0E00, $0E5C, $0ED6, $0F50, $0FAC, $1026, $10A6, $1120, $117C

mask_images_hero:
        defw $11FC


        include "image_mask.asm"

after_mask_images:
        defb $01

        ; Start of unknown area $728F to $7290
        defb $00
        defb $01
        ; End of unknown area $728F to $7290


restart_game:
        ld hl, $5DE4
        ld de, $5DE5
        ld bc, $025F
        ld (hl), $42
        ldir
        ld a, $01
        ld ($9D27), a
        xor a
        ld (nivel), a
        call L_9458
        ld hl, after_sprites
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

after_call_force_disassemle_001:
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
        jp p, L_7330
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
                jp nz, L_730E
                ld a, ($9D44)
                and a
                jp nz, L_730E
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
                jp nz, L_72FD

        _end_if

        ld a, $FF
        ld ($9D46), a
        jp restart_game


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
        jp restart_game


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


dados_mapa_0:
        defb $FF, $0D, $00, $00, $00, $01, $04, $00, $01, $00, $1F, $01, $38, $64, $9E

dados_mapa_1:
        defb $FE, $07, $30, $90, $01, $7B, $FA, $00, $00, $00, $42, $FE, $30, $90, $01

dados_mapa_2:
        defb $FF, $1A, $00, $00, $00, $01, $00, $00, $01, $00, $45, $01, $28, $9E, $DD

dados_mapa_3:
        defb $FF, $01, $00, $00, $00, $00, $01, $00, $01, $00, $02, $4F, $20, $78, $C8

dados_mapa_4:
        defb $FF, $01, $00, $00, $00, $00, $01, $00, $01, $00, $07, $73, $5A, $88, $F6

dados_mapa_5:
        defb $FF, $20, $00, $00, $00, $00, $01, $00, $01, $00, $4C, $4C, $58, $94, $7A

dados_mapa_6:
        defb $FF, $21, $00, $00, $00, $50, $00, $00, $00, $00, $0C, $4C, $50, $A0, $78

dados_mapa_7:
        defb $FF, $22, $00, $00, $00, $50, $00, $00, $00, $00, $06, $35, $2C, $48, $41

dados_mapa_8:
        defb $FF, $0B, $00, $00, $00, $00, $00, $00, $01, $00, $1F, $53, $46, $96, $5A

dados_mapa_9:
        defb $FF, $12, $00, $00, $00, $A2, $FF, $1E, $1E, $00, $1F, $53, $46, $96, $41

dados_mapa_10:
        defb $FF, $1F, $00, $00, $00, $00, $00, $00, $01, $00, $0C, $54, $3C, $A0, $7E

dados_mapa_11:
        defb $FF, $1F, $00, $00, $00, $00, $00, $00, $01, $00, $0C, $54, $50, $A0, $7E

dados_mapa_12:
        defb $FF, $1F, $00, $00, $00, $00, $00, $00, $01, $00, $0C, $56, $2A, $A0, $7E

dados_mapa_13:
        defb $FF, $1F, $00, $00, $00, $00, $00, $00, $01, $00, $0C, $56, $41, $A0, $7E

dados_mapa_14:
        defb $FF, $15, $00, $00, $00, $00, $01, $00, $01, $00, $5F, $67, $2C, $92, $69

dados_mapa_15:
        defb $FF, $13, $00, $00, $00, $28, $3E, $01, $00, $00, $4F, $54, $32, $6E, $6C

dados_mapa_16:
        defb $FF, $13, $00, $00, $00, $44, $50, $FF, $00, $00, $4F, $54, $50, $6E, $6C

dados_mapa_17:
        defb $FF, $14, $00, $00, $00, $00, $01, $00, $01, $00, $0D, $4F, $46, $96, $9A

dados_mapa_18:
        defb $FF, $16, $00, $00, $00, $00, $01, $00, $01, $00, $5F, $49, $4C, $60, $61

dados_mapa_19:
        defb $FF, $01, $00, $00, $00, $00, $00, $00, $00, $00, $46, $49, $48, $70, $63

dados_mapa_20:
        defb $FF, $17, $00, $00, $00, $00, $01, $00, $01, $00, $4C, $49, $2C, $48, $60

dados_mapa_21:
        defb $FF, $0C, $00, $00, $00, $00, $01, $00, $01, $00, $1F, $FF, $2C, $78, $9E

dados_mapa_22:
        defb $FF, $18, $00, $00, $00, $00, $01, $00, $01, $00, $CC, $FF, $2C, $78, $72

dados_mapa_23:
        defb $FF, $1B, $00, $00, $00, $00, $00, $00, $00, $00, $42, $34, $48, $38, $7C

dados_mapa_24:
        defb $FF, $1B, $00, $00, $00, $00, $00, $00, $00, $00, $42, $23, $38, $30, $7C

dados_mapa_25:
        defb $FF, $1B, $00, $00, $00, $00, $00, $00, $00, $00, $42, $3A, $42, $48, $7C

dados_mapa_26:
        defb $FF, $0E, $00, $00, $00, $00, $00, $00, $01, $00, $1E, $FF, $46, $96, $9B

dados_mapa_27:
        defb $FF, $0F, $00, $00, $00, $00, $00, $00, $01, $00, $1A, $65, $46, $32, $9C

dados_mapa_28:
        defb $FF, $10, $00, $00, $00, $00, $00, $05, $00, $00, $1F, $56, $3C, $8C, $98

dados_mapa_29:
        defb $FF, $10, $00, $00, $00, $00, $00, $09, $00, $00, $1F, $56, $46, $50, $98

dados_mapa_30:
        defb $FF, $10, $00, $00, $00, $00, $00, $01, $00, $00, $1E, $6F, $3C, $3E, $73

dados_mapa_31:
        defb $FF, $10, $00, $00, $00, $00, $00, $02, $00, $00, $1E, $6F, $46, $76, $73

dados_mapa_32:
        defb $FF, $10, $00, $00, $00, $00, $00, $01, $00, $00, $1E, $70, $46, $86, $73

dados_mapa_33:
        defb $FF, $10, $00, $00, $00, $00, $00, $02, $00, $00, $1E, $70, $46, $4E, $73

dados_mapa_34:
        defb $FF, $11, $00, $00, $00, $42, $88, $02, $00, $00, $4A, $2C, $34, $50, $76

dados_mapa_35:
        defb $FF, $11, $00, $00, $00, $42, $88, $02, $00, $00, $4A, $2C, $46, $50, $76

dados_mapa_36:
        defb $FF, $10, $00, $00, $00, $00, $00, $01, $00, $00, $1E, $5C, $46, $64, $64

dados_mapa_37:
        defb $FF, $10, $00, $00, $00, $00, $00, $01, $00, $00, $1E, $37, $46, $8C, $64

dados_mapa_38:
        defb $FF, $10, $00, $00, $00, $00, $00, $01, $00, $00, $1E, $38, $46, $60, $64

dados_mapa_39:
        defb $FF, $1C, $00, $00, $00, $01, $00, $00, $01, $00, $1E, $5C, $36, $80, $67

dados_mapa_40:
        defb $FF, $1D, $00, $00, $00, $01, $00, $00, $01, $00, $4A, $2D, $28, $70, $75

dados_mapa_41:
        defb $FF, $1E, $00, $00, $00, $01, $00, $00, $01, $00, $4E, $2A, $28, $32, $6F

dados_mapa_42:
        defb $FF, $06, $00, $00, $00, $00, $01, $00, $01, $00, $4C, $FF, $43, $8C, $00

dados_mapa_43:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2E, $52, $98, $A9

dados_mapa_44:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2E, $58, $98, $A9

dados_mapa_45:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2F, $26, $98, $A9

dados_mapa_46:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $2E, $A0, $A9

dados_mapa_47:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $34, $A0, $A9

dados_mapa_48:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $3A, $A0, $A9

dados_mapa_49:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $40, $A0, $A9

dados_mapa_50:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $46, $A0, $A9

dados_mapa_51:
        defb $FF, $09, $00, $00, $00, $00, $01, $00, $01, $00, $4E, $2C, $4C, $A0, $A9

dados_mapa_52:
        defb $FF, $0A, $00, $00, $00, $00, $01, $00, $01, $00, $54, $53, $3D, $64, $00

dados_mapa_53:
        defb $FF, $03, $00, $00, $00, $D8, $EC, $00, $00, $00, $47, $4A, $40, $8C, $20

dados_mapa_54:
        defb $FF, $01, $00, $00, $00, $00, $00, $00, $00, $00, $07, $47, $24, $50, $21

dados_mapa_55:
        defb $FF, $07, $00, $00, $00, $0D, $EB, $00, $00, $00, $47, $51, $40, $90, $22

dados_mapa_56:
        defb $FF, $02, $00, $00, $00, $7A, $EA, $00, $00, $00, $47, $74, $40, $96, $23

dados_mapa_57:
        defb $FF, $04, $00, $00, $00, $00, $00, $00, $00, $00, $47, $2C, $28, $8C, $24

dados_mapa_58:
        defb $FF, $07, $00, $00, $00, $90, $ED, $00, $00, $00, $17, $4D, $3D, $7C, $1D

dados_mapa_59:
        defb $FF, $07, $00, $00, $00, $C4, $EE, $00, $00, $00, $47, $55, $40, $6A, $1E

dados_mapa_60:
        defb $FF, $05, $00, $00, $00, $3C, $F0, $00, $00, $00, $4F, $33, $40, $50, $1F

dados_mapa_61:
        defb $FF, $19, $00, $00, $00, $B1, $F0, $00, $00, $00, $4A, $70, $50, $78, $6E

dados_mapa_62:
        defb $FF, $07, $00, $00, $00, $87, $FA, $AA, $84, $00, $45, $FF, $42, $60, $12

dados_mapa_63:
        defb $FF, $07, $00, $00, $00, $93, $FA, $6E, $85, $00, $45, $FF, $28, $58, $11

dados_mapa_64:
        defb $FF, $07, $00, $00, $00, $B2, $FA, $A1, $87, $00, $46, $53, $40, $38, $05

dados_mapa_65:
        defb $FF, $07, $00, $00, $00, $C7, $FA, $00, $00, $00, $46, $65, $48, $98, $07

dados_mapa_66:
        defb $FF, $07, $00, $00, $00, $D1, $FA, $C0, $84, $00, $42, $39, $48, $58, $10

dados_mapa_67:
        defb $FF, $07, $00, $00, $00, $BD, $FA, $00, $00, $00, $44, $09, $34, $58, $15

dados_mapa_68:
        defb $FF, $07, $00, $00, $00, $DA, $FA, $21, $85, $00, $47, $24, $44, $88, $16

dados_mapa_69:
        defb $FF, $07, $00, $00, $00, $B8, $FA, $21, $85, $00, $44, $FF, $48, $98, $06

dados_mapa_70:
        defb $FF, $08, $00, $00, $00, $9D, $FA, $21, $85, $00, $46, $73, $56, $60, $13

dados_mapa_71:
        defb $FF, $07, $00, $00, $00, $A7, $FA, $21, $85, $00, $44, $4A, $3A, $98, $04

dados_mapa_72:
        defb $FF, $07, $00, $00, $00, $79, $FB, $A1, $87, $00, $45, $FF, $3C, $80, $0D

dados_mapa_73:
        defb $FF, $07, $00, $00, $00, $EF, $FA, $3C, $88, $00, $45, $56, $58, $90, $03

dados_mapa_74:
        defb $FF, $07, $00, $00, $00, $E3, $FA, $3C, $88, $00, $47, $4C, $3C, $90, $02

dados_mapa_75:
        defb $FF, $07, $00, $00, $00, $0A, $FB, $B0, $85, $00, $46, $3A, $3E, $80, $17

dados_mapa_76:
        defb $FF, $07, $00, $00, $00, $20, $FB, $00, $00, $00, $46, $36, $34, $88, $09

dados_mapa_77:
        defb $FF, $07, $00, $00, $00, $35, $FB, $00, $00, $00, $42, $66, $48, $80, $1A

dados_mapa_78:
        defb $FF, $07, $00, $00, $00, $03, $FB, $00, $00, $00, $46, $4B, $4A, $88, $0F

dados_mapa_79:
        defb $FF, $07, $00, $00, $00, $41, $FB, $00, $00, $00, $46, $1E, $48, $88, $0A

dados_mapa_80:
        defb $FF, $07, $00, $00, $00, $FD, $FA, $8D, $84, $00, $42, $4E, $40, $9C, $08

dados_mapa_81:
        defb $FF, $07, $00, $00, $00, $4B, $FB, $EC, $85, $00, $45, $7E, $3B, $68, $01

dados_mapa_82:
        defb $FF, $07, $00, $00, $00, $52, $FB, $D8, $87, $00, $45, $FF, $40, $96, $01

dados_mapa_83:
        defb $FF, $07, $00, $00, $00, $60, $FB, $F4, $87, $00, $44, $54, $52, $90, $0B

dados_mapa_84:
        defb $FF, $07, $00, $00, $00, $13, $FB, $92, $85, $00, $46, $FF, $3C, $88, $14

dados_mapa_85:
        defb $FF, $07, $00, $00, $00, $67, $FB, $10, $85, $00, $46, $FF, $2C, $A0, $0C

dados_mapa_86:
        defb $FF, $07, $00, $00, $00, $6F, $FB, $93, $83, $00, $47, $52, $4A, $80, $19

dados_mapa_87:
        defb $FF, $07, $00, $00, $00, $29, $FB, $00, $00, $00, $42, $4F, $2A, $90, $18

dados_mapa_88:
        defb $FF, $07, $00, $00, $00, $84, $FB, $00, $00, $00, $45, $4F, $26, $90, $0E

dados_mapa_89:
        defb $FF, $07, $00, $00, $00, $91, $FB, $00, $00, $00, $46, $4B, $2E, $40, $C0

dados_mapa_90:
        defb $FF, $07, $00, $00, $00, $91, $FB, $00, $00, $00, $46, $51, $3A, $40, $C0

dados_mapa_91:
        defb $FF, $07, $00, $00, $00, $91, $FB, $00, $00, $00, $46, $6F, $2E, $50, $C0



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
        jp z, L_7B24
        cp $0B
        jp z, L_7AE1
        cp $0F
        jp z, L_7B04
        cp $13
        jp z, L_7AED
        cp $1D
        _if_not c
                cp $27
                jp c, L_7B32
        _end_if
L_7A97:
        ld hl, $8CBD
        ld b, $00

        _do
                ld a, (hl)
                cp $01
                jr z, L_7AC0
                and a
                jr z, L_7AA8
                inc hl
                inc b
        _while_true


L_7AA8:
        _do

                ld a, b
                and a
                jr z, L_7AB3
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
        jp L_9725


L_7AC0:
        dec hl
        ld a, (hl)
        cp $4E
        jr z, L_7AC0
        cp $4D
        jr z, L_7AC0
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
                jp L_96EC
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
        jp nz, L_7A97
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
                jp z, L_A287
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

L_7C2C:
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
        djnz L_7C2C
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
        jr z, L_7F1B
        inc (ix+$09)
        ld hl, $7F1F
        ld e, a
        ld d, $00
        add hl, de
        ld a, (hl)
        ld (ix+$04), a
        jp L_7401


L_7F1B:
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
                jr L_7F8B

        _end_if

        cp $64
        jr nz, L_7F7F
        inc (ix+$09)
        ld a, (ix+$09)
        and $03
        cp $03

        _if_not nz
                ld a, $01
        _end_if


        add a, (ix+$0E)
        ld (ix+$04), a

L_7F7F:
        cp $98
        jr nz, L_7F8B
        ld a, $31
        sub (ix+$04)
        ld (ix+$04), a

L_7F8B:
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
                jr L_82D5
        _end_if

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
        ld a, (ix+$02)
        cp (ix+$05)
        ret z

        _if_not c
                dec (ix+$02)
                dec (ix+$02)
                call L_7401
                jr L_8374

        _end_if

        call L_7401
        inc (ix+$02)
        inc (ix+$02)
        jr L_8374


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

L_83BA:
        push bc
        ld a, (iy+$03)
        and a
        jr z, L_83F0
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

L_83F0:
        pop bc
        ld de, $0004
        add iy, de
        djnz L_83BA
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
        jr nz, L_867A
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


L_867A:
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
                jr L_89C9

        _end_if

        dec a
        add a, e
        ret nc

L_89C9:
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

L_8A60:
        ld a, (nivel)
        cp (ix+$02)
        jr nz, L_8A8A
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

L_8A8A:
        ld de, $0003
        add ix, de
        djnz L_8A60
        ret


L_8A92:
        ld a, $FF
        ld ($8B86), a
        ld b, $00
        ld iy, $8B55
        ld ix, $8A25

L_8AA1:
        push bc
        ld a, b
        cp $08
        jr c, L_8AEB
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

L_8AEB:
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
        jr nz, L_8AA1
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
        jr z, L_8CFC
        dec a
        jr z, L_8CFC
        dec (hl)
        and $07
        ret nz
        dec (hl)
        jr L_8D06


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
        ld bc, $5C64
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

L_8FF3:
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
        jr nz, L_8FF3
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

L_90EC:
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
        jr nz, L_90EC
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

L_9124:
        inc b
        sub $0A
        jr nc, L_9124
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
                jr z, L_913E
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

L_92CD:
        ld a, $28
        call L_92F8
        dec d
        jr nz, L_92CD
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

L_9325:
        ld a, $29
        call L_92DC
        ld a, l
        add a, $08
        ld l, a
        dec d
        jr nz, L_9325
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
        ld ix, $5C64
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

L_9433:
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
        jr nz, L_9433
        ret


L_9445:
        push af
        push bc

L_9447:
        ld bc, ($9D2E)

L_944B:
        ld a, ($9D2F)
        cp b
        jr z, L_944B
        and $03
        jr z, L_9447
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

L_9490:
                call L_7401
                ld a, (ix+$03)
                add a, $08
                ld (ix+$03), a
                cp (ix+$06)
                jr c, L_9490
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
        jp z, L_959B
        ld a, (posicao_atual_index_001)
        ld bc, (nivel)
        sub c
        ld b, a

L_951F:
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
                        jr L_954E ; else
                _end_if

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
L_954E:
        res 7, e
        ld (sprite_left), de
        ld a, (sprites_repetidos)
        and a
        _if_not z
                dec a
                ld (sprites_repetidos), a
                jr L_9565
        _end_if

        ld a, (hl)
        inc hl
        ld (next_sprite_index), a

L_9565:
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
        jr nz, L_951F

L_959B:
        ld a, (posicao_atual_index_001)
        inc a
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

L_95AC:
        ld a, (nivel)
        cp (ix+$02)
        jr nz, L_95CD
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

L_95CD:
        ld de, $0003
        add ix, de
        djnz L_95AC
        ret


L_95D5:
        ld a, $FF
        ld ($9D2A), a
        ld b, $1E
        ld ix, $FFA2
        ld de, $0003

L_95E3:
        res 7, (ix+$02)
        add ix, de
        djnz L_95E3

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
                jr L_963E
        _end_if

        add a, (hl)
        srl a
        ld (hl), a

L_963E:
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

L_9661:
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
                jr L_967C
        _end_if

        ld (hl), c
        inc l
        jr L_967A


L_9677:
        ld (hl), $00
        inc l

L_967A:
        djnz L_9677

L_967C:
        add hl, de
        pop bc
        djnz L_9661
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
                        jr nz, L_96C1
                        ld a, (hl)
                        cp $F0
                _while nz
                inc hl
                jp L_96B8
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
        jr nz, L_97C7
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


L_97C7:
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
                jr z, L_9864
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

L_9976:
        ld a, ($99C1)
        ld b, a

L_997A:
        push hl
        push bc
        ld a, (largura_sprite_a_desenhar)
        rrca
        ld d, a

L_9981:
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

                        jr L_99A1
                _end_if

                ld a, ($99C1)
                add a, (ix)
                ld (ix), a

L_99A1:
                dec e
        
        _while nz
        inc hl
        dec d
        jr nz, L_9981
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
        jr nz, L_9976
        ret


        ; Start of unknown area $99BD to $99C3
        defb $00, $00, $00
        defb $00, $03, $64, $64
        ; End of unknown area $99BD to $99C3


L_99C4:
        ld ix, $5DE4
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

                ld ix, $5DE4
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
        jr nc, L_9A76
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

L_9A48:
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
        djnz L_9A48
        pop bc
        pop ix
        ret


L_9A76:
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
        ld de, $5C64
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
        ld bc, $5C64
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

L_9C8A:
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
        jr nz, L_9C8A
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


        _do
                ld a, (frame_movimento_do_hero)
                and a
                jp z, L_9EAE
                jp L_9F15


                ; Start of unknown area $9E54 to $9E62
                defb $3A, $2F, $9D, $E6, $03, $C0, $21, $44, $5D, $22, $13, $91
                defb $CD, $6A, $9E
                ; End of unknown area $9E54 to $9E62



after_call_force_disassemle_003:

                ld hl, $5800
                ld ($9113), hl
                ret


                ; Start of unknown area $9E6A to $9E6C
                defb $CD, $7B, $9C
                ; End of unknown area $9E6A to $9E6C

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
        _while nc

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
                jr L_9EFB
        _end_if

        ld a, ($9D61)
        cp $01
        _if_not nz
                ld a, $02
                jr L_9EFB
        _end_if

        xor a

L_9EFB:
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
        _if_not z
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
        _end_if
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
        ld de, $5C64
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
                jr L_A1C8
        _end_if

        ld a, e
        cp $30
        jr nc, L_A1DD

L_A1C8:
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

sprites_dos_niveis:
        defb $A0

        ; Start of unknown area $A37C to $C20E
        defb $68, $4A, $BA, $A0
        defb $88, $20, $20, $A8, $B4, $28, $52, $B5, $AF, $A8, $44, $D3, $B6, $A8, $21, $3E
        defb $A8, $46, $A8, $4E, $A8, $56, $A8, $30, $4C, $CD, $AE, $68, $60, $2A, $43, $A2
        defb $B0, $42, $D2, $AA, $B0, $A1, $32, $B0, $3A, $B0, $42, $B0, $4A, $B0, $52, $B0
        defb $5A, $B0, $20, $38, $C8, $A4, $38, $60, $28, $38, $A0, $48, $46, $CB, $26, $40
        defb $CC, $20, $28, $C9, $A4, $28, $60, $28, $28, $2C, $28, $CA, $D8, $30, $C5, $DE
        defb $50, $38, $DD, $58, $4D, $DF, $CB, $40, $C6, $9E, $A2, $60, $47, $C5, $A6, $60
        defb $60, $2A, $60, $42, $76, $F7, $39, $75, $1C, $2A, $9D, $F8, $36, $9C, $F9, $42
        defb $9C, $FA, $4E, $A0, $FB, $56, $9B, $25, $D6, $60, $C7, $E7, $56, $6C, $E4, $5A
        defb $60, $E6, $52, $65, $E8, $C4, $40, $07, $86, $B2, $40, $E0, $4E, $40, $2A, $B0
        defb $28, $40, $3C, $40, $87, $B8, $B0, $E0, $30, $B0, $26, $B0, $34, $B0, $4C, $A8
        defb $F4, $D0, $98, $23, $24, $88, $24, $78, $24, $68, $54, $80, $54, $58, $54, $A8
        defb $50, $A8, $2E, $40, $38, $40, $40, $40, $4A, $40, $24, $58, $54, $90, $F6, $A4
        defb $98, $E0, $54, $68, $24, $40, $54, $40, $D8, $9A, $C7, $E8, $5C, $A2, $E4, $5C
        defb $98, $E6, $D4, $30, $04, $DA, $D0, $30, $E2, $4C, $30, $48, $30, $44, $30, $40
        defb $30, $3C, $30, $38, $30, $34, $30, $30, $30, $2C, $30, $28, $30, $24, $30, $20
        defb $30, $DB, $D8, $30, $84, $DB, $CA, $60, $46, $9F, $AE, $60, $60, $3C, $60, $BA
        defb $8E, $47, $F7, $40, $8D, $1C, $33, $98, $FB, $2C, $9C, $F9, $47, $94, $FA, $54
        defb $9D, $F8, $4E, $9B, $25, $44, $B1, $93, $BC, $AB, $60, $34, $B1, $2A, $38, $E8
        defb $22, $41, $E4, $26, $35, $E7, $A2, $35, $20, $D4, $68, $C2, $B8, $50, $2A, $B5
        defb $DA, $30, $42, $BB, $DA, $50, $A0, $5A, $70, $5A, $90, $22, $B0, $D2, $AA, $B0
        defb $A0, $56, $B0, $4E, $B1, $32, $B0, $8F, $CC, $B0, $20, $B2, $A8, $46, $C5, $B6
        defb $A8, $61, $3A, $A0, $3E, $A0, $42, $A0, $4A, $A8, $46, $A8, $A4, $A8, $44, $D3
        defb $20, $A0, $D5, $4E, $5B, $CD, $CE, $40, $60, $50, $70, $D8, $3A, $C7, $E4, $58
        defb $2D, $E5, $DC, $2D, $20, $54, $33, $E8, $A8, $A0, $02, $82, $D2, $80, $A0, $52
        defb $68, $28, $68, $28, $90, $83, $AE, $78, $22, $34, $78, $28, $80, $52, $A8, $52
        defb $98, $48, $78, $44, $88, $40, $98, $3C, $A8, $4E, $78, $85, $28, $40, $86, $D2
        defb $40, $A0, $28, $60, $52, $60, $2A, $48, $AD, $D4, $48, $20, $CE, $92, $46, $73
        defb $4F, $A0, $AD, $4A, $68, $C0, $CE, $68, $20, $B6, $68, $C6, $C0, $B2, $68, $60
        defb $2E, $68, $B2, $50, $07, $86, $BC, $50, $60, $46, $50, $2E, $60, $87, $4E, $90
        defb $F4, $AE, $50, $21, $44, $A0, $40, $B0, $42, $50, $38, $50, $48, $90, $F5, $4C
        defb $50, $F6, $CC, $A0, $21, $2E, $68, $2E, $80, $2E, $98, $2E, $B0, $22, $8F, $E4
        defb $22, $85, $E6, $26, $83, $E7, $2A, $88, $E8, $B2, $73, $46, $73, $33, $81, $AD
        defb $B0, $30, $C4, $DA, $AC, $40, $24, $32, $40, $36, $30, $36, $40, $3A, $30, $3A
        defb $40, $3E, $30, $3E, $40, $42, $30, $42, $40, $46, $30, $46, $40, $4A, $30, $4A
        defb $40, $4E, $40, $34, $30, $30, $40, $4E, $30, $DB, $D2, $40, $20, $A8, $40, $44
        defb $DB, $AC, $30, $20, $B2, $58, $45, $ED, $BC, $60, $C5, $EA, $46, $58, $ED, $AC
        defb $A8, $07, $F4, $AC, $98, $63, $30, $30, $34, $30, $38, $30, $3C, $30, $4C, $60
        defb $4C, $50, $30, $80, $34, $90, $38, $A0, $3C, $B0, $48, $48, $44, $58, $40, $68
        defb $2A, $70, $F5, $2C, $80, $F6, $AC, $30, $61, $4C, $A0, $4C, $88, $4C, $70, $4C
        defb $38, $4C, $20, $C7, $92, $46, $73, $48, $A0, $AD, $B0, $7A, $45, $F2, $40, $78
        defb $F3, $30, $40, $EE, $B7, $40, $20, $36, $50, $EA, $A9, $58, $02, $82, $AA, $88
        defb $A0, $4F, $58, $4E, $88, $51, $3F, $84, $C9, $3F, $A1, $31, $3F, $29, $3F, $41
        defb $3F, $39, $3F, $2E, $B0, $4E, $B0, $2C, $A0, $85, $CC, $A0, $20, $46, $A0, $86
        defb $B2, $B0, $20, $4D, $4F, $87, $C5, $4F, $A1, $3D, $4F, $30, $A8, $35, $4F, $2D
        defb $4F, $38, $B0, $3C, $B0, $2A, $70, $AD, $D1, $70, $20, $B4, $70, $42, $9F, $C6
        defb $70, $20, $DB, $60, $C7, $E4, $5A, $53, $E5, $57, $59, $E8, $BB, $5D, $44, $AA
        defb $BF, $5D, $C4, $AA, $D2, $30, $02, $82, $2C, $A0, $83, $2A, $30, $84, $AA, $88
        defb $21, $2A, $48, $32, $A0, $5A, $80, $54, $A8, $5A, $48, $85, $48, $48, $86, $CE
        defb $48, $E3, $54, $48, $34, $58, $2A, $60, $38, $60, $3C, $68, $40, $70, $44, $78
        defb $2A, $80, $56, $98, $58, $58, $58, $78, $36, $A0, $3C, $A0, $54, $A0, $4C, $B0
        defb $50, $A8, $87, $AE, $50, $60, $32, $50, $2A, $68, $AD, $DB, $60, $20, $A4, $57
        defb $47, $E8, $20, $51, $E7, $1D, $5D, $E4, $B2, $80, $46, $AD, $BB, $80, $20, $3A
        defb $72, $73, $B1, $72, $20, $2E, $40, $C0, $B2, $40, $C6, $C0, $B6, $48, $21, $3A
        defb $50, $3E, $58, $42, $60, $46, $68, $B8, $98, $4A, $B6, $D4, $4E, $20, $38, $4A
        defb $B7, $54, $A2, $B8, $A6, $81, $CA, $B5, $C4, $60, $20, $46, $30, $B7, $2A, $58
        defb $B8, $A6, $43, $4C, $CD, $A4, $54, $A5, $40, $28, $35, $32, $54, $3B, $5B, $67
        defb $5A, $45, $58, $A8, $52, $70, $40, $6D, $42, $90, $22, $79, $24, $90, $35, $73
        defb $2B, $A8, $2A, $28, $4B, $9D, $4A, $8C, $42, $4B, $52, $89, $5A, $95, $51, $29
        defb $26, $61, $3D, $58, $38, $88, $CE, $B7, $5A, $A0, $2C, $48, $2A, $77, $CE, $30
        defb $42, $BB, $CE, $50, $A0, $4E, $78, $4E, $98, $30, $30, $BA, $B0, $50, $A0, $30
        defb $70, $30, $98, $CA, $A8, $07, $C5, $C4, $80, $63, $42, $A8, $46, $A8, $34, $48
        defb $38, $48, $3C, $48, $34, $90, $30, $90, $2C, $90, $4C, $70, $50, $70, $54, $70
        defb $58, $68, $48, $78, $C4, $70, $46, $C0, $C8, $68, $E1, $4C, $60, $50, $60, $54
        defb $60, $58, $58, $2C, $80, $30, $80, $34, $80, $4A, $50, $AD, $49, $42, $73, $B8
        defb $88, $46, $83, $BE, $88, $20, $3E, $B0, $BD, $3A, $68, $BE, $36, $B0, $BF, $36
        defb $A0, $C6, $BE, $A0, $60, $3A, $58, $3A, $78, $C7, $35, $78, $AD, $C5, $78, $20
        defb $34, $6B, $73, $C4, $6B, $20, $BC, $40, $C6, $BC, $BC, $30, $20, $3A, $B0, $BE
        defb $42, $B0, $BF, $BE, $68, $20, $3A, $A0, $C6, $C2, $A0, $20, $3E, $78, $C7, $3E
        defb $58, $C6, $B4, $98, $02, $C5, $B8, $98, $E0, $3C, $98, $40, $98, $44, $98, $9F
        defb $6F, $42, $B8, $D8, $5D, $47, $E4, $58, $50, $E5, $5C, $53, $E6, $32, $36, $E8
        defb $2A, $40, $E4, $2E, $36, $E6, $2A, $33, $E5, $D4, $56, $C7, $E8, $A6, $39, $20
        defb $9F, $4E, $4C, $CD, $A4, $65, $60, $1F, $A5, $A9, $58, $42, $D3, $B0, $50, $17
        defb $91, $2D, $60, $8B, $29, $64, $8E, $2B, $5C, $8F, $A4, $50, $97, $91, $D8, $A0
        defb $06, $82, $D8, $30, $A0, $22, $30, $22, $A0, $28, $A0, $83, $D2, $A0, $22, $28
        defb $30, $2E, $30, $34, $30, $3A, $30, $40, $30, $46, $30, $4C, $30, $52, $30, $5A
        defb $48, $84, $DA, $60, $E0, $22, $48, $22, $60, $22, $78, $22, $90, $85, $3A, $60
        defb $86, $C0, $60, $A0, $2E, $80, $4C, $80, $B8, $A0, $45, $A9, $B6, $A0, $A2, $32
        defb $A0, $30, $A0, $3C, $A0, $3E, $A0, $42, $A0, $44, $A0, $48, $A0, $4A, $A0, $4E
        defb $A0, $50, $A0, $AE, $B0, $05, $F0, $B4, $B0, $A1, $3A, $B0, $40, $B0, $46, $B0
        defb $4C, $B0, $52, $B0, $28, $B0, $D8, $A0, $07, $82, $A2, $A0, $A0, $26, $30, $54
        defb $30, $2C, $30, $83, $B2, $30, $21, $38, $30, $3E, $30, $44, $30, $4A, $30, $22
        defb $60, $84, $A2, $48, $E0, $22, $30, $5A, $30, $5A, $48, $5A, $90, $85, $D0, $30
        defb $20, $28, $B0, $9D, $B4, $B0, $A0, $40, $B0, $4C, $B0, $AE, $B0, $02, $9D, $BA
        defb $B0, $A0, $46, $B0, $52, $B0, $AE, $50, $46, $AD, $D0, $50, $20, $4F, $42, $73
        defb $AD, $42, $20, $DB, $60, $45, $7B, $AC, $A0, $07, $F1, $2C, $48, $F4, $BA, $48
        defb $21, $36, $48, $40, $88, $48, $68, $44, $78, $30, $48, $F5, $AC, $90, $61, $2C
        defb $38, $2C, $28, $58, $A8, $52, $A8, $4C, $A8, $4C, $78, $F6, $CC, $60, $E0, $4C
        defb $48, $4C, $30, $4C, $90, $2C, $58, $86, $B0, $60, $C5, $7B, $C8, $A8, $46, $AD
        defb $47, $9A, $73, $B2, $58, $45, $ED, $B8, $58, $20, $40, $98, $F3, $50, $98, $A9
        defb $D4, $98, $E0, $56, $98, $5A, $98, $5C, $98, $AC, $60, $47, $F6, $AC, $78, $20
        defb $1F, $60, $E4, $22, $56, $E6, $26, $58, $E8, $CA, $A0, $07, $86, $CA, $80, $E0
        defb $2C, $A8, $26, $A8, $30, $A0, $4C, $60, $87, $AE, $B0, $21, $2A, $B0, $26, $B0
        defb $2C, $90, $2C, $88, $36, $A0, $F1, $4C, $A8, $F4, $CC, $50, $A3, $4C, $40, $4C
        defb $30, $32, $A8, $22, $A8, $2C, $98, $36, $30, $3A, $3F, $48, $50, $44, $60, $40
        defb $70, $30, $80, $34, $90, $3C, $B0, $30, $90, $4C, $68, $F6, $AC, $70, $E0, $2C
        defb $58, $2C, $40, $2C, $28, $4D, $88, $AD, $B2, $58, $46, $AD, $C6, $98, $20, $45
        defb $8A, $73, $B1, $4A, $20, $BA, $50, $45, $F3, $BA, $50, $60, $40, $80, $30, $7A
        defb $F2, $22, $98, $A9, $A4, $98, $A0, $28, $98, $2A, $98, $D7, $75, $C7, $E4, $57
        defb $6B, $E6, $5B, $69, $E7, $53, $6D, $E8, $CE, $65, $52, $B5, $4E, $A2, $B7, $4E
        defb $2F, $B6, $A2, $98, $D2, $B6, $3C, $70, $B5, $B8, $6F, $4C, $CD, $BA, $88, $A2
        defb $56, $2C, $39, $A4, $27, $71, $1E, $93, $56, $61, $27, $83, $56, $98, $52, $38
        defb $52, $5B, $54, $A8, $42, $70, $CE, $D3, $90, $E0, $21, $86, $4E, $68, $55, $78
        defb $C6, $98, $42, $BA, $C6, $70, $A0, $46, $50, $46, $30, $2C, $78, $BB, $AC, $98
        defb $20, $34, $48, $C8, $B0, $48, $E0, $2C, $48, $28, $48, $38, $48, $B0, $58, $46
        defb $CB, $2A, $50, $CC, $B6, $50, $20, $38, $30, $C9, $B4, $30, $60, $30, $30, $3C
        defb $30, $CA, $35, $88, $AD, $34, $7A, $73, $4A, $88, $C0, $C6, $90, $60, $42, $98
        defb $CE, $88, $C6, $C0, $A8, $90, $21, $2C, $98, $30, $A0, $34, $A8, $38, $B0, $2C
        defb $30, $C9, $A8, $30, $20, $26, $30, $CA, $BC, $70, $07, $C5, $C0, $70, $24, $38
        defb $70, $44, $70, $34, $70, $30, $70, $46, $A0, $4E, $98, $4A, $98, $42, $A8, $2C
        defb $70, $28, $70, $2C, $A8, $30, $B0, $28, $A0, $48, $68, $4C, $68, $50, $60, $AE
        defb $7E, $4A, $B5, $C6, $6E, $20, $34, $7E, $B6, $2E, $36, $B7, $A2, $88, $CA, $B8
        defb $A2, $AE, $20, $36, $58, $B6, $CC, $80, $4C, $CD, $D0, $6B, $A2, $3A, $43, $39
        defb $6B, $34, $94, $34, $2A, $34, $43, $32, $60, $1F, $73, $24, $4F, $22, $2D, $46
        defb $A2, $22, $A0, $CE, $AE, $80, $E0, $4D, $60, $46, $70, $3C, $81, $A8, $98, $42
        defb $BB, $A8, $78, $A1, $40, $98, $40, $70, $40, $50, $40, $30, $28, $50, $28, $30
        defb $AF, $42, $46, $73, $30, $50, $AD, $26, $68, $C0, $B6, $A0, $E1, $2E, $B0, $32
        defb $A8, $4A, $90, $46, $90, $42, $90, $3A, $98, $3E, $90, $AA, $68, $C6, $C0, $AE
        defb $68, $A0, $32, $68, $4E, $90, $C0, $48, $07, $C5, $CC, $50, $63, $48, $50, $44
        defb $50, $32, $78, $2E, $78, $26, $78, $36, $B0, $2A, $78, $3A, $A8, $3E, $A0, $42
        defb $A0, $46, $A0, $4A, $A0, $4E, $A0, $CE, $30, $02, $82, $AD, $30, $A0, $30, $78
        defb $3C, $A0, $34, $90, $83, $CE, $48, $A0, $50, $58, $2D, $68, $5A, $58, $84, $56
        defb $58, $85, $B8, $A0, $20, $54, $68, $86, $D4, $B0, $A2, $4E, $B0, $48, $B0, $42
        defb $B0, $5A, $B0, $38, $30, $46, $50, $42, $58, $4E, $68, $3E, $60, $2D, $60, $4A
        defb $48, $87, $C2, $A8, $A0, $3A, $98, $36, $88, $AF, $48, $42, $AD, $58, $80, $9F
        defb $C4, $80, $20, $CC, $8D, $55, $A6, $50, $7D, $A8, $CA, $38, $46, $C0, $C6, $40
        defb $A0, $42, $48, $3E, $50, $B8, $40, $C7, $AA, $B4, $40, $47, $AA, $1F, $3D, $E4
        defb $22, $33, $E6, $26, $35, $E8, $B4, $68, $46, $9F, $BC, $68, $A0, $44, $68, $4C
        defb $68, $32, $90, $AD, $B8, $90, $A0, $49, $60, $39, $60, $38, $52, $73, $C8, $52
        defb $20, $56, $68, $C0, $D2, $68, $20, $24, $30, $DB, $38, $30, $DA, $BC, $30, $22
        defb $40, $30, $44, $30, $48, $30, $4C, $30, $50, $30, $54, $30, $58, $30, $5C, $30
        defb $CB, $A1, $4D, $C2, $C3, $A1, $60, $53, $A1, $56, $98, $AD, $C6, $98, $60, $4E
        defb $98, $B7, $A8, $05, $9D, $B1, $A8, $60, $2F, $A8, $2C, $48, $13, $B3, $98, $02
        defb $9D, $28, $28, $84, $B4, $28, $A0, $28, $50, $22, $58, $48, $40, $85, $B4, $40
        defb $A1, $28, $40, $3E, $40, $52, $40, $5C, $40, $56, $78, $52, $78, $38, $40, $86
        defb $C2, $40, $E2, $4C, $40, $56, $40, $22, $B0, $2C, $B0, $32, $B0, $38, $B0, $46
        defb $B0, $4C, $B0, $56, $B0, $26, $68, $2C, $68, $28, $B0, $87, $BE, $B0, $E0, $42
        defb $B0, $52, $B0, $5C, $B0, $AC, $30, $47, $B2, $AC, $38, $60, $2C, $40, $B2, $20
        defb $02, $84, $D4, $20, $A0, $32, $38, $54, $38, $28, $40, $85, $22, $B0, $86, $A8
        defb $B0, $E4, $2E, $B0, $38, $B0, $42, $B0, $48, $B0, $5A, $B0, $2E, $78, $38, $78
        defb $3E, $78, $44, $78, $4A, $78, $50, $78, $2C, $40, $22, $40, $5C, $50, $56, $50
        defb $4C, $40, $48, $48, $44, $50, $40, $58, $50, $38, $87, $AA, $78, $21, $34, $78
        defb $3E, $B0, $34, $B0, $4E, $B0, $BC, $60, $42, $86, $2E, $50, $9F, $B8, $50, $60
        defb $24, $50, $A2, $30, $46, $DA, $A6, $30, $A1, $2A, $30, $2E, $30, $58, $30, $5C
        defb $30, $58, $40, $5C, $40, $4D, $A2, $C1, $CE, $A2, $C6, $C2, $52, $A5, $C3, $D6
        defb $AD, $20, $BC, $40, $47, $AD, $3B, $32, $73, $42, $68, $C0, $BE, $68, $61, $3A
        defb $68, $36, $68, $32, $68, $2E, $68, $2A, $68, $D2, $68, $C7, $C0, $CE, $68, $A0
        defb $4A, $68, $46, $68, $D4, $80, $45, $AA, $D8, $80, $C5, $AA, $C0, $68, $02, $83
        defb $BC, $A8, $20, $42, $50, $84, $C2, $98, $20, $38, $50, $85, $A0, $50, $A0, $24
        defb $50, $2E, $50, $3C, $50, $86, $B2, $50, $61, $40, $90, $22, $B0, $28, $50, $28
        defb $B0, $32, $B0, $2E, $B0, $87, $B8, $B0, $20, $C2, $78, $C2, $AD, $A2, $30, $46
        defb $DA, $A6, $30, $E3, $2A, $30, $2E, $30, $32, $30, $2E, $40, $2A, $40, $26, $40
        defb $22, $40, $36, $40, $32, $40, $3A, $40, $3E, $40, $42, $40, $3E, $30, $3A, $30
        defb $36, $30, $C2, $30, $C6, $DB, $C6, $40, $20, $B5, $98, $05, $8E, $2D, $9E, $7E
        defb $A8, $9E, $20, $CF, $78, $47, $E4, $D3, $78, $20, $4F, $6B, $E5, $D3, $6B, $20
        defb $57, $6C, $E7, $5B, $70, $E8, $CB, $6F, $C7, $E8, $38, $80, $7B, $A8, $80, $47
        defb $7B, $A8, $A0, $07, $9D, $AE, $A0, $21, $34, $A0, $28, $78, $2E, $78, $34, $78
        defb $A5, $92, $47, $E4, $AC, $92, $E1, $39, $70, $3F, $70, $43, $70, $52, $8B, $56
        defb $8B, $2A, $4D, $4D, $45, $26, $88, $E6, $BE, $67, $60, $46, $67, $3A, $64, $E7
        defb $C2, $65, $20, $32, $88, $E8, $CB, $66, $A0, $54, $3B, $32, $44, $AA, $88, $C7
        defb $E6, $D7, $82, $A0, $5B, $82, $4D, $3B, $2E, $86, $E7, $D3, $7F, $21, $50, $39
        defb $48, $65, $2E, $41, $2A, $41, $36, $66, $E8, $A2, $88, $E0, $49, $3B, $26, $44
        defb $4F, $83, $DA, $A3, $4C, $CD, $DA, $68, $A0, $58, $55, $5B, $47, $C3, $A0, $06
        defb $DA, $BF, $A0, $A1, $3B, $A0, $47, $B0, $43, $B0, $3F, $B0, $3B, $B0, $37, $B0
        defb $37, $A0, $DB, $B3, $B0, $20, $CB, $B0, $86, $DB, $C7, $A0, $20, $B8, $4E, $4A
        defb $B7, $54, $3A, $B5, $38, $85, $B6, $D4, $AA, $20, $C8, $3A, $CA, $B8, $AA, $50
        defb $20, $26, $7E, $B5, $44, $6D, $B6, $A6, $58, $4C, $CD, $A6, $3B, $E4, $38, $3B
        defb $42, $78, $38, $70, $36, $98, $2A, $78, $2A, $AF, $24, $98, $52, $28, $46, $84
        defb $4A, $82, $51, $7C, $52, $3B, $5C, $9D, $5C, $9D, $5A, $B0, $27, $6A, $5A, $50
        defb $20, $7B, $20, $7B, $42, $63, $CE, $A9, $2C, $A1, $46, $40, $5C, $30, $44, $30
        defb $3E, $50, $24, $70, $3B, $AC, $CE, $30, $42, $BB, $CE, $50, $A0, $4E, $70, $4E
        defb $98, $30, $18, $BA, $B0, $38, $E0, $30, $58, $30, $78, $30, $98, $AE, $48, $07
        defb $C5, $B2, $48, $A4, $2A, $48, $40, $60, $44, $60, $44, $60, $48, $60, $3C, $68
        defb $38, $68, $2A, $88, $2E, $88, $32, $88, $36, $88, $3A, $90, $3E, $90, $46, $B0
        defb $4A, $A8, $4E, $A0, $52, $98, $56, $98, $D7, $70, $46, $AD, $D7, $70, $20, $56
        defb $62, $73, $52, $88, $C0, $CE, $90, $A1, $4A, $98, $46, $A0, $42, $A8, $3E, $B0
        defb $2E, $38, $2A, $38, $D6, $88, $C6, $C0, $B2, $38, $20, $C4, $A0, $46, $86, $BE
        defb $A0, $A0, $38, $A0, $32, $A0, $3E, $80, $BD, $3E, $60, $BE, $B6, $80, $20, $36
        defb $60, $BF, $36, $70, $C4, $BE, $70, $20, $36, $A8, $C6, $BE, $A8, $21, $36, $50
        defb $3E, $50, $36, $28, $3E, $28, $3E, $90, $C7, $B6, $90, $A0, $36, $38, $3E, $38
        defb $B2, $48, $C6, $86, $B8, $48, $A0, $3E, $48, $44, $48, $32, $88, $BC, $B2, $78
        defb $21, $32, $68, $46, $88, $46, $78, $46, $68, $42, $60, $BE, $BA, $60, $60, $3A
        defb $80, $42, $80, $BF, $3A, $70, $C4, $C2, $70, $20, $3A, $A8, $C6, $C2, $A8, $21
        defb $3A, $50, $42, $50, $42, $28, $3A, $28, $42, $90, $C7, $BA, $90, $A0, $3A, $38
        defb $42, $38, $D4, $7E, $47, $E4, $A7, $61, $20, $54, $74, $E5, $27, $57, $E6, $D8
        defb $74, $20, $2B, $55, $E7, $2F, $59, $E8, $DC, $78, $20, $A3, $59, $C7, $E8, $D0
        defb $78, $20, $A0, $9C, $4C, $CD, $A2, $8A, $60, $21, $2C, $AE, $A0, $4A, $B5, $2E
        defb $70, $B7, $2E, $46, $B6, $9E, $96, $CA, $B6, $1E, $4D, $B5, $20, $31, $B7, $B6
        defb $A0, $54, $CD, $B2, $90, $A2, $22, $83, $36, $70, $34, $5B, $2C, $5A, $36, $40
        defb $2E, $33, $20, $38, $24, $4B, $30, $78, $20, $AB, $2E, $A0, $CE, $A8, $98, $42
        defb $BB, $A8, $78, $E0, $28, $58, $28, $38, $28, $18, $DA, $97, $0F, $88, $44, $B0
        defb $89, $5A, $88, $8B, $50, $B0, $8C, $D7, $B1, $20, $D4, $A8, $8F, $8C, $DA, $A8
        defb $0F, $8D, $D0, $A0, $20, $54, $91, $91, $48, $A8, $93, $BE, $68, $47, $E4, $C4
        defb $69, $60, $53, $47, $46, $5C, $E5, $C2, $5E, $20, $3E, $5E, $E6, $D7, $3E, $20
        defb $4A, $64, $E8, $DB, $41, $20, $53, $3A, $E5, $22, $40, $C5, $A6, $48, $A0, $2A
        defb $50, $2E, $50, $BA, $61, $C7, $E8, $CF, $41, $20, $D8, $97, $0F, $88, $AA, $97
        defb $62, $34, $B3, $5C, $90, $25, $93, $20, $80, $2A, $88, $52, $B5, $27, $89, $4F
        defb $AB, $57, $B2, $21, $A1, $89, $D6, $80, $21, $24, $88, $56, $A8, $54, $88, $54
        defb $B0, $B0, $A8, $8F, $8A, $A2, $90, $0F, $8A, $DB, $80, $20, $21, $AA, $8B, $2E
        defb $96, $8C, $D8, $88, $20, $25, $80, $8E, $D2, $A8, $20, $25, $A3, $90, $2A, $A5
        defb $91, $D2, $90, $A0, $4A, $B5, $5A, $A0, $B2, $A0, $42, $5B, $BA, $A0, $A0, $42
        defb $A0, $4A, $A0, $D5, $8B, $0F, $88, $A0, $88, $E0, $24, $87, $36, $40, $24, $9C
        defb $22, $80, $89, $A2, $97, $60, $3E, $B0, $37, $31, $8A, $BD, $62, $E0, $39, $3A
        defb $36, $A0, $44, $6D, $58, $94, $8B, $C1, $66, $21, $34, $98, $5B, $9E, $5C, $AF
        defb $53, $80, $47, $75, $8C, $4F, $79, $8D, $B4, $AE, $E0, $2B, $B0, $21, $B0, $21
        defb $A0, $4B, $7D, $8E, $42, $B0, $90, $AA, $98, $20, $34, $50, $91, $DC, $86, $A1
        defb $45, $54, $4A, $43, $3A, $40, $38, $A8, $25, $A6, $2F, $A0, $46, $32, $92, $DA
        defb $53, $61, $55, $45, $3B, $28, $3F, $38, $57, $7C, $43, $44, $49, $6A, $93, $D3
        defb $5C, $E0, $53, $5C, $57, $6C, $53, $5C, $A7, $90, $8F, $88, $30, $98, $89, $3A
        defb $58, $8A, $56, $27, $90, $D0, $22, $60, $5C, $22, $3F, $4E, $91, $CB, $29, $E0
        defb $5A, $39, $41, $23, $51, $6A, $50, $49, $92, $4A, $5A, $93, $D0, $39, $20, $C8
        defb $A8, $17, $86, $C8, $B0, $20, $4E, $A8, $F4, $C4, $A8, $61, $40, $A8, $24, $68
        defb $22, $78, $2C, $60, $30, $60, $58, $A8, $F5, $D2, $A8, $23, $3A, $A8, $34, $A8
        defb $34, $60, $3A, $60, $40, $60, $46, $60, $4C, $60, $52, $60, $58, $60, $58, $30
        defb $52, $30, $4C, $30, $22, $88, $F6, $A2, $A0, $E0, $28, $58, $2C, $48, $2C, $30
        defb $B6, $48, $53, $AD, $C0, $48, $20, $B6, $48, $03, $9D, $BC, $48, $20, $CE, $40
        defb $55, $ED, $50, $40, $EE, $B2, $70, $20, $28, $70, $EC, $46, $70, $EF, $AC, $70
        defb $D5, $ED, $29, $88, $EB, $BE, $88, $46, $13, $D3, $88, $20, $53, $7B, $73, $BE
        defb $7B, $20, $D0, $A0, $17, $86, $D0, $A8, $21, $40, $A0, $3C, $68, $47, $48, $56
        defb $90, $28, $A8, $87, $A4, $A8, $60, $20, $A8, $20, $B0, $F1, $D8, $68, $E1, $52
        defb $78, $4C, $88, $46, $98, $58, $30, $52, $30, $4C, $30, $5A, $98, $32, $A8, $F4
        defb $CC, $B0, $22, $50, $B0, $54, $B0, $58, $B0, $5C, $B0, $36, $A8, $4C, $A0, $52
        defb $90, $58, $80, $3A, $A8, $F5, $C0, $A8, $23, $46, $B0, $26, $B0, $2C, $A8, $36
        defb $60, $30, $60, $2A, $60, $24, $60, $1E, $60, $1E, $30, $24, $30, $2A, $30, $30
        defb $30, $56, $98, $F6, $DC, $80, $20, $C1, $50, $57, $F5, $47, $50, $86, $BC, $60
        defb $20, $A4, $70, $55, $EC, $2E, $70, $EE, $B6, $70, $20, $2E, $80, $EA, $4E, $48
        defb $EF, $21, $A2, $F2, $BC, $A2, $20, $D6, $B0, $0A, $D2, $CE, $B0, $A1, $46, $B0
        defb $3E, $B0, $3E, $A8, $46, $A8, $4E, $A8, $56, $A8, $CE, $59, $CA, $B5, $4E, $3A
        defb $B6, $BE, $A0, $54, $D3, $C6, $A0, $A0, $4E, $A0, $56, $A0, $4C, $70, $CD, $C8
        defb $58, $21, $4C, $4B, $54, $5B, $48, $30, $4A, $40, $D8, $88, $42, $BA, $D8, $68
        defb $A0, $58, $48, $58, $28, $D2, $28, $C6, $C0, $D6, $30, $60, $5A, $38, $B4, $B0
        defb $07, $86, $A2, $98, $20, $26, $A0, $87, $38, $98, $F1, $B2, $88, $A1, $2C, $78
        defb $26, $68, $20, $68, $20, $30, $26, $30, $2A, $A0, $2E, $90, $F4, $B4, $A0, $E0
        defb $3A, $AF, $26, $A8, $28, $80, $28, $90, $F5, $30, $A0, $F6, $A4, $80, $A0, $22
        defb $A0, $20, $80, $C2, $3A, $47, $E8, $3E, $38, $E6, $BA, $38, $20, $36, $36, $E7
        defb $B2, $39, $C7, $E8, $3C, $42, $E4, $B5, $42, $20, $5A, $48, $C5, $D6, $40, $60
        defb $52, $38, $A2, $B0, $12, $D2, $AA, $B0, $21, $32, $B0, $22, $A8, $2A, $A8, $32
        defb $A8, $38, $98, $8D, $3A, $80, $91, $47, $78, $7B, $C9, $78, $92, $7B, $3E, $93
        defb $91, $46, $A8, $93, $4E, $B0, $91, $42, $A9, $8D, $3E, $AB, $8C, $39, $A9, $8A
        defb $BC, $A1, $20, $A6, $60, $4A, $B6, $26, $3D, $B7, $A0, $A0, $4C, $D3, $A8, $A0
        defb $60, $30, $A0, $26, $29, $CD, $AC, $30, $21, $26, $4B, $30, $58, $2C, $68, $2C
        defb $3F, $9E, $88, $42, $BA, $9E, $68, $A0, $1E, $48, $1E, $28, $A0, $48, $47, $C5
        defb $A4, $50, $20, $3E, $64, $C2, $C2, $64, $A1, $46, $64, $4A, $64, $4E, $64, $52
        defb $64, $56, $64, $5A, $64, $36, $6F, $C3, $BA, $67, $21, $32, $78, $2E, $80, $2A
        defb $88, $26, $90, $4B, $3E, $E4, $C6, $3D, $20, $4E, $31, $E5, $C6, $30, $20, $4A
        defb $33, $E6, $52, $35, $E8, $C2, $34, $C7, $E8, $BA, $78, $06, $C5, $BE, $70, $23
        defb $42, $70, $46, $70, $4A, $70, $4E, $70, $52, $70, $56, $70, $5A, $70, $36, $80
        defb $32, $88, $2E, $90, $2A, $98, $26, $A0, $24, $40, $C0, $A0, $38, $20, $C0, $88
        defb $45, $5B, $DA, $88, $A0, $52, $88, $4A, $88, $C2, $A2, $92, $8B, $CF, $8A, $20
        defb $3A, $AA, $8C, $43, $81, $8D, $56, $91, $8F, $3E, $82, $91, $C8, $A1, $A0, $5B
        defb $A0, $4A, $8E, $44, $8F, $92, $3B, $99, $93, $CE, $AD, $60, $58, $90, $2D, $78
        defb $7B, $AB, $78, $12, $7B, $56, $80, $D2, $CE, $80, $21, $46, $88, $46, $80, $4E
        defb $88, $56, $88, $45, $AD, $8C, $3E, $AC, $90, $D5, $A0, $20, $35, $9E, $91, $A2
        defb $AF, $60, $50, $95, $2F, $A1, $92, $28, $A9, $93, $C2, $68, $C7, $C3, $3E, $64
        defb $C2, $BA, $64, $A1, $36, $64, $32, $64, $2E, $64, $2A, $64, $26, $64, $22, $64
        defb $C2, $78, $06, $C5, $BE, $70, $E1, $3A, $70, $36, $70, $32, $70, $2E, $70, $2A
        defb $70, $26, $70, $22, $70, $A4, $88, $45, $5B, $9C, $88, $A0, $2E, $88, $36, $88
        defb $DA, $70, $46, $C0, $D6, $70, $20, $C6, $78, $54, $D3, $CE, $78, $20, $5A, $39
        defb $CD, $D9, $26, $20, $BC, $42, $CA, $B5, $A2, $39, $20, $B2, $5F, $4A, $B6, $4E
        defb $46, $B5, $A0, $2B, $4C, $CD, $BE, $30, $E1, $4B, $2D, $58, $45, $32, $4B, $54
        defb $60, $38, $4B, $20, $50, $54, $33, $4E, $48, $CE, $A9, $38, $20, $3A, $A0, $D3
        defb $C6, $88, $42, $BA, $C6, $68, $A0, $46, $48, $46, $28, $2C, $70, $BB, $AC, $50
        defb $60, $2C, $30, $BA, $A8, $12, $D2, $C2, $A8, $A0, $3A, $B0, $42, $B0, $31, $9F
        defb $8B, $50, $AE, $8D, $4A, $A9, $92, $29, $98, $93, $27, $8F, $8A, $20, $88, $93
        defb $4E, $A0, $8C, $56, $90, $8F, $51, $98, $93, $59, $9F, $90, $58, $87, $91, $A0
        defb $98, $20, $A3, $AC, $92, $90, $26, $9E, $8A, $29, $AB, $8B, $2B, $8F, $8F, $2C
        defb $AC, $93, $54, $A8, $91, $B4, $A7, $20, $DA, $80, $02, $87, $D6, $88, $62, $52
        defb $90, $4E, $98, $4A, $A0, $36, $A0, $32, $98, $2E, $90, $2A, $88, $26, $80, $22
        defb $80, $BC, $78, $46, $AD, $3B, $6A, $73, $5A, $70, $C0, $D6, $78, $E0, $52, $80
        defb $4E, $88, $4A, $90, $A2, $70, $C6, $C0, $A6, $70, $63, $2A, $78, $2E, $80, $32
        defb $88, $36, $90, $2C, $28, $30, $30, $34, $38, $38, $38, $3C, $38, $40, $40, $44
        defb $40, $48, $40, $4C, $40, $A8, $30, $07, $C5, $AC, $38, $22, $30, $40, $34, $48
        defb $3C, $48, $38, $48, $40, $50, $44, $50, $48, $50, $4C, $50, $3E, $98, $C6, $C2
        defb $98, $87, $C6, $C6, $48, $52, $B5, $3E, $A0, $B4, $2E, $60, $B6, $A2, $38, $D2
        defb $B8, $AC, $28, $4C, $CD, $B8, $55, $61, $1E, $30, $1E, $40, $4C, $60, $4E, $40
        defb $3A, $32, $4E, $52, $CE, $B0, $50, $20, $32, $98, $D3, $C9, $A0, $A0, $51, $A0
        defb $58, $A0, $C0, $20, $42, $BB, $A8, $70, $61, $40, $40, $40, $80, $40, $60, $28
        defb $50, $28, $30, $AF, $AD, $12, $8C, $25, $A0, $8D, $28, $96, $8E, $A4, $B0, $20
        defb $1F, $9E, $90, $B9, $A1, $20, $33, $A8, $91, $29, $9E, $93, $A9, $AE, $92, $91
        defb $A2, $88, $20, $A2, $81, $02, $87, $A6, $88, $A0, $2A, $90, $2E, $98, $32, $A0
        defb $D2, $BF, $B0, $E1, $3F, $A8, $47, $B0, $47, $A8, $4F, $B0, $4F, $A8, $57, $B0
        defb $57, $A8, $A2, $70, $C6, $C0, $A6, $78, $A0, $2A, $80, $2E, $88, $A6, $40, $46
        defb $C0, $AA, $40, $E0, $32, $38, $36, $30, $3A, $28, $3A, $88, $AD, $39, $7A, $73
        defb $A6, $50, $07, $C5, $AA, $50, $61, $2E, $50, $32, $48, $36, $40, $3A, $38, $3E
        defb $30, $C4, $90, $47, $82, $A2, $B0, $02, $D2, $A2, $A8, $20, $58, $A0, $82, $DA
        defb $48, $60, $4C, $30, $52, $A8, $83, $C6, $30, $E0, $54, $48, $58, $38, $52, $38
        defb $52, $A0, $86, $C0, $30, $21, $56, $30, $5C, $30, $54, $58, $4E, $48, $42, $38
        defb $87, $C8, $40, $E0, $44, $40, $52, $30, $50, $50, $A2, $A0, $44, $D3, $AA, $A8
        defb $45, $5B, $B2, $A8, $E0, $3A, $A8, $42, $A8, $4A, $A8, $AC, $59, $47, $E4, $B4
        defb $59, $20, $2C, $4C, $E5, $30, $4F, $E6, $34, $4D, $E7, $38, $4C, $E5, $3C, $52
        defb $E8, $A8, $52, $C7, $E8, $A2, $A0, $02, $82, $D2, $30, $60, $28, $30, $22, $40
        defb $83, $D8, $30, $A0, $58, $40, $22, $30, $5A, $68, $84, $A2, $50, $60, $5A, $50
        defb $28, $A8, $85, $2C, $B0, $86, $B6, $B0, $22, $3C, $B0, $46, $B0, $54, $B0, $5A
        defb $B0, $2E, $30, $34, $30, $48, $30, $3E, $30, $32, $B0, $87, $C2, $B0, $61, $4C
        defb $B0, $50, $B0, $3A, $30, $44, $30, $4E, $30, $B1, $A8, $07, $9D, $BC, $A8, $A1
        defb $37, $A0, $42, $A8, $37, $A8, $3D, $A0, $48, $A8, $42, $A0, $BE, $78, $47, $A0
        defb $AE, $57, $44, $AA, $C9, $56, $20, $B2, $57, $C4, $AA, $CD, $56, $20, $BC, $70
        defb $42, $AD, $C2, $70, $20, $BD, $93, $56, $9D, $42, $88, $AD, $BC, $88, $20, $40
        defb $40, $A8, $BD, $4C, $20, $3A, $58, $A7, $BF, $4C, $D6, $A8, $42, $58, $A7, $3C
        defb $40, $A8, $D4, $78, $C6, $AD, $A8, $78, $20, $53, $6A, $73, $A7, $6A, $20, $CE
        defb $78, $46, $C3, $D2, $70, $21, $56, $67, $4E, $50, $52, $48, $4E, $28, $56, $41
        defb $C2, $5A, $40, $C1, $DA, $60, $20, $29, $88, $AD, $C4, $88, $20, $28, $7A, $73
        defb $C3, $7A, $20, $D8, $A0, $02, $83, $4A, $80, $84, $CA, $68, $A1, $4A, $50, $20
        defb $68, $20, $38, $20, $50, $5C, $58, $4A, $38, $30, $30, $85, $A6, $30, $A0, $44
        defb $30, $3A, $30, $2A, $30, $86, $A6, $B0, $23, $3C, $B0, $50, $B0, $56, $B0, $34
        defb $30, $20, $30, $5C, $B0, $42, $B0, $3E, $30, $5A, $30, $48, $30, $5A, $70, $5A
        defb $50, $22, $B0, $87, $B8, $B0, $A1, $48, $B0, $4C, $B0, $4E, $88, $4E, $60, $4E
        defb $38, $54, $A8, $AC, $B0, $07, $9D, $B2, $B0, $20, $D4, $87, $C2, $C1, $56, $87
        defb $C3, $D2, $30, $42, $87, $D2, $80, $E0, $52, $58, $56, $78, $56, $50, $2E, $60
        defb $9F, $B6, $60, $60, $3E, $60, $52, $90, $87, $D6, $98, $20, $A4, $48, $45, $AA
        defb $C2, $48, $20, $A8, $48, $C5, $AA, $C6, $48, $20, $A2, $B0, $02, $86, $22, $A0
        defb $83, $28, $A0, $82, $2E, $30, $86, $56, $98, $D2, $28, $30, $86, $2E, $68, $83
        defb $22, $70, $86, $A8, $70, $20, $20, $58, $84, $20, $50, $86, $A2, $30, $A0, $32
        defb $38, $32, $58, $35, $40, $AD, $34, $60, $85, $34, $30, $87, $56, $A1, $82, $5C
        defb $A2, $92, $D6, $90, $44, $D3, $AE, $A8, $45, $5B, $B6, $A8, $E0, $3E, $A8, $46
        defb $A8, $4E, $A8, $BD, $62, $47, $E4, $C3, $62, $20, $3D, $55, $E5, $41, $58, $E6
        defb $49, $5A, $E8, $B9, $5A, $C7, $E8, $45, $55, $E5, $AE, $48, $46, $AD, $2D, $3A
        defb $73, $AE, $90, $12, $D2, $A0, $98, $20, $48, $A0, $84, $B6, $A0, $A0, $36, $88
        defb $48, $88, $48, $78, $85, $B6, $78, $20, $34, $70, $86, $C8, $70, $20, $26, $9E
        defb $8B, $CD, $92, $20, $56, $9C, $8D, $4B, $A7, $90, $DB, $88, $60, $30, $98, $50
        defb $96, $91, $D9, $A2, $60, $20, $A2, $51, $70, $92, $A5, $AD, $20, $57, $77, $93
        defb $D1, $AD, $60, $28, $91, $D1, $89, $92, $8C, $55, $84, $91, $CC, $78, $60, $2B
        defb $A2, $A0, $90, $44, $D3, $AE, $88, $20, $5B, $31, $CD, $BB, $30, $16, $DA, $BB
        defb $40, $A1, $3F, $30, $3F, $40, $43, $30, $43, $40, $47, $40, $37, $40, $33, $40
        defb $DB, $B7, $30, $20, $C7, $30, $96, $DB, $CB, $40, $20, $BA, $5F, $56, $B0, $C6
        defb $5F, $60, $44, $5F, $3B, $5B, $B1, $BF, $5B, $A0, $3D, $5B, $41, $5B, $3B, $61
        defb $B2, $BB, $69, $20, $41, $61, $B3, $BF, $61, $60, $3D, $61, $B6, $50, $45, $AE
        defb $36, $58, $AC, $36, $68, $AF, $C8, $50, $C5, $AE, $48, $58, $AC, $48, $68, $AF
        defb $D4, $51, $4A, $B5, $38, $53, $B6, $A6, $35, $CA, $B5, $46, $6E, $B7, $BA, $93
        defb $4C, $CD, $AA, $82, $A4, $35, $92, $40, $5A, $38, $82, $40, $43, $2C, $33, $48
        defb $92, $54, $94, $56, $84, $5A, $93, $48, $5A, $38, $25, $5B, $3B, $28, $70, $5B
        defb $7E, $20, $32, $24, $48, $38, $3A, $48, $84, $5A, $68, $CE, $D2, $58, $60, $42
        defb $69, $46, $A0, $D3, $B7, $A0, $60, $37, $A0, $B0, $88, $42, $BA, $B0, $68, $A0
        defb $30, $48, $30, $28, $4E, $88, $BB, $CE, $68, $A0, $4E, $48, $4E, $28, $AA, $B0
        defb $02, $D2, $B2, $B0, $23, $3A, $B0, $42, $B0, $4A, $B0, $52, $B0, $5A, $B0, $2A
        defb $A8, $32, $A8, $3A, $A8, $42, $A8, $4A, $A8, $52, $A8, $5A, $A8, $A0, $90, $12
        defb $91, $26, $88, $90, $2A, $98, $93, $21, $A9, $8D, $A1, $78, $92, $91, $A5, $A0
        defb $20, $BE, $48, $07, $C5, $C2, $48, $61, $46, $40, $4A, $38, $4E, $30, $3A, $50
        defb $36, $58, $B6, $48, $46, $C0, $BE, $38, $E0, $42, $38, $46, $30, $4A, $28, $A2
        defb $B0, $12, $D2, $CF, $B0, $E1, $57, $B0, $22, $A8, $52, $A8, $5A, $A8, $32, $A0
        defb $3A, $A0, $42, $A0, $35, $A5, $8A, $28, $A8, $90, $49, $B0, $91, $3E, $A3, $92
        defb $4A, $A0, $93, $BA, $A8, $92, $8E, $44, $A5, $91, $2C, $A0, $93, $B7, $AF, $60
        defb $2E, $B0, $AC, $90, $07, $82, $C4, $88, $21, $3E, $88, $38, $88, $32, $88, $4A
        defb $90, $D2, $90, $87, $82, $CF, $50, $47, $E4, $57, $49, $E8, $50, $44, $E5, $D3
        defb $43, $20, $CC, $49, $C7, $E8, $D6, $A0, $4C, $D3, $A2, $A0, $20, $28, $98, $D5
        defb $20, $8F, $CD, $A3, $7F, $A0, $1F, $78, $1F, $33, $CA, $78, $46, $BC, $AE, $78
        defb $A1, $2E, $68, $2E, $58, $2E, $48, $4A, $68, $4A, $58, $4A, $48, $35, $49, $83
        defb $BB, $49, $60, $41, $49, $42, $68, $BD, $32, $68, $BE, $3A, $68, $C4, $3A, $58
        defb $C6, $B6, $29, $E0, $3E, $29, $32, $58, $42, $58, $3A, $78, $C7, $C2, $78, $E0
        defb $32, $78, $36, $39, $3E, $39, $C6, $68, $C6, $BE, $36, $68, $BF, $3E, $68, $C4
        defb $3E, $58, $C6, $B6, $58, $E0, $46, $58, $42, $29, $3A, $29, $3A, $39, $C7, $C2
        defb $39, $E0, $36, $78, $3E, $78, $46, $78, $53, $6A, $73, $54, $78, $AD, $A2, $A8
        defb $12, $D2, $AA, $A8, $22, $4F, $A8, $57, $A8, $22, $B0, $2A, $B0, $4F, $B0, $57
        defb $B0, $39, $A0, $41, $A0, $3E, $A9, $90, $38, $A9, $91, $C4, $A8, $92, $91, $B1
        defb $B0, $12, $92, $C9, $A0, $20, $32, $A0, $93, $A3, $98, $44, $D5, $AE, $98, $60
        defb $4F, $98, $3C, $97, $D3, $D8, $A0, $60, $20, $A0, $A9, $42, $47, $73, $D3, $42
        defb $20, $2A, $50, $AD, $D4, $50, $20, $26, $88, $A2, $A6, $68, $A1, $34, $80, $34
        defb $60, $44, $60, $44, $80, $52, $88, $52, $68, $A6, $58, $07, $A1, $D2, $58, $20
        defb $32, $48, $A3, $34, $48, $A5, $BC, $48, $60, $44, $48, $4C, $48, $A4, $A2, $B0
        defb $02, $D2, $AA, $B0, $21, $2E, $B0, $2E, $A8, $26, $A8, $1E, $A8, $D6, $A8, $44
        defb $5B, $CE, $A8, $E0, $46, $A8, $3E, $A8, $36, $A8, $22, $A0, $D3, $AA, $A0, $20
        defb $32, $98, $D5, $C6, $58, $C7, $E4, $BE, $58, $20, $3A, $4F, $E8, $AA, $78, $47
        defb $AD, $29, $6A, $73, $4E, $4F, $E8, $3E, $4E, $E6, $42, $4C, $E7, $C6, $4C, $60
        defb $4A, $4C, $A8, $90, $87, $82, $CC, $87, $C2, $BB, $CC, $67, $A0, $4C, $47, $4C
        defb $27, $46, $4E, $B8, $D2, $4A, $42, $B5, $52, $2F, $B6, $3A, $90, $C5, $B6, $90
        defb $60, $38, $98, $D6, $A8, $44, $5B, $A2, $A8, $20, $BE, $90, $07, $89, $C8, $90
        defb $20, $2E, $91, $8B, $36, $A0, $8C, $C0, $B0, $60, $2E, $B0, $40, $A1, $8D, $44
        defb $B0, $8E, $D0, $A8, $A0, $40, $98, $42, $90, $48, $B0, $8F, $CE, $A0, $E0, $3E
        defb $98, $54, $A7, $46, $90, $3A, $A0, $90, $C4, $98, $20, $30, $98, $91, $2A, $9D
        defb $92, $27, $B3, $93, $B2, $B0, $20, $CA, $98, $87, $8C, $D2, $B0, $20, $32, $90
        defb $8E, $4A, $A8, $8F, $4C, $A9, $91, $B7, $77, $C7, $7F, $28, $48, $E8, $2C, $44
        defb $E7, $AC, $50, $47, $E4, $30, $43, $E5, $34, $48, $E8, $C6, $A8, $44, $5B, $CE
        defb $A8, $61, $3E, $A8, $36, $A8, $2E, $A8, $26, $A8, $1E, $A8, $D6, $A8, $17, $88
        defb $5A, $A8, $89, $D6, $A1, $60, $52, $B0, $5A, $B0, $8A, $9F, $35, $52, $B6, $1D
        defb $52, $B5, $D6, $50, $D2, $B5, $58, $38, $B7, $D4, $68, $54, $CD, $D0, $50, $E0
        defb $54, $3B, $54, $30, $5A, $20, $B5, $43, $47, $E4, $AF, $43, $20, $30, $36, $E5
        defb $B8, $37, $20, $34, $39, $E6, $3C, $3B, $E8, $AC, $3B, $C7, $E8, $9E, $6A, $CA
        defb $B6, $1E, $2D, $B5, $AE, $4B, $4A, $B5, $2E, $2E, $B8, $B6, $40, $4C, $CD, $AC
        defb $4B, $61, $34, $60, $32, $30, $24, $2B, $1E, $50, $24, $59, $20, $98, $D3, $A8
        defb $88, $C2, $BB, $A8, $68, $A0, $28, $48, $28, $28, $B8, $80, $42, $5B, $C0, $80
        defb $A1, $44, $88, $46, $90, $48, $98, $4A, $A0, $4C, $A8, $4E, $B0, $B4, $80, $0F
        defb $87, $48, $31, $89, $DC, $B3, $60, $5B, $4D, $46, $38, $8A, $B6, $AB, $A0, $38
        defb $9A, $3E, $68, $3A, $88, $8B, $C7, $A9, $A0, $55, $63, $4E, $7D, $4D, $2C, $8C
        defb $D9, $3D, $20, $56, $2D, $8D, $C2, $6B, $60, $44, $9B, $3E, $88, $8E, $52, $9A
        defb $8F, $C9, $73, $A0, $54, $50, $30, $A3, $5A, $2D, $90, $BF, $90, $A0, $34, $88
        defb $44, $47, $3A, $9F, $91, $C9, $36, $20, $50, $2B, $92, $C5, $5F, $21, $20, $B0
        defb $4E, $41, $40, $56, $2F, $AC, $5A, $63, $93, $D6, $53, $E0, $26, $AF, $20, $A0
        defb $3F, $A9, $B0, $8F, $8F, $8C, $55, $9D, $8D, $3E, $78, $8E, $56, $83, $8F, $58
        defb $86, $90, $DD, $71, $60, $4B, $67, $32, $99, $91, $D7, $71, $61, $51, $6D, $59
        defb $9B, $4A, $4F, $54, $3C, $52, $85, $56, $AB, $92, $D0, $57, $20, $AA, $98, $07
        defb $91, $28, $A0, $8F, $30, $88, $87, $A8, $98, $60, $2C, $90, $DD, $6E, $0F, $82
        defb $43, $75, $88, $A1, $A8, $E1, $40, $29, $5B, $40, $51, $5D, $59, $6F, $3E, $65
        defb $3E, $37, $40, $6F, $5A, $50, $89, $C6, $80, $60, $48, $86, $4A, $88, $8A, $BF
        defb $46, $A0, $39, $3A, $3C, $2D, $39, $28, $8B, $BE, $56, $60, $4C, $94, $3A, $52
        defb $8C, $3A, $61, $8D, $A9, $6B, $E0, $26, $61, $5C, $99, $5D, $88, $22, $62, $8E
        defb $DA, $B0, $61, $2C, $8A, $28, $83, $28, $7A, $40, $9B, $21, $41, $48, $2D, $8F
        defb $BD, $70, $63, $3C, $70, $27, $74, $41, $7D, $25, $41, $24, $3B, $29, $5C, $27
        defb $59, $2A, $9F, $43, $99, $46, $86, $3D, $61, $35, $7C, $32, $79, $42, $A3, $90
        defb $A2, $7C, $E1, $3B, $79, $45, $8F, $21, $4A, $2F, $23, $2A, $30, $25, $2A, $1F
        defb $29, $26, $3F, $91, $AF, $39, $E1, $2A, $48, $42, $31, $40, $83, $48, $A0, $2C
        defb $71, $3C, $A3, $5A, $57, $54, $61, $92, $AF, $50, $21, $35, $56, $2B, $5E, $36
        defb $6E, $34, $2F, $33, $46, $93, $9F, $6C, $A0, $53, $51, $5C, $A8, $DB, $30, $8F
        defb $8A, $3B, $44, $8B, $26, $8C, $90, $B2, $96, $60, $35, $84, $3A, $8D, $91, $A5
        defb $A3, $60, $20, $90, $37, $9F, $92, $B0, $81, $60, $31, $64, $31, $AC, $93, $AB
        defb $A2, $A0, $2A, $B3, $2B, $92, $B6, $30, $17, $86, $C0, $30, $64, $46, $30, $4C
        defb $30, $52, $30, $42, $58, $3C, $58, $36, $58, $30, $58, $26, $50, $54, $78, $4E
        defb $78, $44, $78, $3E, $78, $2A, $58, $2A, $88, $50, $70, $54, $68, $26, $48, $56
        defb $60, $87, $BA, $78, $21, $4A, $78, $2C, $50, $56, $70, $3C, $30, $22, $90, $F4
        defb $A6, $58, $E0, $5A, $80, $56, $A8, $2A, $60, $26, $A8, $F5, $AC, $A8, $A1, $32
        defb $A8, $38, $A8, $3E, $A8, $58, $30, $5A, $58, $44, $A8, $22, $60, $F6, $A2, $48
        defb $62, $22, $30, $22, $78, $22, $A0, $5A, $90, $5A, $A8, $5A, $68, $5A, $40, $2A
        defb $70, $26, $68, $AE, $60, $55, $F3, $3F, $38, $ED, $52, $80, $EE, $32, $60, $EF
        defb $BA, $80, $D5, $F3, $45, $38, $EE, $D0, $38, $20, $A2, $40, $02, $82, $A6, $58
        defb $21, $2E, $78, $36, $98, $22, $90, $22, $29, $28, $48, $83, $AC, $58, $62, $30
        defb $68, $34, $78, $38, $88, $3C, $98, $40, $A8, $46, $A8, $24, $78, $2C, $98, $22
        defb $A8, $22, $58, $84, $AA, $78, $A0, $32, $98, $5A, $80, $2C, $68, $85, $B4, $88
        defb $61, $3C, $A8, $4C, $A8, $20, $78, $28, $98, $56, $98, $26, $70, $86, $AE, $90
        defb $A3, $36, $B0, $20, $70, $28, $90, $30, $B0, $28, $A8, $20, $88, $50, $B0, $58
        defb $78, $58, $30, $52, $30, $4C, $30, $46, $30, $40, $30, $3A, $30, $26, $88, $87
        defb $AE, $A8, $61, $28, $B0, $2C, $B0, $50, $A8, $56, $B0, $54, $A8, $5A, $98, $8A
        defb $5A, $B0, $8F, $5C, $A0, $92, $58, $A8, $8E, $DA, $50, $46, $AD, $BA, $50, $20
        defb $39, $42, $73, $D9, $42, $20, $D0, $90, $45, $AD, $C4, $90, $20, $42, $90, $9D
        defb $CE, $90, $60, $48, $90, $C2, $87, $42, $2E, $D2, $87, $20, $D8, $A8, $12, $86
        defb $B8, $98, $61, $26, $88, $30, $60, $50, $78, $3C, $70, $22, $50, $50, $A0, $87
        defb $C8, $A0, $A1, $44, $A0, $3E, $98, $58, $80, $38, $60, $2C, $60, $22, $78, $23
        defb $27, $88, $4A, $A8, $89, $43, $A8, $8A, $9F, $9A, $60, $45, $43, $4C, $4E, $8B
        defb $CE, $A8, $60, $40, $A0, $5A, $B0, $8D, $B6, $AF, $60, $2E, $50, $2A, $98, $8F
        defb $D2, $70, $A0, $58, $B0, $24, $95, $4E, $59, $90, $A2, $A0, $20, $20, $80, $91
        defb $D6, $46, $20, $20, $38, $92, $B2, $48, $60, $3F, $49, $46, $B0, $93, $C3, $96
        defb $92, $89, $47, $90, $8A, $4B, $98, $8B, $C8, $37, $20, $26, $90, $8C, $B6, $A0
        defb $E0, $54, $5D, $50, $32, $33, $29, $4C, $3E, $8D, $3C, $A0, $8E, $48, $2F, $8F
        defb $26, $30, $90, $B8, $44, $21, $2C, $25, $5A, $5C, $50, $41, $5C, $44, $52, $A8
        defb $91, $A8, $A0, $61, $28, $48, $3C, $58, $56, $68, $3C, $31, $54, $2E, $42, $2F
        defb $92, $CB, $26, $60, $5A, $2E, $39, $A8, $93, $AC, $3E, $60, $33, $35, $DA, $88
        defb $46, $79, $D2, $80, $A0, $3E, $78, $24, $58, $39, $78, $AD, $38, $6A, $73, $AE
        defb $A8, $47, $5B, $C8, $88, $12, $83, $C8, $50, $A0, $46, $60, $34, $50, $36, $68
        defb $84, $C8, $30, $60, $36, $30, $48, $A0, $85, $C8, $70, $20, $28, $80, $86, $B0
        defb $B0, $E0, $2E, $88, $46, $B0, $34, $88, $28, $A8, $87, $B6, $80, $A1, $36, $60
        defb $36, $48, $48, $98, $48, $80, $48, $48, $36, $B0, $28, $33, $8A, $5A, $3C, $8B
        defb $CC, $77, $A0, $21, $66, $30, $51, $58, $5A, $8C, $D6, $27, $20, $32, $5F, $8D
        defb $CC, $40, $60, $22, $2B, $59, $92, $8E, $5A, $78, $8F, $30, $70, $90, $D2, $A1
        defb $60, $4D, $B0, $30, $32, $91, $D2, $39, $E0, $24, $68, $4C, $98, $4C, $5A, $50
        defb $6B, $92, $A2, $A8, $60, $2C, $5E, $4E, $88, $93, $A8, $4F, $92, $90, $22, $52
        defb $91, $AA, $6F, $60, $4C, $27, $28, $B0, $93, $A4, $90, $C6, $AD, $23, $82, $73
        defb $28, $88, $79, $BD, $2F, $8F, $89, $54, $2D, $8A, $48, $28, $8B, $58, $28, $8D
        defb $20, $98, $91, $D0, $30, $0F, $89, $A5, $A8, $20, $35, $2D, $8A, $A2, $48, $60
        defb $21, $5A, $20, $6A, $8B, $DB, $60, $20, $4C, $2B, $8C, $C4, $28, $21, $22, $8B
        defb $56, $98, $20, $AE, $31, $2B, $20, $7B, $8D, $D6, $A9, $E0, $3B, $B0, $5A, $98
        defb $41, $2C, $39, $2F, $8E, $5C, $2F, $8F, $C4, $A8, $A0, $22, $30, $3E, $A8, $23
        defb $30, $91, $5A, $A8, $92, $A4, $AF, $E0, $28, $A8, $3F, $AB, $44, $B0, $29, $2B
        defb $93, $A6, $98, $60, $3E, $99, $AE, $A8, $42, $5B, $B6, $A8, $A0, $4E, $A8, $46
        defb $A8, $A6, $58, $02, $C5, $AA, $58, $23, $2E, $60, $32, $60, $36, $60, $3A, $68
        defb $3E, $68, $42, $68, $46, $68, $4A, $60, $4E, $60, $52, $60, $56, $58, $5A, $58
        defb $A6, $48, $46, $C0, $AA, $48, $E2, $32, $50, $36, $50, $3A, $58, $3E, $58, $42
        defb $58, $46, $58, $4A, $50, $4E, $50, $52, $50, $56, $48, $5A, $48, $3A, $48, $13
        defb $C6, $48, $20, $46, $3B, $73, $BA, $3B, $20, $C0, $28, $0F, $88, $C8, $28, $60
        defb $54, $4C, $52, $5A, $89, $D5, $70, $61, $44, $30, $4C, $60, $38, $98, $3C, $98
        defb $41, $A8, $48, $60, $8A, $DC, $99, $A0, $5B, $AA, $2C, $70, $40, $60, $8B, $30
        defb $74, $8C, $D0, $61, $60, $3F, $B0, $44, $60, $8D, $BD, $A0, $60, $28, $78, $30
        defb $B0, $8E, $AE, $7E, $20, $3B, $9D, $8F, $A8, $60, $E0, $40, $A0, $2C, $81, $33
        defb $AA, $32, $20, $90, $CE, $B1, $20, $2C, $28, $91, $D8, $48, $A1, $2A, $B0, $26
        defb $28, $5D, $81, $1F, $52, $33, $B0, $48, $B0, $23, $64, $92, $B9, $B0, $A0, $20
        defb $28, $5C, $5A, $54, $60, $93, $B8, $28, $61, $22, $B0, $42, $B0, $53, $B0, $35
        defb $A1, $1E, $A0, $CC, $69, $8F, $89, $3C, $60, $8A, $2A, $68, $8C, $5A, $30, $91
        defb $D9, $70, $20, $A2, $58, $02, $C5, $A6, $58, $60, $2A, $60, $A2, $48, $C6, $C0
        defb $A6, $48, $60, $2A, $50, $B4, $3B, $46, $73, $34, $48, $13, $AC, $A0, $17, $86
        defb $AC, $B0, $E1, $3A, $B0, $40, $B0, $46, $B0, $4C, $B0, $52, $B0, $58, $B0, $2C
        defb $A8, $52, $50, $87, $C6, $70, $20, $26, $A0, $F1, $42, $30, $F4, $A6, $80, $63
        defb $26, $90, $2A, $90, $32, $B0, $36, $B0, $5A, $48, $5A, $38, $5A, $28, $56, $78
        defb $52, $78, $26, $50, $56, $30, $56, $40, $5A, $A0, $4C, $78, $F5, $C6, $78, $62
        defb $40, $78, $3A, $78, $26, $40, $3C, $30, $36, $30, $30, $30, $2A, $30, $24, $30
        defb $1E, $30, $22, $40, $F6, $A2, $58, $61, $22, $70, $22, $88, $22, $A0, $5A, $58
        defb $5A, $70, $CE, $58, $57, $F4, $CA, $68, $20, $AC, $40, $55, $ED, $39, $AA, $F2
        defb $BF, $40, $D5, $ED, $35, $40, $EC, $3A, $88, $ED, $4E, $AA, $F2, $AC, $60, $46
        defb $13, $BC, $60, $20, $3C, $53, $73, $AC, $53, $20, $DA, $40, $07, $F4, $DA, $50
        defb $E0, $5A, $90, $5A, $A0, $22, $A0, $22, $B0, $F5, $A8, $B0, $A4, $2E, $B0, $34
        defb $B0, $3A, $B0, $40, $B0, $46, $B0, $4C, $B0, $52, $B0, $58, $B0, $26, $30, $2C
        defb $30, $32, $30, $38, $30, $3E, $30, $44, $30, $4A, $30, $50, $30, $56, $30, $5C
        defb $30, $22, $70, $F6, $A2, $58, $21, $22, $40, $22, $28, $5A, $60, $5A, $78, $A6
        defb $40, $45, $ED, $2C, $40, $EC, $CE, $40, $20, $40, $40, $EE, $B8, $40, $20, $56
        defb $AA, $F2, $48, $40, $F3, $52, $AA, $F2, $D6, $68, $46, $AD, $A8, $68, $20, $55
        defb $5A, $73, $A7, $5A, $20, $B4, $48, $12, $83, $B4, $68, $21, $3A, $98, $49, $48
        defb $49, $70, $40, $98, $49, $58, $84, $C9, $30, $E0, $36, $78, $36, $90, $36, $30
        defb $36, $58, $85, $C9, $80, $A0, $46, $98, $4A, $98, $49, $90, $87, $56, $86, $89
        defb $56, $A6, $8B, $29, $9E, $8A, $D7, $39, $20, $29, $45, $8B, $22, $55, $8C, $26
        defb $78, $8D, $26, $34, $8F, $DA, $66, $20, $30, $2B, $91, $3D, $A8, $8B, $2B, $2C
        defb $8C, $30, $44, $8D, $30, $88, $90, $CD, $33, $20, $4F, $47, $91, $B0, $2B, $A0
        defb $41, $A8, $41, $A8, $30, $55, $92, $B7, $A7, $20, $2F, $A2, $93, $C7, $A9, $20
        defb $AB, $81, $92, $8B, $D4, $5E, $20, $51, $71, $8D, $AC, $63, $20, $30, $70, $91
        defb $CD, $5C, $60, $4E, $94, $4D, $7D, $92, $BA, $88, $45, $5B, $C1, $88, $20
        ; End of unknown area $A37C to $C20E


index_de_sprites:
        dw $14C5
        dw $14E7 
        dw $1509 
        dw $152B 
        dw $154D 
        dw $156F 
        dw $1591 
        dw $15B3 
        dw $15D5 
        dw $15F7 
        dw $1619 
        dw $163B 
        dw $165D 
        dw $167F 
        dw $16A1
        dw $16C3
        dw $16E5
        dw $1707
        dw $1729
        dw $174B
        dw $176D
        dw $178F
        dw $17B1
        dw $17D3
        dw $17F5
        dw $1817
        dw $1839
        dw $0000
        dw $0080
        dw $1F54
        dw $1FC2
        dw $185B
        dw $00BB
        dw $00DE
        dw $0128
        dw $016F
        dw $01AA
        dw $01E8
        dw $0229
        dw $0233
        dw $023D
        dw $0247
        dw $0251
        dw $025B
        dw $0265
        dw $026F
        dw $0279
        dw $0283
        dw $028D
        dw $0297
        dw $02A1
        dw $02AB
        dw $02B5
        dw $02BF
        dw $02C9
        dw $02D3
        dw $02DD
        dw $02E7
        dw $02F1
        dw $02FB
        dw $0305
        dw $030F
        dw $0319
        dw $0323
        dw $032D
        dw $0337
        dw $0341
        dw $034B
        dw $0355
        dw $035F
        dw $0369
        dw $0373
        dw $037D
        dw $0387
        dw $0391
        dw $039B
        dw $03A5
        dw $03AF
        dw $03B9
        dw $03C3
        dw $03CD
        dw $03D7
        dw $03E1
        dw $03EB
        dw $03F5
        dw $03FF
        dw $0409
        dw $0413
        dw $041D
        dw $0427
        dw $0431
        dw $043B
        dw $0455
        dw $046F
        dw $0489
        dw $04A3
        dw $18BD
        dw $1937
        dw $1981
        dw $19CB
        dw $2033
        dw $2047
        dw $2059
        dw $2071
        dw $FFFF
        dw $20EB
        dw $2144
        dw $FFFF
        dw $219D
        dw $FFFF
        dw $21F3
        dw $19E5
        dw $1A2F
        dw $FFFF
        dw $1A79
        dw $04BD
        dw $FFFF
        dw $22D1
        dw $1AF3
        dw $FFFF
        dw $04D9
        dw $0A89
        dw $04E3
        dw $2390
        dw $1B3D
        dw $1B87
        dw $04F9
        dw $1002
        dw $FFFF
        dw $FFFF
        dw $063C
        dw $0686
        dw $06B8
        dw $06EA
        dw $070C
        dw $0726
        dw $0736
        dw $0758
        dw $076A
        dw $078A
        dw $07AC
        dw $07CC
        dw $07EE
        dw $0800
        dw $080A
        dw $0854
        dw $089E
        dw $08E5
        dw $1BD1
        dw $1BDB
        dw $1BE5
        dw $1BEF
        dw $104C
        dw $105E
        dw $1BF9
        dw $1070
        dw $1092
        dw $0927
        dw $10B4
        dw $10D6
        dw $1108
        dw $23C2
        dw $2404
        dw $2486
        dw $24A0
        dw $24BA
        dw $0941
        dw $0963
        dw $0985
        dw $09A7
        dw $09B9
        dw $FFFF
        dw $112A
        dw $09F9
        dw $114C
        dw $115E
        dw $1170
        dw $1178
        dw $1186
        dw $1198
        dw $0AAB
        dw $0AD5
        dw $0B95
        dw $0BF1
        dw $0C1B
        dw $0C53
        dw $0C7F
        dw $0D01
        dw $251C
        dw $254E
        dw $2570
        dw $2592
        dw $0A13
        dw $0A35
        dw $0A45
        dw $0A63
        dw $25B4
        dw $0D63
        dw $25D6
        dw $25F8
        dw $0D75
        dw $0DC7
        dw $0DF9
        dw $0E13
        dw $0E45
        dw $0E67
        dw $0EA8
        dw $1C43
        dw $1C49
        dw $1C53
        dw $0ECA
        dw $0EEC
        dw $FFFF
        dw $0F0E
        dw $1C67
        dw $1C6D
        dw $1C76
        dw $FFFF
        dw $0F30
        dw $0F52
        dw $FFFF
        dw $11A6
        dw $1254
        dw $1290
        dw $1316
        dw $1376
        dw $FFFF
        dw $FFFF
        dw $0F74
        dw $0F96
        dw $0FB2
        dw $0FC8
        dw $0FE2
        dw $13E7
        dw $1C8A
        dw $1CE3
        dw $1D2D
        dw $1D9D
        dw $1DC9
        dw $1DFB
        dw $1E59
        dw $1E6A
        dw $1EB4
        dw $1EC0
        dw $1ECE
        dw $1EF0
        dw $1F22
        dw $051B
        dw $0556
        dw $0591
        dw $05CF
        dw $060D
        dw $1415
        dw $143F
        dw $1467
        dw $1495

        include "sprites.asm"

after_sprites:
        defb $F8

        ; Start of unknown area $EA2A to $FA0A
        defb $17, $30, $F4, $D6, $3D, $35
        defb $D1, $B3, $6A, $F5, $F8, $14, $68, $AF, $81, $66, $65, $F8, $18, $64, $DD, $F8
        defb $1A, $62, $DD, $F8, $1C, $60, $DC, $F8, $23, $60, $AF, $82, $56, $23, $F8, $27
        defb $64, $5F, $82, $96, $67, $F8, $2B, $68, $DC, $F8, $08, $8C, $AD, $CB, $36, $F8
        defb $13, $88, $D3, $93, $6A, $F8, $13, $90, $A5, $DD, $DD, $DC, $F8, $1E, $8C, $A1
        defb $6D, $D5, $B0, $A4, $DD, $DC, $0A, $49, $3F, $F0, $F5, $F8, $02, $30, $F9, $12
        defb $02, $F6, $FD, $EB, $A5, $DD, $DD, $DC, $ED, $D6, $DC, $08, $19, $4D, $EF, $FF
        defb $4F, $80, $46, $0F, $91, $10, $3F, $3F, $DE, $BA, $35, $7D, $CD, $FD, $FD, $F0
        defb $DC, $4C, $EA, $D9, $1F, $DD, $7C, $20, $46, $0D, $A1, $5D, $38, $2E, $CF, $FF
        defb $5F, $80, $83, $0F, $91, $40, $5F, $6F, $DE, $BD, $D3, $D5, $70, $D1, $37, $20
        defb $30, $7D, $71, $BB, $FD, $46, $0D, $61, $0E, $FB, $44, $D5, $0D, $A8, $32, $FD
        defb $52, $0A, $5A, $DE, $05, $EA, $D6, $02, $44, $0D, $05, $D3, $FD, $24, $0D, $31
        defb $20, $4C, $20, $4D, $20, $81, $91, $EC, $FF, $F5, $F8, $02, $30, $F9, $15, $03
        defb $F6, $FD, $EB, $D7, $B1, $37, $10, $D2, $56, $A0, $30, $DA, $3D, $CF, $D2, $40
        defb $78, $95, $6D, $50, $D6, $10, $3D, $33, $56, $DE, $EC, $FF, $FF, $F5, $F8, $02
        defb $30, $F9, $14, $05, $F2, $FD, $28, $10, $D0, $C7, $80, $7D, $71, $3D, $57, $DE
        defb $F6, $FD, $FD, $EB, $81, $DC, $ED, $A5, $DD, $DD, $DC, $DE, $02, $85, $70, $57
        defb $FD, $91, $3B, $BD, $C0, $81, $3D, $9D, $CE, $DD, $63, $6D, $EE, $CF, $FF, $4F
        defb $80, $46, $0F, $91, $60, $2F, $3F, $DE, $BA, $DC, $B3, $6D, $F0, $57, $02, $83
        defb $20, $DC, $4C, $DF, $EC, $FF, $F5, $F8, $08, $40, $F9, $15, $04, $F6, $FD, $EB
        defb $DD, $3D, $57, $02, $C9, $61, $A0, $D6, $10, $56, $24, $FD, $30, $D0, $C7, $80
        defb $36, $A0, $5E, $AD, $60, $B5, $D5, $1F, $D9, $44, $21, $A0, $24, $02, $81, $07
        defb $D7, $42, $DE, $EC, $FF, $F5, $F8, $06, $50, $F9, $14, $04, $F6, $FD, $EB, $5E
        defb $AD, $60, $91, $3B, $BD, $C0, $56, $24, $FD, $63, $2C, $91, $ED, $D6, $36, $ED
        defb $D0, $C2, $02, $85, $7F, $D5, $70, $24, $40, $D6, $CD, $18, $DE, $EC, $FF, $FF
        defb $F5, $F8, $0A, $30, $F9, $12, $05, $F6, $FD, $EB, $81, $DC, $0D, $A4, $DA, $0E
        defb $F0, $50, $D2, $11, $BF, $DD, $29, $11, $DE, $0D, $39, $44, $D9, $DC, $DE, $FD
        defb $28, $36, $D5, $70, $EF, $05, $EA, $BB, $07, $11, $FD, $DC, $4C, $0B, $32, $19
        defb $EA, $D6, $36, $DE, $EC, $FF, $F5, $F8, $02, $30, $F9, $17, $03, $F6, $FD, $EB
        defb $95, $D0, $D0, $12, $DE, $05, $2E, $A7, $0D, $61, $ED, $A4, $93, $DE, $FD, $73
        defb $D9, $10, $D6, $10, $A5, $DD, $DD, $DC, $DE, $0D, $19, $43, $D5, $DE, $EC, $FF
        defb $FF, $F5, $F8, $02, $30, $F9, $14, $04, $F6, $FD, $EB, $84, $20, $72, $CD, $2D
        defb $20, $A5, $DD, $DD, $DE, $05, $FD, $DA, $37, $09, $13, $BB, $DC, $0D, $18, $5B
        defb $B5, $6D, $3F, $D4, $C2, $05, $60, $28, $19, $1D, $EE, $CF, $FF, $5F, $80, $23
        defb $0F, $91, $90, $3F, $6F, $DE, $B8, $1D, $CE, $DB, $44, $D5, $03, $D2, $21, $90
        defb $28, $57, $0D, $24, $9F, $DD, $61, $EF, $D1, $32, $D1, $80, $DC, $30, $B3, $21
        defb $9E, $CF, $FF, $F0, $F5, $F8, $02, $30, $F9, $16, $08, $F6, $FD, $EB, $DA, $1B
        defb $B0, $A4, $61, $0B, $3A, $DE, $EC, $FD, $F2, $FD, $73, $DC, $70, $D3, $93, $6A
        defb $0A, $5D, $DD, $DD, $CE, $DF, $DF, $6F, $DE, $B5, $0D, $14, $CB, $A6, $EA, $20
        defb $21, $BB, $05, $D2, $FD, $50, $DA, $37, $0D, $14, $D6, $56, $D3, $04, $9F, $DD
        defb $34, $56, $D3, $05, $60, $28, $57, $0D, $7B, $3D, $11, $DE, $EC, $FF, $F5, $F8
        defb $02, $30, $F9, $14, $04, $F6, $FD, $EB, $8C, $99, $DC, $08, $4D, $61, $ED, $74
        defb $6E, $EF, $D5, $EA, $BB, $0D, $7C, $20, $28, $10, $D5, $12, $2B, $1F, $D4, $60
        defb $D2, $49, $0D, $C4, $CE, $CF, $FF, $F0, $F4, $F8, $14, $30, $F9, $11, $03, $F3
        defb $FD, $EB, $A4, $DD, $DC, $DE, $08, $1D, $CE, $DD, $A3, $D5, $1F, $DC, $D7, $07
        defb $B1, $1D, $7D, $C8, $13, $AD, $EE, $CF, $FF, $7F, $80, $85, $0F, $91, $60, $4F
        defb $3F, $DE, $EE, $EE, $ED, $0C, $20, $A4, $DD, $DC, $05, $7F, $D3, $D0, $74, $BC
        defb $21, $BD, $C0, $4C, $20, $D1, $4B, $AE, $DF, $D1, $D9, $16, $0D, $0D, $C0, $85
        defb $70, $72, $36, $A3, $9A, $7F, $FF, $7F, $80, $46, $0F, $91, $60, $3F, $3F, $D5
        defb $2E, $AB, $B0, $23, $D5, $10, $30, $8C, $D3, $1F, $D7, $84, $D1, $D5, $02, $40
        defb $DA, $3D, $51, $08, $5D, $60, $CD, $7D, $EF, $FF, $F0, $F6, $F8, $14, $30, $F9
        defb $08, $02, $F4, $FD, $EB, $44, $D7, $7D, $EE, $CF, $FF, $5F, $80, $A3, $0F, $91
        defb $20, $5F, $6F, $DE, $BD, $C5, $D5, $17, $DE, $02, $83, $20, $DA, $37, $FD, $78
        defb $4D, $1D, $55, $6D, $3D, $E0, $50, $28, $56, $D5, $FD, $50, $61, $1A, $02, $40
        defb $D3, $40, $24, $FD, $D0, $1A, $03, $D2, $21, $90, $28, $32, $DE, $EC, $FF, $FF
        defb $F4, $F8, $02, $30, $F9, $18, $05, $F7, $FD, $EB, $28, $10, $DA, $5D, $D3, $9A
        defb $0D, $D3, $D5, $70, $2C, $96, $7F, $D3, $BB, $0D, $34, $4A, $02, $40, $1D, $95
        defb $BD, $EE, $CF, $DF, $2F, $D7, $3D, $C7, $0D, $79, $56, $D1, $10, $D1, $83, $9D
        defb $65, $6D, $3E, $DF, $FF, $4F, $80, $24, $0F, $91, $80, $7F, $7F, $DE, $B8, $10
        defb $DA, $37, $0A, $1D, $21, $32, $1A, $0D, $C1, $39, $7F, $D3, $D3, $40, $D0, $DC
        defb $03, $0D, $09, $3D, $91, $08, $19, $4E, $DD, $C1, $2F, $D8, $10, $83, $70, $91
        defb $2C, $96, $1A, $0D, $64, $91, $FD, $D7, $4D, $A1, $9D, $2C, $B0, $28, $36, $01
        defb $D9, $19, $FD, $D0, $1D, $24, $91, $EE, $28, $57, $0D, $A5, $BB, $0D, $01, $02
        defb $81, $FD, $D2, $56, $3B, $0D, $14, $6D, $2B, $5D, $12, $EC, $FF, $FF, $F4, $F8
        defb $08, $30, $F9, $17, $04, $F7, $FD, $EB, $D5, $57, $70, $28, $10, $D2, $94, $D3
        defb $DF, $DF, $05, $EA, $D9, $1F, $D2, $95, $1A, $02, $85, $70, $D0, $1D, $24, $91
        defb $0E, $FF, $D5, $20, $83, $76, $EA, $20, $DA, $49, $D5, $1A, $0D, $C1, $2D, $EE
        defb $CF, $FF, $7F, $80, $85, $0F, $91, $30, $4F, $3F, $DE, $EE, $EE, $ED, $79, $56
        defb $D1, $10, $D1, $83, $9D, $65, $6D, $3F, $DD, $55, $77, $17, $02, $81, $0D, $29
        defb $4D, $3E, $EE, $EE, $EF, $D3, $6A, $0A, $49, $30, $3D, $7D, $71, $39, $7D, $EF
        defb $FF, $F0, $F5, $F8, $02, $30, $F9, $17, $05, $F6, $FD, $EB, $28, $36, $D5, $7E
        defb $AA, $5D, $DD, $DD, $CD, $E0, $D6, $10, $36, $AF, $DD, $69, $0D, $18, $39, $D6
        defb $56, $D3, $08, $3D, $91, $07, $4D, $61, $FD, $D0, $C7, $56, $17, $70, $24, $03
        defb $22, $16, $A0, $24, $DE, $FD, $DA, $1E, $AB, $B0, $71, $10, $DC, $4C, $0B, $32
        defb $19, $DE, $EC, $FF, $F4, $F8, $02, $30, $F9, $1A, $07, $F2, $FD, $D3, $B1, $6A
        defb $30, $73, $DC, $7F, $DF, $7F, $DE, $B4, $8D, $E0, $5E, $AD, $60, $DA, $49, $95
        defb $1A, $07, $5D, $1D, $5F, $D3, $D0, $4C, $20, $D6, $DC, $0D, $34, $D0, $4B, $56
        defb $4D, $EF, $DD, $7B, $13, $71, $0D, $25, $6A, $08, $5D, $60, $D2, $49, $0D, $61
        defb $FD, $EF, $5E, $AD, $91, $0B, $44, $D5, $1A, $01, $D9, $19, $DC, $DA, $81, $91
        defb $DE, $EC, $FF, $FF, $F4, $F8, $02, $30, $F9, $14, $04, $F7, $FD, $EB, $48, $02
        defb $83, $6D, $50, $DC, $4C, $07, $4F, $DD, $6C, $D1, $8D, $E0, $84, $DA, $07, $83
        defb $BB, $05, $FD, $91, $2C, $96, $02, $81, $0D, $23, $D9, $4C, $9D, $FE, $CF, $FF
        defb $4F, $80, $46, $0F, $91, $50, $4F, $3F, $DE, $FD, $C4, $C0, $21, $BB, $02, $81
        defb $0D, $A5, $2D, $18, $FD, $DA, $83, $20, $DD, $3D, $57, $08, $37, $0A, $46, $1F
        defb $D2, $40, $DC, $4C, $90, $D2, $95, $16, $A7, $FF, $F4, $F8, $08, $30, $F9, $16
        defb $05, $F7, $FD, $EB, $D6, $DC, $0D, $63, $D3, $5D, $10, $57, $06, $42, $85, $6D
        defb $3F, $DD, $14, $D6, $D7, $39, $1A, $02, $40, $DD, $3D, $57, $EA, $FD, $D7, $4D
        defb $A1, $97, $0D, $0C, $20, $50, $D1, $36, $08, $1B, $D7, $FD, $DC, $4C, $90, $D0
        defb $C7, $8D, $C0, $D2, $95, $16, $AE, $CF, $FF, $4F, $80, $83, $0F, $91, $70, $5F
        defb $7F, $DE, $B5, $07, $83, $BB, $06, $11, $A0, $30, $D2, $59, $1F, $D2, $40, $B5
        defb $D3, $82, $0D, $6D, $C0, $D1, $3C, $BA, $94, $6E, $D3, $FD, $B1, $3D, $20, $D2
        defb $94, $D6, $02, $81, $0D, $0C, $78, $ED, $36, $AF, $D7, $4D, $61, $28, $56, $D3
        defb $0D, $74, $57, $46, $4C, $7E, $CF, $FF, $F0, $F4, $F8, $02, $30, $F9, $1A, $06
        defb $F7, $FD, $EB, $8C, $D0, $D0, $B1, $0D, $0C, $D0, $D0, $B1, $03, $6A, $07, $5D
        defb $6D, $61, $9F, $D4, $D9, $19, $03, $0B, $5D, $38, $20, $D1, $3C, $BA, $94, $60
        defb $D2, $49, $FD, $2D, $A4, $0D, $65, $6C, $21, $7E, $EE, $EE, $E0, $28, $19, $1D
        defb $EF, $D7, $43, $D5, $02, $85, $70, $56, $24, $02, $81, $09, $44, $27, $FD, $24
        defb $0D, $29, $11, $0D, $C4, $C9, $0D, $29, $51, $6A, $EC, $FF, $F7, $F8, $02, $30
        defb $F9, $13, $04, $F3, $FD, $28, $10, $D0, $39, $A0, $5D, $36, $49, $17, $FD, $DC
        defb $4C, $DE, $08, $1E, $A7, $02, $44, $0D, $0C, $7D, $CF, $DD, $7B, $3D, $C5, $6D
        defb $30, $85, $70, $D7, $5D, $71, $7D, $EF, $FF, $F0, $F4, $F8, $0A, $30, $F9, $14
        defb $08, $F7, $FD, $EB, $DA, $83, $2E, $A7, $02, $85, $7D, $FE, $CF, $DF, $2F, $DD
        defb $C1, $BB, $70, $28, $10, $D0, $39, $AE, $DF, $DF, $7F, $DE, $BD, $A4, $DA, $DE
        defb $09, $4D, $1D, $50, $36, $A0, $94, $BB, $DE, $FD, $1C, $91, $D5, $3D, $E0, $50
        defb $78, $36, $EA, $2F, $D6, $11, $A0, $28, $57, $03, $6D, $CD, $64, $91, $DE, $EC
        defb $FF, $F4, $F8, $02, $30, $F9, $18, $07, $F6, $FD, $28, $10, $A1, $D9, $5B, $07
        defb $3D, $C7, $FD, $F2, $FD, $EB, $DD, $3D, $57, $0D, $63, $A1, $03, $0A, $13, $B0
        defb $DA, $52, $8F, $DD, $61, $0E, $F5, $0D, $7C, $20, $85, $70, $74, $CB, $05, $62
        defb $4F, $D3, $09, $56, $D3, $07, $40, $81, $0D, $14, $CB, $AF, $D6, $1D, $91, $90
        defb $D0, $10, $D5, $5B, $B1, $AE, $EE, $CF, $FF, $4F, $80, $23, $0F, $91, $80, $5F
        defb $2F, $DE, $B8, $10, $D0, $12, $93, $DC, $1A, $03, $6A, $FD, $5D, $6D, $79, $57
        defb $46, $1A, $0D, $61, $08, $19, $10, $74, $FD, $64, $EF, $46, $10, $DA, $4C, $BA
        defb $0D, $56, $4D, $A0, $85, $7F, $D7, $1D, $19, $12, $EC, $FF, $F4, $F8, $02, $30
        defb $F9, $18, $05, $F2, $FD, $EB, $23, $D5, $10, $28, $57, $02, $95, $A1, $62, $03
        defb $6A, $FD, $D5, $5B, $B0, $DD, $3D, $57, $0E, $F2, $81, $60, $D0, $95, $6D, $3F
        defb $DD, $61, $02, $81, $09, $56, $D3, $DE, $EC, $FF, $FF, $F4, $F8, $02, $30, $F9
        defb $14, $06, $F2, $FD, $EB, $1D, $BD, $11, $BB, $16, $2D, $E0, $64, $DA, $FD, $D1
        defb $37, $20, $28, $10, $95, $6D, $3F, $D5, $62, $40, $28, $10, $D1, $93, $D1, $D5
        defb $70, $4D, $2F, $DD, $31, $81, $66, $30, $36, $A0, $A1, $72, $94, $DC, $FD, $DD
        defb $3D, $57, $EA, $07, $4C, $B0, $D2, $49, $1D, $91, $9E, $CF, $F0, $F4, $F8, $02
        defb $30, $F9, $12, $04, $F2, $FD, $EB, $D2, $91, $10, $32, $0B, $37, $2D, $EF, $DD
        defb $24, $90, $46, $D1, $10, $52, $07, $11, $D6, $7F, $D5, $04, $DA, $10, $30, $A1
        defb $D0, $2D, $EE, $CF, $FF, $4F, $80, $23, $0F, $91, $70, $4F, $2F, $DE, $B5, $EA
        defb $BB, $0D, $31, $20, $DC, $4C, $08, $4D, $61, $EF, $FD, $EE, $EE, $EE, $D0, $C2
        defb $02, $81, $07, $D7, $1B, $BF, $D9, $1D, $8C, $59, $17, $0E, $3E, $00, $A5, $3D
        defb $64, $6A, $7D, $EE, $CF, $FF, $F0, $F4, $F8, $02, $30, $F9, $16, $05, $F2, $FD
        defb $EB, $DA, $1B, $B0, $A4, $61, $DE, $05, $07, $83, $BB, $FD, $29, $36, $7D, $74
        defb $92, $0D, $C4, $C0, $24, $0D, $44, $56, $FD, $DC, $4C, $90, $D2, $95, $16, $A7
        defb $03, $20, $84, $D6, $1D, $EF, $DD, $23, $91, $DA, $1B, $B0, $81, $94, $DE, $EC
        defb $FF, $F7, $F8, $02, $30, $F9, $1A, $08, $F3, $FD, $A5, $DD, $DD, $DC, $03, $6A
        defb $08, $57, $0D, $29, $51, $6A, $70, $39, $1F, $D7, $3D, $21, $BD, $C0, $84, $D6
        defb $1D, $E0, $28, $10, $1D, $95, $BF, $DD, $A5, $DD, $39, $A0, $DD, $3D, $57, $05
        defb $70, $A1, $3A, $03, $2F, $DB, $37, $20, $36, $A0, $28, $10, $DC, $4B, $D5, $D2
        defb $4B, $D5, $03, $91, $FD, $73, $D2, $10, $46, $D1, $10, $3D, $33, $56, $EE, $EE
        defb $EE, $FD, $D2, $49, $06, $4D, $AD, $EF, $DD, $A1, $BB, $0A, $46, $1D, $EF, $F0
        defb $F2, $F8, $02, $30, $F9, $1A, $04, $F6, $FD, $7C, $AA, $16, $BD, $C0, $28, $10
        defb $13, $92, $80, $78, $3D, $51, $7F, $D3, $6A, $0D, $D3, $D5, $7E, $A0, $D2, $C9
        defb $54, $C7, $0D, $94, $5D, $11, $FD, $D0, $44, $D6, $70, $4D, $91, $90, $28, $10
        defb $B3, $6A, $FF, $F6, $F8, $02, $30, $F9, $1A, $05, $F4, $FD, $EB, $DC, $4C, $90
        defb $D2, $95, $16, $A7, $0D, $63, $DC, $0D, $01, $0D, $29, $11, $FD, $B5, $22, $B1
        defb $01, $D3, $D3, $ED, $0D, $0C, $20, $DC, $4C, $0D, $A5, $BB, $FD, $61, $D9, $19
        defb $0B, $13, $D9, $10, $28, $57, $0B, $36, $A0, $37, $FD, $B4, $6D, $30, $37, $05
        defb $0B, $5D, $91, $DE, $08, $30, $83, $DE, $EC, $FF, $FF, $F4, $F8, $04, $30, $F9
        defb $19, $07, $F7, $FD, $EB, $4D, $CD, $EE, $CF, $DF, $2F, $DD, $39, $C6, $27, $02
        defb $81, $02, $94, $BB, $ED, $FD, $F7, $FD, $EB, $DC, $4C, $0D, $13, $6E, $A2, $0D
        defb $19, $47, $70, $DA, $52, $84, $C2, $FD, $D3, $5D, $95, $6D, $30, $D6, $10, $E3
        defb $E0, $0A, $53, $D6, $46, $A7, $DE, $EC, $FF, $F6, $F8, $02, $30, $F9, $16, $05
        defb $F4, $FD, $EB, $74, $99, $DC, $0D, $63, $21, $ED, $5E, $AD, $60, $D1, $B1, $36
        defb $FD, $4C, $20, $4D, $20, $DA, $57, $81, $7E, $E0, $DC, $4C, $FD, $DA, $19, $16
        defb $EA, $20, $28, $10, $D2, $59, $72, $02, $4F, $DD, $25, $6A, $0D, $61, $ED, $DC
        defb $4C, $0D, $56, $4D, $AD, $EE, $CF, $F0, $F6, $F8, $02, $30, $F9, $16, $05, $F4
        defb $FD, $DA, $37, $02, $83, $20, $16, $4C, $D3, $80, $24, $FD, $DA, $3D, $51, $0D
        defb $C4, $C0, $CD, $7D, $F0, $B5, $72, $16, $ED, $FD, $5E, $AD, $91, $0D, $34, $20
        defb $64, $0D, $64, $91, $FD, $DA, $57, $81, $7E, $D4, $D5, $DF, $DF, $DF, $DF, $FF
        defb $F2, $F8, $02, $30, $F9, $14, $03, $F6, $FD, $52, $EA, $70, $A1, $6D, $D5, $BD
        defb $E0, $EF, $36, $AF, $D8, $10, $D2, $11, $B7, $0D, $91, $9D, $C0, $D1, $4B, $AD
        defb $EF, $F0, $F7, $F8, $06, $30, $F9, $16, $06, $F2, $FD, $EF, $02, $81, $0D, $13
        defb $9D, $95, $6D, $30, $91, $3A, $70, $EF, $F5, $FD, $FD, $DA, $84, $74, $1D, $91
        defb $90, $D7, $CB, $B7, $FD, $1D, $BD, $13, $B5, $D0, $C9, $0D, $29, $4D, $60, $28
        defb $1F, $D7, $24, $61, $07, $83, $BB, $0D, $01, $0D, $55, $6D, $3F, $F0, $F2, $F8
        defb $02, $30, $F9, $17, $04, $F6, $FD, $1D, $BD, $13, $B5, $D0, $C9, $0D, $A4, $6E
        defb $A2, $0D, $0C, $AD, $31, $DE, $FD, $DC, $4C, $0D, $4C, $72, $0D, $13, $6E, $A2
        defb $0D, $31, $20, $3F, $DD, $34, $4A, $01, $64, $CD, $38, $0D, $39, $5D, $7D, $EF
        defb $F0, $F2, $F8, $02, $30, $F9, $14, $06, $F6, $FD, $DC, $4C, $90, $D3, $B4, $D9
        defb $10, $57, $0D, $3B, $C1, $AF, $D2, $40, $28, $10, $85, $B2, $DE, $0D, $A5, $28
        defb $03, $FD, $81, $3D, $91, $0D, $C4, $C0, $74, $46, $0D, $7C, $BB, $FD, $1D, $BD
        defb $13, $B5, $D0, $C9, $0D, $29, $11, $DE, $FD, $83, $5B, $0D, $55, $6D, $30, $A5
        defb $DD, $DD, $DC, $DE, $FF, $F2, $F8, $02, $30, $F9, $11, $03, $F6, $FD, $DC, $CD
        defb $1D, $5D, $E0, $52, $EA, $70, $72, $CD, $1D, $5F, $D2, $40, $DC, $4C, $90, $D3
        defb $B4, $D9, $1D, $EF, $F0, $F2, $F8, $02, $30, $F9, $13, $03, $F6, $FD, $DC, $4C
        defb $90, $D3, $B4, $D9, $1E, $A7, $07, $25, $BB, $FD, $72, $CD, $1D, $50, $24, $02
        defb $81, $08, $5B, $2D, $EF, $F0, $F2, $F8, $02, $30, $F9, $10, $03, $F6, $FD, $28
        defb $10, $A4, $49, $0D, $19, $13, $D5, $7F, $D7, $B4, $DA, $BD, $C0, $4D, $71, $6E
        defb $EE, $EE, $EF, $F0, $F2, $F8, $02, $30, $F9, $09, $02, $F6, $FD, $DC, $CD, $6D
        defb $6D, $CD, $ED, $ED, $EF, $F0, $F2, $F8, $02, $30, $F9, $0F, $03, $F6, $FD, $DC
        defb $4C, $0D, $1C, $20, $30, $B1, $3D, $2F, $D4, $D2, $D2, $02, $81, $0D, $0C, $78
        defb $EE, $EE, $FF, $F2, $F8, $02, $30, $F9, $0D, $03, $F6, $FD, $28, $10, $D1, $3C
        defb $BA, $94, $6F, $D5, $70, $B5, $2F, $F0, $F2, $F8, $02, $30, $F9, $12, $03, $F6
        defb $FD, $D3, $B1, $6A, $30, $D7, $4D, $77, $05, $2F, $D5, $62, $40, $28, $10, $D1
        defb $3C, $BA, $94, $6F, $F0, $F2, $F8, $02, $30, $F9, $11, $03, $F6, $FD, $DC, $4C
        defb $0D, $7B, $3D, $C0, $30, $D6, $19, $9D, $CF, $DA, $5D, $DD, $DD, $C0, $A5, $22
        defb $DC, $EE, $EE, $EE, $FF, $F2, $F8, $02, $30, $F9, $11, $03, $F6, $FD, $DC, $4C
        defb $09, $CD, $00, $28, $10, $B3, $D6, $D7, $FD, $DA, $52, $80, $28, $10, $AC, $72
        defb $19, $EE, $FF, $F2, $F8, $02, $30, $F9, $11, $04, $F6, $FD, $28, $19, $10, $57
        defb $03, $0B, $4C, $AF, $DE, $AD, $1B, $C6, $D5, $EA, $ED, $36, $A0, $28, $1F, $DB
        defb $1D, $91, $90, $72, $5D, $1D, $57, $FF, $F2, $F8, $02, $30, $F9, $12, $04, $F6
        defb $FD, $DC, $4C, $0D, $1C, $20, $28, $1F, $D9, $4D, $71, $0D, $0C, $20, $28, $10
        defb $D3, $43, $2F, $D7, $23, $DC, $70, $D7, $C2, $FF, $F2, $F8, $02, $30, $F9, $11
        defb $02, $F6, $FD, $DC, $4C, $08, $52, $02, $81, $0D, $34, $32, $FF, $F2, $F8, $02
        defb $30, $F9, $12, $03, $F6, $FD, $28, $10, $D3, $43, $20, $D0, $C2, $27, $FD, $28
        defb $10, $29, $4B, $BF, $F0, $F2, $F8, $02, $30, $F9, $12, $04, $F6, $FD, $D1, $B5
        defb $D1, $D5, $DE, $07, $4D, $61, $28, $56, $D3, $FD, $83, $D7, $D7, $16, $1A, $0D
        defb $A8, $16, $0D, $C4, $CF, $DD, $7C, $BB, $1A, $02, $81, $02, $49, $D1, $8D, $EF
        defb $F0, $F2, $F8, $02, $30, $F9, $13, $06, $F6, $FD, $DC, $4C, $0D, $13, $72, $0D
        defb $D3, $D5, $7E, $A0, $95, $6D, $3F, $D5, $62, $40, $28, $10, $B3, $D9, $3D, $E0
        defb $EF, $3F, $D2, $19, $95, $D0, $B1, $07, $D1, $91, $3D, $65, $6D, $3F, $D7, $4C
        defb $6A, $0D, $63, $9D, $57, $0D, $D3, $D5, $7E, $AF, $DD, $25, $63, $B0, $D7, $37
        defb $75, $6D, $3F, $F0, $F2, $F8, $02, $30, $F9, $10, $03, $F6, $FD, $DC, $4C, $0D
        defb $A5, $6A, $0C, $D7, $02, $81, $FD, $94, $D7, $1F, $F0, $F2, $F8, $02, $30, $F9
        defb $11, $02, $F6, $FD, $D5, $56, $D3, $02, $3D, $51, $70, $D8, $C1, $16, $FF, $F2
        defb $F8, $02, $30, $F9, $16, $03, $F6, $FD, $DC, $4C, $0D, $25, $BB, $02, $81, $0D
        defb $0C, $D1, $D5, $12, $FD, $DA, $52, $80, $84, $20, $D3, $1D, $C7, $19, $0D, $A3
        defb $21, $9F, $F0, $F2, $F8, $02, $30, $F9, $15, $04, $F6, $FD, $A3, $57, $DC, $0D
        defb $39, $4D, $A7, $0C, $62, $5B, $FD, $78, $10, $D2, $5B, $B7, $02, $81, $01, $62
        defb $59, $1F, $D9, $44, $D6, $DE, $FF, $F5, $F8, $02, $40, $F9, $17, $03, $F6, $FD
        defb $39, $10, $DC, $4C, $07, $C9, $10, $52, $EA, $7F, $D7, $3D, $21, $ED, $A5, $DD
        defb $DD, $DC, $DF, $FF, $F2, $F8, $04, $60, $F9, $13, $04, $F6, $FD, $A3, $57, $DC
        defb $0A, $95, $6D, $57, $02, $81, $FD, $D7, $42, $54, $60, $36, $A0, $78, $95, $6D
        defb $57, $FD, $24, $08, $19, $06, $49, $D6, $3B, $07, $5D, $D1, $FF, $F5, $F8, $14
        defb $38, $F9, $10, $05, $F6, $FD, $D3, $47, $8D, $E0, $50, $D2, $11, $BF, $D3, $BB
        defb $02, $5D, $77, $DC, $DE, $0D, $A8, $32, $FD, $30, $D2, $C6, $66, $DC, $02, $37
        defb $21, $DE, $FD, $EF, $85, $D1, $EF, $0A, $5D, $DD, $DD, $CE, $EE, $EE, $EE, $EF
        defb $FF, $4F, $80, $44, $8F, $90, $50, $2F, $3F, $DD, $C1, $7D, $FF, $FF, $5F, $80
        defb $C6, $0F, $91, $20, $3F, $6F, $DD, $A5, $BB, $0D, $C4, $C0, $EF, $85, $D1, $EF
        defb $EE, $EE, $EE, $FD, $D6, $39, $9D, $C0, $D6, $1D, $FD, $FD, $FF, $FF, $4F, $80
        defb $63, $0F, $91, $20, $4F, $3F, $D1, $9E, $EE, $E0, $CD, $6E, $EE, $EE, $E0, $83
        defb $A6, $EA, $2F, $DD, $C4, $C0, $D0, $12, $21, $90, $B5, $1F, $DA, $4D, $A6, $07
        defb $4D, $61, $DA, $81, $91, $DF, $FF, $F5, $F8, $0A, $48, $F9, $14, $03, $F6, $FD
        defb $3B, $95, $D3, $82, $DE, $08, $C9, $9D, $CF, $D8, $4D, $61, $0D, $6D, $C0, $A5
        defb $DD, $DD, $5D, $55, $67, $DE, $FF, $F4, $F8, $10, $58, $F9, $0F, $02, $F3, $FD
        defb $A5, $DD, $DD, $5D, $55, $67, $DF, $DF, $DF, $FF, $FF, $F2, $F8, $02, $30, $F9
        defb $1A, $06, $F6, $FD, $DD, $3D, $57, $EA, $0D, $39, $36, $AD, $64, $28, $19, $FD
        defb $D9, $3D, $6D, $75, $93, $0D, $05, $21, $70, $DC, $4C, $03, $6A, $FD, $D5, $5B
        defb $B7, $0D, $C4, $CD, $EE, $FD, $A8, $40, $73, $5A, $FD, $DC, $4C, $0D, $13, $6E
        defb $A2, $02, $13, $D1, $80, $DC, $4C, $9F, $DD, $39, $36, $AD, $64, $28, $19, $02
        defb $40, $7C, $D1, $D5, $01, $D3, $D3, $7D, $EF, $F0, $F2, $F8, $02, $30, $F9, $17
        defb $03, $F6, $FD, $DC, $4C, $0A, $95, $D9, $10, $28, $10, $29, $5A, $16, $2F, $DA
        defb $11, $D7, $05, $62, $40, $DD, $3D, $57, $EA, $08, $13, $92, $DE, $FF, $F6, $F8
        defb $0A, $40, $F9, $12, $06, $F2, $F8, $10, $74, $DC, $4C, $0B, $47, $10, $30, $B5
        defb $D2, $1D, $EF, $5F, $81, $25, $0F, $F0, $FD, $DC, $4C, $0D, $A1, $91, $0D, $0C
        defb $96, $2F, $DD, $0D, $C0, $28, $10, $D2, $B3, $D6, $17, $FF, $FD, $DC, $4C, $0D
        defb $A1, $91, $0D, $0C, $96, $2F, $DD, $0D, $C0, $28, $10, $B3, $D9, $3F, $F0, $FD
        defb $DC, $4C, $0D, $21, $BB, $05, $60, $28, $1F, $DD, $A3, $21, $90, $36, $A0, $A9
        defb $4D, $A6, $1A, $FF, $FD, $A5, $DD, $DD, $DC, $0D, $4C, $72, $0D, $01, $D1, $3D
        defb $61, $FD, $30, $D0, $45, $B1, $A0, $1D, $3D, $3D, $EF, $F0, $FD, $DC, $4C, $0D
        defb $34, $20, $D5, $5B, $B1, $AF, $DD, $0D, $C0, $30, $83, $9D, $7D, $CD, $EF, $F0
        defb $FD, $DC, $4C, $0D, $34, $20, $D5, $5B, $B1, $AF, $DD, $0D, $C0, $30, $D3, $84
        defb $72, $DE, $FF, $FD, $DC, $4C, $0D, $34, $20, $D3, $4D, $0D, $0B, $1A, $FD, $D0
        defb $DC, $02, $81, $09, $32, $DE, $FF, $FD, $28, $10, $29, $4B, $B0, $D5, $5D, $1D
        defb $51, $AF, $DD, $C4, $C0, $83, $9A, $DE, $FF, $FD, $DC, $4C, $0D, $34, $20, $72
        defb $9C, $D1, $D5, $FD, $D0, $DC, $0B, $5D, $38, $21, $65, $6D, $3D, $EF, $DE, $F8
        defb $4D, $A0, $78, $4D, $1D, $55, $6D, $3D, $EF, $F0, $FD, $DC, $4C, $0D, $34, $20
        defb $85, $20, $D0, $DC, $FD, $30, $D1, $4D, $14, $6C, $2D, $EF, $F0, $FD, $7D, $7B
        defb $32, $DE, $0D, $C4, $C0, $D3, $42, $FD, $85, $20, $D0, $DC, $07, $B5, $D6, $1D
        defb $EF, $F0, $FD, $30, $D6, $47, $D8, $C5, $24, $FD, $D0, $52, $0D, $C4, $CD, $EF
        defb $F0, $FD, $30, $91, $A0, $D7, $3D, $A6, $FD, $D1, $3D, $72, $C9, $1A, $0D, $C4
        defb $CD, $EF, $F0, $FD, $30, $D2, $B3, $D6, $10, $7D, $75, $95, $2F, $DD, $29, $3D
        defb $DD, $DB, $1A, $0D, $C4, $CD, $EF, $F0, $FD, $30, $D9, $3D, $6D, $75, $91, $0D
        defb $03, $2F, $DD, $05, $20, $DC, $4C, $DE, $FF, $FD, $D9, $3D, $6D, $75, $93, $FD
        defb $D0, $52, $0D, $C4, $CD, $EF, $F0, $FD, $D8, $C1, $16, $02, $3D, $51, $70, $D7
        defb $3D, $A6, $FF, $FD, $DC, $4C, $0D, $A1, $91, $07, $D8, $C5, $AD, $31, $AF, $DD
        defb $0D, $C0, $A3, $57, $DC, $DE, $FF, $FD, $DC, $4C, $0D, $A1, $91, $05, $D6, $D7
        defb $3B, $1A, $FD, $46, $03, $07, $D7, $5D, $51, $DE, $FF, $F5, $F8, $10, $40, $F9
        defb $0C, $05, $F3, $FD, $DA, $1B, $B0, $A4, $61, $DE, $F6, $FD, $FD, $DC, $4C, $0D
        defb $24, $C6, $A0, $3F, $DA, $53, $D6, $46, $AD, $EF, $F0
        ; End of unknown area $EA2A to $FA0A


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


 
