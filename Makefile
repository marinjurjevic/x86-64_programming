SUBDIRS := $(wildcard src/*)

.PHONY : all $(SUBDIRS)
all : $(SUBDIRS)

$(SUBDIRS) :
	@$(MAKE) -C $@

.PHONY : clean
clean:
	@$(MAKE) -C $(SUBDIRS) clean