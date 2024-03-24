

use CPU::Z80::Disassembler;
$dis = CPU::Z80::Disassembler->new;
$dis->memory->load_file("original/01.bin", 0x5DC0);

$dis->code(0x5DC0, "load_tape");
$dis->code(0x5DD2, "load_tape_01");

$dis->write_asm;
