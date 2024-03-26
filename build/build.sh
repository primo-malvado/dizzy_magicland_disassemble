rm dist/dizzy.tap
rm dist/*.bin



sjasmplus build/01_container.asm
sjasmplus build/03_container.asm
sjasmplus build/04_container.asm
sjasmplus build/05_container.asm



bas2tap -a -s"Dizzy_4" source/00.bas

mv source/00.tap dist/dizzy.tap

taput add -o 24000 -n "Diz_Load"   dist/01.bin  dist/dizzy.tap

#screen
taput add  original/02.bin  dist/dizzy.tap 


taput add  dist/03.bin  dist/dizzy.tap
taput add  dist/04.bin  dist/dizzy.tap
taput add  dist/05.bin  dist/dizzy.tap


sh compare/compare.sh

# fuse dist/dizzy.tap