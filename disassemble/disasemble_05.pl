

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;

 
$dis->memory->load_file("original/05.bin", 0xc000);

$dis->write_asm;
