MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRDIR := $(notdir $(patsubst %/,%,$(dir $(MAKEFILE_PATH))))

SRCS := $(wildcard *.asm)
EXES := $(patsubst %.asm,%,$(SRCS))
BIN  := ../../bin
OUTDIR = $(BIN)/$(CURRDIR)

LD = ld 
ASM = yasm   

LDFLAGS = -g
ASMFLAGS = -Worphan-labels -g dwarf2 -f elf64

all : $(EXES)

$(EXES): %: $(OUTDIR)/%.o
	$(info Linking $< ...)
	@$(LD) $(LDFLAGS) -o $(OUTDIR)/$@ $<
	$(info > Generated $(OUTDIR)/$@)

$(OUTDIR)/%.o : %.asm
	@mkdir -p $(OUTDIR)
	$(info Assembling $< ...)
	@$(ASM) $(ASMFLAGS) $< -l $(OUTDIR)/$*.lst -o $(OUTDIR)/$@

.PHONY: clean
clean:
	$(info Cleaning directory $(OUTDIR)...)
	rm -rf $(OUTDIR)