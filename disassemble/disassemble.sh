
taput extract -s 4 original/MagiclandDizzy-original.tap original/01.bin
taput extract -s 5 original/MagiclandDizzy-original.tap original/02.bin
taput extract -s 6 original/MagiclandDizzy-original.tap original/03.bin
taput extract -s 7 original/MagiclandDizzy-original.tap original/04.bin
taput extract -s 8 original/MagiclandDizzy-original.tap original/05.bin



perl disassemble/disasemble_01.pl > source/01.asm
perl disassemble/disasemble_03.pl > source/03.asm
perl disassemble/disasemble_04.pl > source/04.asm
perl disassemble/disasemble_05.pl > source/05.asm
 