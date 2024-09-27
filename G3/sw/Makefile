CC = aarch64-linux-gnu-gcc
CC2 = gcc
EXTRA_COMPILER_FLAGS= -Wint-conversion -Wall -O2 
COMPILER_FLAGS = -w

INCLUDEDIR = ./bsp/inc
INCLUDEDIR2 = ./src/
INCLUDES = -I${INCLUDEDIR} -I${INCLUDEDIR2}

LIBSOURCES = ./bsp/src/*.c
LIBSOURCES2 = ./src/*.c

TARGET = prbs12 

clean:
	rm -rf prbs*

prbs: $(LIBSOURCES) $(LIBSOURCES2)
	$(CC) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) $(LIBSOURCES) $(LIBSOURCES2) -o $(TARGET)

scp:
	scp prbs2 root@192.168.166.13: ;md5sum prbs2

all: clean prbs
