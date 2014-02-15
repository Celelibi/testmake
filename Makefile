CC := gcc
RM := rm -f
LD := gcc

FOO_SUBDIR := $(PWD)/foo

CPPFLAGS :=
CFLAGS := -ggdb
LDFLAGS := -L$(FOO_SUBDIR)
LDLIBS := -lfoo -lgnufoo



.PHONY: all

all: main

# There are theoretically 3 main binaries
main: main.o
	$(LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS) $(CPPFLAGS)


$(FOO_SUBDIR)/libfoo.a: foo.stamp
$(FOO_SUBDIR)/libgnufoo.a: foo.stamp

.INTERMEDIATE: foo.stamp
foo.stamp:
	touch $@
	$(MAKE) -C $(FOO_SUBDIR)


.PHONY: clean
clean:
	$(MAKE) -C $(FOO_SUBDIR) $@
	$(RM) main.o
	$(RM) main
