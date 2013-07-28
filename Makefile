SHELL = /bin/sh
UNAME = $(shell uname -s | tr '[A-Z]' '[a-z]')

ifeq ($(UNAME), darwin)
# Mac OS X
CC ?= clang
DLLFLAGS ?= -bundle -undefined dynamic_lookup
else
# assume Linux
CC ?= gcc
DLLFLAGS ?= -shared
endif

RM ?= rm -f
AR = ar rcu
RANLIB = ranlib

LUADIR ?= /usr/include

COPT ?= -O2
CVERSION ?= -std=c99
CWARN ?= -Wall -Wextra
CFLAGS = $(COPT) $(CVERSION) $(CWARN) -I$(LUADIR) -fPIC $(MYFLAGS)

HDR = int64.h
SRC = int64.c
OBJ = int64.o

DLL = int64.so
LIB = libint64.a

all: dll lib

dll: $(DLL)

lib: $(LIB)

clean:
	$(RM) $(OBJ) $(DLL) $(LIB)

$(DLL): $(OBJ) $(MYOBJ)
	$(CC) $(DLLFLAGS) -o $@ $^

$(LIB): $(OBJ) $(MYOBJ)
	$(AR) $@ $^
	$(RANLIB) $@

$(OBJ): $(SRC) $(MYSRC) $(HDR)
	$(CC) $(CFLAGS) -c -o $@ $(SRC) $(MYSRC)
