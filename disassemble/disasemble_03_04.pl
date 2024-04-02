

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;

 
$dis->memory->load_file("original/03.bin", 0x5E49);
$dis->memory->load_file("original/04.bin", 0xb000);



$dis->code(0x5E5E, "start");
$dis->code(0x7291, "restart_game");


 $dis->code(0x9689, "function_nome_nivel"); 
 





 

$dis->defw(0x79d4, (0x7A1A-0x79d4)/2, "function_index"); 
$dis->defw(0x7A1A, (0x7A6A-0x7A1A)/2, "function_index_04"); 


$dis->defb(0xa297, 0xa2fb-0xa297, "stack"); 



$dis->defw(0x6044, 39, 'index_mask_image_hero');

$dis->defw(0x6092, 1, "mask_images_hero"); 





$dis->defw(0x7bd9, 4, "function_index_02"); 

# $dis->code(0x7be1, "function_index_02_01");
# $dis->code(0x7bef, "function_index_02_02");
# $dis->code(0x7c04, "function_index_02_03");
# $dis->code(0x7c13, "function_index_02_04");

$dis->defw(0x8740, 3, "function_index_03"); 
# $dis->code(0x8746, "function_index_03_01");
# $dis->code(0x8770, "function_index_03_02");
# $dis->code(0x8779, "function_index_03_03");


$init = 0x7470;

for (my $i = 0; $i < 92; $i++) {
    $dis->defb(0x7470+$i*15, 15, "dados_mapa_".$i); 
}

$dis->code(0x7A6A, "function_7A6A");
$dis->code(0x7B6E, "function_7B6E");
$dis->code(0x7B85, "function_7B85");
$dis->code(0x7B9C, "function_7B9C");
$dis->code(0x7BBA, "function_7BBA");
$dis->code(0x7BC6, "function_7BC6");
$dis->code(0x7C23, "function_7C23");
$dis->code(0x7C4D, "function_7C4D");
$dis->code(0x7C4E, "function_7C4E");
$dis->code(0x7C56, "function_7C56");
$dis->code(0x7C9B, "function_7C9B");
$dis->code(0x7CF0, "function_7CF0");
$dis->code(0x7D43, "function_7D43");
$dis->code(0x7D74, "function_7D74");
$dis->code(0x7D7A, "function_7D7A");
$dis->code(0x7DB1, "function_7DB1");
$dis->code(0x7DFA, "function_7DFA");
$dis->code(0x7E57, "function_7E57");
$dis->code(0x7E8F, "function_7E8F");
$dis->code(0x7E94, "function_7E94");
$dis->code(0x7F26, "function_7F26");
$dis->code(0x8091, "function_8091");
$dis->code(0x809C, "function_809C");
$dis->code(0x8107, "function_8107");
$dis->code(0x8134, "function_8134");
$dis->code(0x8189, "function_8189");
$dis->code(0x81C4, "function_81C4");
$dis->code(0x81F8, "function_81F8");
$dis->code(0x822D, "function_822D");
$dis->code(0x8268, "function_8268");
$dis->code(0x8298, "function_8298");
$dis->code(0x82D8, "function_82D8");
$dis->code(0x8306, "function_8306");
$dis->code(0x833F, "function_833F");
$dis->code(0x834B, "function_834B");
$dis->code(0x83A6, "function_83A6");
$dis->code(0x83B4, "function_83B4");
$dis->code(0x862C, "function_862C");
$dis->code(0x8637, "function_8637");
$dis->code(0x8737, "function_8737");
$dis->code(0x880C, "function_880C");
$dis->code(0x887D, "function_887D");



$dis->code(0x9041, "function_9041");
$dis->code(0x901d, "function_901d");
$dis->code(0x9074, "function_9074");
$dis->code(0x90a4, "function_90a4");




# $dis->code(0x9BE6, 'rotate_hero_image_4_bits_to_the_right'); 
# $dis->code(0x9422, "copia_color_attributes_para_ecra");
# $dis->code(0x90e3, "limpa_a_area_de_jogo"); 



$dis->defb(0x7cc7, 8, "index_001"); 
$dis->defb(0xA37b, 1, "sprites_dos_niveis"); 

$dis->defb(0x7faf, 12, "list_003"); 


$dis->defb(0x9CB0, 1, 'altura_do_novo_boneco'); 
$dis->defb(0x9b27, 1, 'background_color'); 
$dis->code(0x8e4a, 'desenha_sprite'); 
$dis->defb(0x9b28, 1, 'sprite_espelho'); 
$dis->defb(0x9b24, 1, 'apenas_brite_and_ink'); 


$dis->defb(0x9d23, 1, 'nivel'); 
$dis->defb(0x728E, 1, 'after_mask_images'); 


$dis->defb(0x9b22, 1, 'sprite_left'); 
$dis->defb(0x9b23, 1, 'sprite_top'); 

# $dis->code(0x8986, 'function_jump_to_hl_plus_2a'); 

$dis->defb(0x9d43, 1, 'sound_to_play'); 

$dis->code(0x8dad, 'colocar_attributos_de_cor'); 


$dis->code(0x9370, 'verifica_se_clicaram_tecla'); 
$dis->code(0x940b, "janela_do_jogo_preto"); 

$dis->code(0x7300, "after_call_force_disassemle_001"); 
$dis->code(0x73b4, "after_call_force_disassemle_002"); 
$dis->code(0x9e63, "after_call_force_disassemle_003"); 
$dis->code(0x9e6d, "after_call_force_disassemle_004"); 
$dis->code(0xa292, "after_call_force_disassemle_005"); 

 
$dis->defb(0x95a5, 1, 'sprites_repetidos'); 
$dis->defb(0x95a4, 1, 'posicao_atual_index_001'); 
$dis->defb(0x95a3, 1, 'valor_atual_index_001'); 
$dis->defb(0x9d1a, 1, 'posicao_hero_x_em_nibbles'); 
$dis->defb(0x9d1c, 1, 'sera_o_nivel_copia_3'); 
$dis->defb(0x9d15, 1, 'frame_movimento_do_hero'); 
 
# $dis->code(0x8D5C, 'function_print_sprite'); 
$dis->defb(0x9CB2, 1, 'linha_debaixo_onde_se_desenha_o_boneco'); 
$dis->defb(0x9CB7, 1, 'hero_left_position_in_nibbles'); 

$dis->defb(0x9B21, 1, 'next_sprite_index');
$dis->defb(0x9B25, 1, 'largura_sprite_a_desenhar');
$dis->defb(0x9B26, 1, 'altura_sprite_a_desenhar');
$dis->defb(0x9B29, 1, 'sprit_actual_byte_to_draw');

$dis->defw(0x9CB5, 1, 'screen_memory_hero_top_line');
$dis->defb(0x9B2F, 1, 'altura_sprite_a_desenhar_copy');
$dis->defb(0x9B30, 1, 'largura_sprite_a_desenhar_copy');

$dis->defb(0x9d0d, 1, 'data_9d0d');

$dis->defb(0x9d0f, 1, 'posicao_hero_x_em_nibbles_copia');
$dis->defb(0x9d24, 1, 'nivel_copy');
$dis->defb(0x9B32, 1, 'sprite_top_copy');

$dis->defb(0x9B33, 1, 'sprite_left_copy');



$dis->defb(0x8444, 40, 'area_negra');

$dis->defb(0xA2FB, (0xA37A-0xA2FB + 1), "numero_de_sprites_por_nivel"); 


$dis->defb(0x9222, 1 , "indice_letras"); 

 
$dis->code(0x88f2, 'prepara_dados_mapa'); 
$dis->code(0x94f6, 'desenha_nivel');  



$dis->code(0x8D34, 'coloca_em_de_hl_6020_B800'); 
$dis->code(0x8D22, 'coloca_em_de_hl_5E22_B830'); 
$dis->code(0x925D, 'get_first_or_second_nibble'); 
$dis->code(0x9281, 'desenha_uma_letra_no_ecra'); 




$dis->defb(0x9B3F, 1, 'valor_inicia_do_a_20'); 
$dis->defb(0x927F, 1, 'valor_inicia_do_a_21'); 
$dis->defw(0x927D, 1, 'posicao_onde_comeca_o_nome_do_nivel'); 


$dis->defb(0x9B2B, 1, 'valor_de'); 
$dis->defb(0x9B2D, 1, 'valor_hl'); 




$dis->defb(0xc40f, 1, "sprite_0"); 
$dis->defw(0xc20f, 1, "index_de_sprites"); 
$dis->defb(0xea29, 1, "texts");  
$dis->defb(0xfb97, 1, 'nomes_niveis'); 
#$dis->defb(0xfa0b, 1, 'inicio_qq_usado_em_9725'); 
# $dis->code(0xff01, 'playsound'); 
$dis->defb(0xff2c, 4, 'sons'); 
$dis->defb(0xfe00, 1 , "lista_de_fd"); 


# $dis->code(0x88F1, 'function_88F1'); 

##############################
 
# $dis->defb(0x743E, 1, "data_743E");

 

$dis->defb(0x74CF, 1, "data_74CF");
$dis->defb(0x74D3, 1, "data_74D3");
$dis->defb(0x74E2, 1, "data_74E2");
$dis->defb(0x7509, 1, "data_7509");
$dis->defb(0x7518, 1, "data_7518");
$dis->defb(0x7527, 1, "data_7527");
$dis->defb(0x7536, 1, "data_7536");
$dis->defb(0x75AD, 1, "data_75AD");
$dis->defb(0x75C0, 1, "data_75C0");
$dis->defb(0x75F8, 1, "data_75F8");
$dis->defb(0x75FB, 1, "data_75FB");
$dis->defb(0x75FC, 1, "data_75FC");
$dis->defb(0x76D2, 1, "data_76D2");
$dis->defb(0x778D, 1, "data_778D");
$dis->defb(0x7794, 1, "data_7794");
$dis->defb(0x77A4, 1, "data_77A4");
$dis->defb(0x77B9, 1, "data_77B9");
$dis->defb(0x77E0, 1, "data_77E0");
$dis->defb(0x781B, 1, "data_781B");
$dis->defb(0x785F, 1, "data_785F");
$dis->defb(0x7893, 1, "data_7893");
$dis->defb(0x791A, 1, "data_791A");
$dis->defb(0x7929, 1, "data_7929");
$dis->defb(0x7974, 1, "data_7974");


$dis->defb(0x848C, 1, 'data_848C');
$dis->defb(0x84C0, 1, 'data_84C0');
$dis->defb(0x8627, 1, 'data_8627');
$dis->defb(0x8628, 1, 'data_8628');
$dis->defb(0x8629, 1, 'data_8629');
$dis->defb(0x862B, 1, 'data_862B');
# $dis->defb(0x893E, 1, 'data_893E');
$dis->defb(0x8B7D, 1, 'data_8B7D');
$dis->defb(0x8B85, 1, 'data_8B85');
$dis->defb(0x8B86, 1, 'data_8B86');
$dis->defb(0x8D1F, 1, 'data_8D1F');
$dis->defb(0x8D20, 1, 'data_8D20');
# $dis->defb(0x8DC1, 1, 'data_8DC1');
# $dis->defb(0x8DCB, 1, 'data_8DCB');
# $dis->defb(0x8DCC, 1, 'data_8DCC');
$dis->defb(0x8E49, 1, 'data_8E49');
# $dis->defb(0x8F9B, 1, 'data_8F9B');
# $dis->defb(0x8FA4, 1, 'data_8FA4');
# $dis->defb(0x8FA5, 1, 'data_8FA5');
# $dis->defb(0x8FA7, 1, 'data_8FA7');
# $dis->defb(0x8FAD, 1, 'data_8FAD');
# $dis->defb(0x8FFE, 1, 'data_8FFE');
# $dis->defb(0x9002, 1, 'data_9002');
# $dis->defb(0x900B, 1, 'data_900B');
# $dis->defb(0x900F, 1, 'data_900F');
# $dis->defb(0x9113, 1, 'data_9113');
# $dis->defb(0x92CC, 1, 'data_92CC');
# $dis->defb(0x9324, 1, 'data_9324');
# $dis->defb(0x9357, 1, 'data_9357');
# $dis->defb(0x935F, 1, 'data_935F');
# $dis->defb(0x9363, 1, 'data_9363');
# $dis->defb(0x9390, 1, 'data_9390');
# $dis->defb(0x9394, 1, 'data_9394');
# $dis->defb(0x93A8, 1, 'data_93A8');
$dis->defb(0x9409, 1, 'data_9409');
$dis->defb(0x940A, 1, 'data_940A');
$dis->defb(0x9819, 1, 'data_9819');
$dis->defb(0x99BD, 1, 'data_99BD');
$dis->defb(0x99BF, 1, 'data_99BF');
$dis->defb(0x99C1, 1, 'data_99C1');
$dis->defb(0x99C2, 1, 'data_99C2');
$dis->defb(0x99C3, 1, 'data_99C3');
$dis->defb(0x9B31, 1, 'data_9B31');
$dis->defb(0x9B3C, 1, 'data_9B3C');
$dis->defb(0x9B3D, 1, 'level_name_spacement');
$dis->defb(0x9B3E, 1, 'data_write_level_name_01');
# $dis->defb(0x9C91, 1, 'data_9C91');
$dis->defb(0x9CB1, 1, 'data_9CB1');
$dis->defb(0x9CB3, 1, 'data_9CB3');
$dis->defb(0x9CB8, 1, 'data_9CB8');
$dis->defb(0x9CB9, 1, 'data_9CB9');
$dis->defb(0x9D4A, 1, 'data_9D4A');
$dis->defb(0x9D4B, 1, 'data_9D4B');
$dis->defb(0x9D4C, 1, 'data_9D4C');
$dis->defb(0xFDC6, 1, 'data_FDC6');
$dis->defb(0xFF3D, 1, 'data_FF3D');
# $dis->defb(0xFFFF, 1, 'data_FFFF');



$dis->defb(0xFF9C, 1, 'data_FF9C');
$dis->defb(0xF85E, 1, 'data_F85E');
$dis->defb(0xF231, 1, 'data_F231');
$dis->defb(0xFF8B, 1, 'data_FF8B');
$dis->defb(0xFF93, 1, 'data_FF93');
$dis->defb(0xFF77, 1, 'empty_string_for_level_name');
$dis->defb(0xfa0b, 1, 'data_fa0b');
$dis->defb(0xFA5F, 1, 'data_FA5F');
$dis->defb(0xFA20, 1, 'data_FA20');
$dis->defb(0xFA7A, 1, 'data_FA7A');
$dis->defb(0x7475, 1, 'data_7475');

$dis->defb(0xF605, 1, 'data_F605');
$dis->defb(0xF41E, 1, 'data_F41E');
$dis->defb(0xF451, 1, 'data_F451');
$dis->defb(0xF15B, 1, 'data_F15B');
$dis->defb(0xF1F7, 1, 'data_F1F7');
$dis->defb(0xF68B, 1, 'data_F68B');
$dis->defb(0xF7EB, 1, 'data_F7EB');
$dis->defb(0xF5ED, 1, 'data_F5ED');
$dis->defb(0xF593, 1, 'data_F593');


$dis->defb(0xF349, 1, 'data_F349');
$dis->defb(0xF388, 1, 'data_F388');
$dis->defb(0xEE82, 1, 'data_EE82');
$dis->defb(0xF9EB, 1, 'data_F9EB');

$dis->defb(0xF495, 1, 'data_F495');
$dis->defb(0xF4B5, 1, 'data_F4B5');


$dis->defb(0xF9D7, 1, "data_F9D7");
$dis->defb(0xF919, 1, "data_F919");
$dis->defb(0xF93A, 1, "data_F93A");
$dis->defb(0xF8CC, 1, "data_F8CC");
$dis->defb(0xF9B7, 1, "data_F9B7");
$dis->defb(0xF9A9, 1, "data_F9A9");
$dis->defb(0xF94D, 1, "data_F94D");
$dis->defb(0xF962, 1, "data_F962");
$dis->defb(0xF998, 1, "data_F998");
$dis->defb(0xF983, 1, "data_F983");
$dis->defb(0xF8E0, 1, "data_F8E0");
$dis->defb(0xF971, 1, "data_F971");
$dis->defb(0xF8F3, 1, "data_F8F3");
$dis->defb(0xF919, 1, "data_F919");
$dis->defb(0xF88C, 1, "data_F88C");
$dis->defb(0xF8B4, 1, "data_F8B4");
$dis->defb(0xF89F, 1, "data_F89F");
$dis->defb(0xF878, 1, "data_F878");


$dis->defb(0xF0B1, 1, 'data_F0B1');
$dis->defb(0xF19D, 1, 'data_F19D');
$dis->defb(0xED4B, 1, 'data_ED4B');
$dis->defb(0xEC64, 1, 'data_EC64');
$dis->defb(0xF290, 1, 'data_F290');
$dis->defb(0xEBE6, 1, 'data_EBE6');



$dis->defb(0xFBB1, 1, 'data_FBB1');
$dis->defb(0xFC69, 1, 'data_FC69');
$dis->defb(0xFC92, 1, 'data_FC92');
$dis->defb(0xFD56, 1, 'data_FD56');

$dis->defb(0xfa3d, 1, 'data_fa3d');
$dis->defb(0xf723, 1, 'data_f723');
$dis->defb(0x781d, 1, 'data_781d');

$dis->code(0x81cf, "function_81cf");
$dis->code(0x8471, "function_8471");
$dis->code(0x847d, "function_847d");
$dis->code(0x85b5, "function_85b5");
$dis->code(0x9833, "l_9833");
$dis->code(0x9839, "l_9839");




$dis->code(0x8393+5, "l_8393_5");
$dis->code(0x848d+5, "l_848d_5");
$dis->code(0x84aa+5, "l_84aa_5");
$dis->code(0x84c0+5, "l_84c0_5");


$dis->code(0x8510+5, "l_8510_5");
$dis->code(0x8521+5, "l_8521_5");
$dis->code(0x856e+5, "l_856e_5"); 
$dis->code(0x8592+5, "l_8592_5");
$dis->code(0x85ec+5, "l_85ec_5");

$dis->code(0x87a1+5, "l_87a1_5"); 


$dis->code(0x87d8+5, "l_87d8_5");
$dis->code(0x87f4+5, "l_87f4_5");

$dis->code(0x883c+5, "l_883c_5");


$dis->defb(0x84aa, 1, "data_84aa");
$dis->defb(0x856e, 1, "data_856e");
$dis->defb(0x87a1, 1, "data_87a1");
# $dis->defb(0x84c0, 1, "data_84c0");
$dis->defb(0x8521, 1, "data_8521");
$dis->defb(0x8521, 1, "data_8521");
$dis->defb(0x8521, 1, "data_8521");
$dis->defb(0x8521, 1, "data_8521");
$dis->defb(0x87a1, 1, "data_87a1");
$dis->defb(0x883c, 1, "data_883c");
$dis->defb(0x883c, 1, "data_883c");
$dis->defb(0x85b0, 1, "data_85b0");
$dis->defb(0x848d, 1, "data_848d");
$dis->defb(0x85ec, 1, "data_85ec");
$dis->defb(0x87d8, 1, "data_87d8");
$dis->defb(0x87f4, 1, "data_87f4");
$dis->defb(0x8592, 1, "data_8592");
$dis->defb(0x8510, 1, "data_8510");




$dis->defb(0xf9c3, 1, "data_f9c3");
$dis->defb(0xf6c3, 1, "data_f6c3");
$dis->defb(0xf6e7, 1, "data_f6e7");






$dis->write_asm;
