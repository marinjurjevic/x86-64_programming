SUBDIRS := $(wildcard src/*)

.PHONY : all $(SUBDIRS)
all : $(SUBDIRS)

$(SUBDIRS) :
	@$(MAKE) -C $@

.PHONY : clean
clean:
	@for dir in $(SUBDIRS) ; do \
		$(MAKE) -C $$dir clean ; \
	done