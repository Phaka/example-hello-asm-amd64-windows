# Hello World in x64 Assembly (Windows)

A minimal Hello World implementation in x64 assembly for 64-bit Windows systems.

## Installation

### Windows
1. Install Visual Studio Build Tools (for ML64.exe and LINK.exe)
2. Install NASM from https://www.nasm.us/

## Building and Running

```batch
:: Assemble
nasm -f win64 hello.asm

:: Link (using Visual Studio's linker)
link /subsystem:console hello.obj

:: Run
hello.exe
```

## Code Explanation

The program demonstrates key aspects of Windows x64 assembly:
- Uses Microsoft x64 calling convention (parameters in RCX, RDX, R8, R9)
- Maintains required 16-byte stack alignment
- Allocates mandatory shadow space for API calls
- Uses RIP-relative addressing for data access

The implementation uses the Windows Console API:
1. GetStdHandle retrieves the console output handle
2. WriteConsoleA writes the message to the console
3. ExitProcess terminates the program

Note: This code specifically targets Windows x64 and cannot run on 32-bit Windows systems. For older Windows versions, see the 32-bit or 16-bit implementations.
