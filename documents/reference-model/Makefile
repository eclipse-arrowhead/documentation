# Copyright (c) 2021-10-04 Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

NAME     := reference-model
LATEXMK  := latexmk
RM       := rm -f

GENERATED_FILES := $(wildcard *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc figures/*.pdf)
FIGURES         := $(patsubst %.svg,%.pdf,$(wildcard figures/*)) 
SECTIONS        := $(wildcard sections/*.tex)

$(NAME).pdf: $(NAME).tex bibliography.bib $(FIGURES)
	$(LATEXMK) -cd -pdf $(NAME).tex

figures/%.pdf: figures/%.svg
	inkscape $< --export-filename=$@

clean:
	$(foreach file,$(GENERATED_FILES),$(RM) $(file)$(nl))

.PHONY: clean

define nl


endef