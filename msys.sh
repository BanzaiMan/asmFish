#!/bin/sh

export PATH=.:/mingw64/bin:/usr/local/bin:/mingw/bin:/bin
export

cd src

make profile-build COMP=mingw ARCH=x86-64-bmi2
strip stockfish.exe
