

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;

 
$dis->memory->load_file("dist/03.bin", 0x5E49);
$dis->memory->load_file("dist/04.bin", 0xb000);


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


$dis->code(0x9041, "function_9041");
$dis->code(0x901d, "function_901d");
$dis->code(0x9074, "function_9074");
$dis->code(0x90a4, "function_90a4");



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

 

$dis->write_asm;
