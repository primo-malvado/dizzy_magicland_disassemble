

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;

 
$dis->memory->load_file("original/03.bin", 0x5E49);
$dis->memory->load_file("original/04.bin", 0xb000);



# $dis->code(0x5E5E, "start");
# $dis->code(0x7291, "restart_game");


# $dis->code(0x9689, "function_nome_nivel"); 
 





 

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

# $dis->code(0x7A6A, "function_7A6A");
# $dis->code(0x7B6E, "function_7B6E");
# $dis->code(0x7B85, "function_7B85");
# $dis->code(0x7B9C, "function_7B9C");
# $dis->code(0x7BBA, "function_7BBA");
# $dis->code(0x7BC6, "function_7BC6");
# $dis->code(0x7C23, "function_7C23");
# $dis->code(0x7C4D, "function_7C4D");
# $dis->code(0x7C4E, "function_7C4E");
# $dis->code(0x7C56, "function_7C56");
# $dis->code(0x7C9B, "function_7C9B");
# $dis->code(0x7CF0, "function_7CF0");
# $dis->code(0x7D43, "function_7D43");
# $dis->code(0x7D74, "function_7D74");
# $dis->code(0x7D7A, "function_7D7A");
# $dis->code(0x7DB1, "function_7DB1");
# $dis->code(0x7DFA, "function_7DFA");
# $dis->code(0x7E57, "function_7E57");
# $dis->code(0x7E8F, "function_7E8F");
# $dis->code(0x7E94, "function_7E94");
# $dis->code(0x7F26, "function_7F26");
# $dis->code(0x8091, "function_8091");
# $dis->code(0x809C, "function_809C");
# $dis->code(0x8107, "function_8107");
# $dis->code(0x8134, "function_8134");
# $dis->code(0x8189, "function_8189");
# $dis->code(0x81C4, "function_81C4");
# $dis->code(0x81F8, "function_81F8");
# $dis->code(0x822D, "function_822D");
# $dis->code(0x8268, "function_8268");
# $dis->code(0x8298, "function_8298");
# $dis->code(0x82D8, "function_82D8");
# $dis->code(0x8306, "function_8306");
# $dis->code(0x833F, "function_833F");
# $dis->code(0x834B, "function_834B");
# $dis->code(0x83A6, "function_83A6");
# $dis->code(0x83B4, "function_83B4");
# $dis->code(0x862C, "function_862C");
# $dis->code(0x8637, "function_8637");
# $dis->code(0x8737, "function_8737");
# $dis->code(0x880C, "function_880C");
# $dis->code(0x887D, "function_887D");



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

# $dis->code(0x8dad, 'colocar_attributos_de_cor'); 


# $dis->code(0x9370, 'verifica_se_clicaram_tecla'); 
# $dis->code(0x940b, "janela_do_jogo_preto"); 

# $dis->code(0x7300, "after_call_force_disassemle_001"); 
# $dis->code(0x73b4, "after_call_force_disassemle_002"); 
# $dis->code(0x9e63, "after_call_force_disassemle_003"); 
# $dis->code(0x9e6d, "after_call_force_disassemle_004"); 
# $dis->code(0xa292, "after_call_force_disassemle_005"); 

 
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
$dis->defb(0x9B29, 1, 'primeiro_byte_da_sprite_a_desenhar');

$dis->defw(0x9CB5, 1, 'screen_memory_hero_top_line');
$dis->defb(0x9B2F, 1, 'altura_sprite_a_desenhar_copy');
$dis->defb(0x9B30, 1, 'largura_sprite_a_desenhar_copy');

$dis->defb(0x9d0d, 1, 'posicao_hero_x_em_nibbles_copia_2');

$dis->defb(0x9d0f, 1, 'posicao_hero_x_em_nibbles_copia');
$dis->defb(0x9d24, 1, 'nivel_copy');
$dis->defb(0x9B32, 1, 'sprite_top_copy');

$dis->defb(0x9B33, 1, 'sprite_left_copy');



$dis->defb(0x8444, 40, 'area_negra');

$dis->defb(0xA2FB, (0xA37A-0xA2FB + 1), "numero_de_sprites_por_nivel"); 


$dis->defb(0x9222, 1 , "indice_letras"); 

 
# $dis->code(0x88f2, 'prepara_dados_mapa'); 
# $dis->code(0x94f6, 'desenha_nivel');  



# $dis->code(0x8D34, 'coloca_em_de_hl_6020_B800'); 
# $dis->code(0x8D22, 'coloca_em_de_hl_5E22_B830'); 
# $dis->code(0x925D, 'get_first_or_second_nibble'); 
# $dis->code(0x9281, 'desenha_uma_letra_no_ecra'); 




$dis->defb(0x9B3F, 1, 'valor_inicia_do_a_20'); 
$dis->defb(0x927F, 1, 'valor_inicia_do_a_21'); 
$dis->defw(0x927D, 1, 'posicao_onde_comeca_o_nome_do_nivel'); 


$dis->defb(0x9B2B, 1, 'valor_de'); 
$dis->defb(0x9B2D, 1, 'valor_hl'); 




$dis->defb(0xc40f, 1, "sprite_0"); 
$dis->defw(0xc20f, 1, "index_de_sprites"); 
$dis->defb(0xea29, 1, "after_sprites");  
$dis->defb(0xfb97, 1, 'nomes_niveis'); 
$dis->defb(0xfa0b, 1, 'inicio_qq_usado_em_9725'); 
# $dis->code(0xff01, 'playsound'); 
$dis->defb(0xff2c, 4, 'sons'); 
$dis->defb(0xfe00, 1 , "lista_de_fd"); 


# $dis->code(0x88F1, 'function_88F1'); 


$dis->write_asm;
