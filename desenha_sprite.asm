desenha_sprite:
	ld a, (data_9D26)
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
	ld (data_8FAD), a
	ld (data_9002), a
	ld a, (sprite_left)
	sub e

	_if_not nc
		neg
		ld b, a
		and $01
		ld (data_9002), a
		ld a, (largura_sprite_a_desenhar_copy)
		sub b
		ld (largura_sprite_a_desenhar_copy), a
		ld a, (sprite_left_copy)
		add a, b
		ld (sprite_left_copy), a
		ld a, b
		srl a
		ld (data_8FAD), a
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
		ld a, (data_8FAD)
		add a, b
		ld (data_8FAD), a

	_end_if

	ld hl, $2313
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
		ld a, (data_8FAD)
		neg
		add a, b
		ld (data_8FAD), a
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
	ld de, (sprit_actual_byte_to_draw)
	ld a, (sprite_left_copy)
	sub $20
	srl a

	_if_not c
		ld ($8F9B), a
		ld a, (data_9002)
		and a
		ld a, ($8F9B)
		
		if_not nz 
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
				ld bc, (data_8FAD) ; dado dinamico

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
		_end_if
	_end_if

 
	ld ($8FFE), a
	ld a, (data_8FAD)
	ld ($900F), a
	ld hl, function_9041
	ld a, (background_color)
	and a
	ld a, (sprite_espelho)

	_if_not z
		ld hl, function_901d
		and a


		if_not z
			ld hl, function_9074
		_end_if


	      
	_else 
		and a

		_if_not z
			ld hl, function_90a4
		_end_if
	_end_if


	ld (data_900B), hl


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
		call (data_900B) ; codigo dinamico inicial: function_901d
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


function_9041:
	ld a, ($9B31)
	and a
	_if_not z
                ld a, (de)
                rlca
                rlca
                rlca
                rlca
                ld (data_8E49), a
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
                        ld (data_8E49), a

                        
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
                        ld a, (data_8E49)
                        and $F0
                        add a, c
                        ld (hl), a
                        inc de
	_djnz
	ret


function_9074:
	ld a, ($9B31)
	and a
	if_not z
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

	_if_n z

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
                ld (data_8E49), a


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
                        ld (data_8E49), a


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
                        ld a, (data_8E49)
                        and $F0
                        add a, c
                        ld (hl), a
                        dec de
	_djnz

	ret


 
 
