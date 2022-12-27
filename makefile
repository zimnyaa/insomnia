
CCX64	:= x86_64-w64-mingw32-gcc
CCX86	:= i686-w64-mingw32-gcc


CFLAGS	=  -Os -fno-asynchronous-unwind-tables
CFLAGS 	+= -fno-ident -fpack-struct=8 -falign-functions=1
CFLAGS  += -s -ffunction-sections -falign-jumps=1 -w
CFLAGS	+= -falign-labels=1
CFLAGS	+= -Wl,-s,--no-seh,--enable-stdcall-fixup,--dynamicbase

OUTX64	:= insomnia.x64.exe


DARKLL  := -Isrc/darkll/include
DARKLL  += src/darkll/src/*.c


DLLNAME := ./dll/nimdll.dll
DLLHEADER := ./src/packeddll.h

all: x64

x64:
	@ echo make: converting the dll to the C header
	@ python tools/dll2h.py -i ./dll/nimdll.dll -o $(DLLHEADER) -v packed_dllbytes
	@ echo make: compiling the stage1 (insomnia)
	@ $(CCX64) src/*.c src/*.h $(DARKLL) -o $(OUTX64) $(CFLAGS) $(LFLAGS)
clean:
	@ rm -rf *.exe
	@ rm -rf *.bin
	@ rm -rf *.o
