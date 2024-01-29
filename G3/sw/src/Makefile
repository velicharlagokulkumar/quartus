COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=-Wint-conversion
LIB=libxil.a
CC = aarch64-linux-gnu-gcc

INCLUDEDIR=../include
#INCLUDEDIR2=../drivers/inc
INCLUDES=-I./. -I${INCLUDEDIR}

INCLUDEFILES=*.h
#INCLUDEFILES2=../drivers/inc/*.h
LIBSOURCES=*.c
#LIBSOURCES2=../drivers/src/*.c
OUTS = *.elf

include: 
	${CP} $(INCLUDEFILES) $(INCLUDEDIR)

clean:
	rm -rf ${OUTS}
	rm -rf prbs

prbs: $(LIBSOURCES) $(LIBSOURCES2)
	$(CC) -o prbs $(EXTRA_COMPILER_FLAGS) $(LIBSOURCES) $(INCLUDES)

scp:
	scp prbs root@192.168.166.13:/;md5sum dma