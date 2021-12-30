# Copyright (c) 2021 Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

ASSEMBLY_NAME := Eclipse Arrowhead Concepts Reference v
NAME          := main
LATEXMK       := latexmk
CP            := cp
RM            := rm -f

GENERATED_FILES := $(wildcard *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc figures/*.pdf)
FIGURES         := $(patsubst %.svg,%.pdf,$(wildcard figures/*)) 
SECTIONS        := $(wildcard sections/*.tex)
VERSION         := $(shell sed -n 's/.*\\ArrowheadVersion{\(\s*[^\s]*\s*\)}.*/\1/p' ./*.tex)

default: $(NAME).pdf

$(NAME).pdf: $(NAME).tex bibliography.bib $(FIGURES) $(SECTIONS)
	$(LATEXMK) -cd -pdf $(NAME).tex

figures/%.pdf: figures/%.svg
	inkscape $< --export-filename=$@

ifdef ASSEMBLY_PATH

assemble: $(NAME).pdf
	$(CP) $< "$(ASSEMBLY_PATH)/$(ASSEMBLY_NAME)$(VERSION).pdf"

.PHONY: assemble

endif

clean:
	$(foreach file,$(GENERATED_FILES),$(RM) $(file)$(nl))

.PHONY: clean

define nl


endef