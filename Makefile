PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man
PKG_CONFIG ?= pkg-config
SRC = src/lz4jsoncat.c
TARGET = bin/lz4jsoncat

PWD = $(shell pwd)
CFLAGS := -g -O2 -Wall
LDLIBS := $(shell $(PKG_CONFIG) --cflags --libs liblz4)

$(TARGET): $(SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRC) $(LDLIBS) -o $(TARGET)
	ln -s $(PWD)/$(TARGET) $(PREFIX)/$(TARGET)

clean:
	rm -rf bin $(PREFIX)/$(TARGET)

.PHONY: clean
