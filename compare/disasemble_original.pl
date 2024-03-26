

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;

 
$dis->memory->load_file("original/03.bin", 0x5E49);
$dis->memory->load_file("original/04.bin", 0xb000);

$dis->code(0x5E5E, "start");

$dis->write_asm;
