# Copyright (c) Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0


export ASSEMBLY_PATH := $(abspath distribution)

ASSEMBLY_DOCUMENTS := $(wildcard $(ASSEMBLY_PATH)/*.pdf)
ASSEMBLY_PREFIX    := eclipse-arrowhead-core-documentation-
ASSEMBLY_VERSION   := $(shell git describe --always)
ASSEMBLY_NAME      := $(ASSEMBLY_PREFIX)$(ASSEMBLY_VERSION)
MKDIR              := mkdir
RM                 := rm -Rf
ZIP                := zip

default: assemble

$(ASSEMBLY_PATH):
	$(MKDIR) $(ASSEMBLY_PATH)

$(ASSEMBLY_NAME).zip:
	$(ZIP) -jr $@ $(ASSEMBLY_PATH)

assemble: $(ASSEMBLY_PATH)
	cd documents && $(MAKE) assemble
	$(MAKE) $(ASSEMBLY_NAME).zip

clean:
	cd documents && $(MAKE) clean
	$(RM) $(ASSEMBLY_PATH)
	$(RM) $(ASSEMBLY_PREFIX)*.zip

.PHONY: $(ASSEMBLY_NAME).zip assemble clean