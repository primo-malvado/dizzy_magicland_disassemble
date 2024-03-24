# Disassemble the Dizzy Magickland ZX Spectrum Game

This project aims to disassemble the code of the Dizzy Magickland game for the ZX Spectrum. 

In the build preocess we create a tap file with the same structure as the original game.

## Tools Used
- **TAPut**: A tool for manipulating TAP files, commonly used in ZX Spectrum development.

- **Perl**: A scripting language used for disassembling.

- **SJASMPlus**: An enhanced version of the SJASM Z80 cross-assembler.

- **BAS2TAP**: A tool for converting BASIC source code to TAP files for ZX Spectrum.

- **Fuse**: A ZX Spectrum emulator.


## How to Disassemble

**Run Disassembly Script**: Execute the following command to initiate the disassembly process:

```bash

    sh disassemble/disassemble.sh
```

This script will extract the game files in the source folder, disassemble the code using CPU::Z80::Disassembler perl library, and generate the disassembled output.


## Creating the Ficheiro TAP

**Run Build Script**: Execute the following command to build a tap file:

```bash

    sh build/build.sh
```

This script will build a new tap file with the game.




## Contributions
Contributions to this project are welcome. If you have suggestions for improvements or find any issues, please open an issue or submit a pull request on GitHub.

## License
This project is licensed under the [MIT License](LICENSE).
