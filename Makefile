CC := gcc
PKG_CONFIG ?= pkg-config
CFLAGS := -g -O2 -Wall
LDLIBS := $(shell $(PKG_CONFIG) --cflags --libs liblz4)

bin/lz4jsoncat: src/lz4jsoncat.c
	mkdir -p bin
	$(CC) $(CFLAGS) src/lz4jsoncat.c $(LDLIBS) -o bin/lz4jsoncat

clean:
	rm -f bin
