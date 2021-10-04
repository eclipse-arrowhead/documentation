# Copyright (c) 2021-10-04 Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

NAME     := reference-model
MKBIB    := bibtex
MKPDF    := pdflatex
RM       := rm -f

GENERATED_FILES := $(wildcard *.aux *.bbl *.blg *.log *.out *.pdf *.synctex.gz *.toc figures/*.pdf)
VECTOR_IMAGES   := $(patsubst %.svg,%.pdf,$(wildcard figures/*.svg)) 
SECTIONS        := $(wildcard sections/*.tex)

$(NAME).pdf: $(VECTOR_IMAGES) $(NAME).aux $(NAME).bbl
	$(MKPDF) $(NAME).tex

.PHONY: $(NAME).pdf

./%.bbl: %.aux bibliography.bib
	$(MKBIB) $<

$(NAME).aux: $(NAME).tex $(SECTIONS)
	$(MKPDF) $<

figures/%.pdf: figures/%.svg
	inkscape $< --export-filename=$@

clean:
	$(foreach file,$(GENERATED_FILES),$(RM) $(file)$(nl))

.PHONY: clean

define nl


endef