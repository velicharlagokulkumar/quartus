COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=-Wint-conversion
LIB=libxil.a
CC = aarch64-linux-gnu-gcc

RELEASEDIR=../../../lib
INCLUDEDIR=../include
INCLUDES=-I./. -I${INCLUDEDIR}

INCLUDEFILES=*.h
LIBSOURCES=*.c
OUTS = *.elf

include: 
	${CP} $(INCLUDEFILES) $(INCLUDEDIR)

clean:
	rm -rf ${OUTS}
	rm -rf dma

dma: $(LIBSOURCES)
	$(CC) -o dma4 $(EXTRA_COMPILER_FLAGS) $(LIBSOURCES) $(INCLUDES)

scp:
	scp dma root@192.168.166.13:/;md5sum dma