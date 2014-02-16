CC := gcc
RM := rm -f
LD := gcc

FOO_SUBDIR := $(CURDIR)/foo

CPPFLAGS :=
CFLAGS := -ggdb
LDFLAGS := -L$(FOO_SUBDIR)

FOO_LIBSFILES := $(FOO_SUBDIR)/libfoo.a $(FOO_SUBDIR)/libgnufoo.a
FOO_LDLIBS := -lfoo -lgnufoo


.PHONY: all
all: main

# There are theoretically 3 main binaries
main: main.o $(FOO_LIBSFILES)
	$(LD) $(LDFLAGS) -o $@ $< $(FOO_LDLIBS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS) $(CPPFLAGS)


# The empty recipe force make to check the file date
$(FOO_LIBSFILES): libfoo ;

.PHONY: libfoo
libfoo:
	$(MAKE) -C $(FOO_SUBDIR)


.PHONY: clean
clean:
	$(MAKE) -C $(FOO_SUBDIR) $@
	$(RM) main.o
	$(RM) main
