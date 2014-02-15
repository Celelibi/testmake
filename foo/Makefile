CC := gcc
RM := rm -f
LD := gcc
AR := ar


CPPFLAGS :=
CFLAGS := -ggdb
LDFLAGS :=
LDLIBS :=
ARFLAGS := rv


.PHONY: all
all: libfoo.a libgnufoo.a

libfoo.a: libfoo.a(foo.o)
libgnufoo.a: libgnufoo.a(gnufoo.o)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS) $(CPPFLAGS)

(%): %
	$(AR) $(ARFLAGS) $@ $%

.PHONY: clean
clean:
	$(RM) libfoo.a libgnufoo.a
