# Copyright (C) 2025 Florent Monnier
# SPDX-License-Identifier: Libpng
all: calls
extract: extract.mk
	$(MAKE) -f $<
extract.mk: scr/extract.ml
	echo "all:" > $@
	ocaml $< | sed -e 's/^/\t/g' >> $@
N = 1
packatlas:
	sprpack -f atlas-$(shell date --iso)_$(N).png intermediate/*.png
clean:
	$(RM) intermediate/isom-city*.png
	$(RM) temp.png
	$(RM) extract.mk
calls:
	$(MAKE) extract
	$(MAKE) packatlas
