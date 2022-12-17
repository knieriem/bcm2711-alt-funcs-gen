MAPPING=alt_funcs.mapping

all:	$(MAPPING)

clean:
	rm -f $(MAPPING)

%.mapping: %.csv
	sed -f rename.sed < $< |\
	awk -f togo.awk |\
	sed -f finish.sed  > $@

.PHONY: \
	all\
	clean\

