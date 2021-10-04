# Copyright (c) 2021-10-04 Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

NAME     := reference-model
LATEXMK  := latexmk
CP       := cp
RM       := rm -f

GENERATED_FILES := $(wildcard *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc figures/*.pdf)
FIGURES         := $(patsubst %.svg,%.pdf,$(wildcard figures/*)) 
SECTIONS        := $(wildcard sections/*.tex)

default: $(NAME).pdf

$(NAME).pdf: $(NAME).tex bibliography.bib $(FIGURES)
	$(LATEXMK) -cd -pdf $(NAME).tex

figures/%.pdf: figures/%.svg
	inkscape $< --export-filename=$@

ifdef ASSEMBLY_PATH

assemble: $(ASSEMBLY_PATH)/$(NAME).pdf

$(ASSEMBLY_PATH)/$(NAME).pdf: $(NAME).pdf
	$(CP) $< $(ASSEMBLY_PATH)/arrowhead-$(patsubst %.pdf,%-$(ASSEMBLY_VERSION).pdf,$<)

.PHONY: assemble

endif

clean:
	$(foreach file,$(GENERATED_FILES),$(RM) $(file)$(nl))

.PHONY: clean

define nl


endef