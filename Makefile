TARGETS=test_pc

ifdef D
	DEBUG=-g
	OPT=
else
	DEBUG=
	OPT=-Ofast
endif

ifdef P
	PROFILE=-pg -no-pie # for bug in gprof.
endif

LOC_INCLUDE=include
LOC_SRC=src
LOC_TEST=test
OBJDIR=obj

CC = gcc -std=gnu11
LD= gcc -std=gnu11

CXXFLAGS = -Wall $(DEBUG) $(PROFILE) $(OPT) $(ARCH) -m64 -I. -Iinclude

LDFLAGS = $(DEBUG) $(PROFILE) $(OPT) -lpthread

#
# declaration of dependencies
#

all: $(TARGETS)

# dependencies between programs and .o files

test_pc:						$(OBJDIR)/test_partitioned_counter.o \
										$(OBJDIR)/partitioned_counter.o

# dependencies between .o files and .h files

# dependencies between .o files and .cc (or .c) files

$(OBJDIR)/partitioned_counter.o:	$(LOC_INCLUDE)/partitioned_counter.h

#
# generic build rules
#

$(TARGETS):
	$(LD) $^ -o $@ $(LDFLAGS)

$(OBJDIR)/%.o: $(LOC_SRC)/%.c | $(OBJDIR)
	$(CC) $(CXXFLAGS) $(INCLUDE) $< -c -o $@

$(OBJDIR)/%.o: $(LOC_TEST)/%.c | $(OBJDIR)
	$(CC) $(CXXFLAGS) $(INCLUDE) $< -c -o $@

$(OBJDIR):
	@mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR) $(TARGETS) core

