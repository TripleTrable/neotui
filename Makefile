CC=gcc
CFLAGS= -std=c99 -g -Wall -Wextra

AR=ar

SRC=$(wildcard src/*.c)
HEADER=$(wildcard src/*.h)
OBJ=$(patsubst %.c,%.o,$(SRC))
DPS=$(patsubst %.c,%.d,$(SRC))
TARGET=bin/lib/libneotui.a

all: $(TARGET)

install: $(TARGET)
	cp -f $(HEADER) bin/include/

clean:
	rm -f $(TARGET) $(OBJ) $(DPS)

$(TARGET): $(OBJ)
	$(AR) rcs $@ $^

-include $(DPS)

%.o: %.c Makefile
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@





.PHONY: all clean install
