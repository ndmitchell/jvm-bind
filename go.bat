@echo off
REM Put cabal-1.24 on the PATH
set PATH=C:\bin;%PATH%
cabal --version

set JAVA=C:\Program Files (x86)\Java\jdk1.8.0_91
set GHC=C:\ghc\ghc-8.0.0.20160421-32
set PATH=%GHC%\bin;%GHC%\mingw\bin;%JAVA%\jre\bin\server;%PATH%

mkdir obj32
echo == 32 bit C ==
gcc -c C.c -o obj32/c.o -c "-I%JAVA%\include" "-I%JAVA%\include\win32" && ^
gcc obj32/c.o -o obj32/c.exe -ljvm "-L%JAVA%\lib" && ^
C.exe

echo == 32 bit Haskell ==
ghc --make Haskell.hs -ljvm "-L%JAVA%\lib" && Haskell.exe

set JAVA=C:\Program Files\Java\jdk1.8.0_91
set GHC=C:\ghc\ghc-8.0.0.20160421-64
set PATH=%GHC%\bin;%GHC%\mingw\bin;%JAVA%\jre\bin\server;%PATH%

mkdir obj64
echo == 64 bit C ==
gcc -c C.c -o obj64/c.o -c "-I%JAVA%\include" "-I%JAVA%\include\win32" && ^
gcc obj64/c.o -o obj64/c.exe -ljvm "-L%JAVA%\lib" && ^
C.exe

echo == 64 bit Haskell ==
ghc --make Haskell.hs -ljvm "-L%JAVA%\lib" && Haskell.exe
