PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man
PKG_CONFIG ?= pkg-config
SRC = src/lz4jsoncat.c
MAN = man/lz4jsoncat.1
TARGET = bin/lz4jsoncat

PWD = $(shell pwd)
CFLAGS := -g -O2 -Wall
LDLIBS := $(shell $(PKG_CONFIG) --cflags --libs liblz4)

$(TARGET): $(SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRC) $(LDLIBS) -o $(TARGET)
	ln -s $(PWD)/$(TARGET) $(PREFIX)/$(TARGET)
	ln -s $(PWD)/$(MAN) $(MANPREFIX)/man1/lz4jsoncat.1

clean:
	rm -rf bin $(PREFIX)/$(TARGET) $(MANPREFIX)/man1/lz4jsoncat.1

.PHONY: clean
