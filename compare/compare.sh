perl compare/disasemble_original.pl > compare/original.asm
perl compare/disasemble_dist.pl > compare/dist.asm

meld compare/original.asm compare/dist.asm
 