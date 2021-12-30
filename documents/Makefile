# Copyright (c) Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

DOCUMENT_FOLDERS := $(patsubst %/Makefile,%,$(wildcard */Makefile))

default:
	$(foreach folder,$(DOCUMENT_FOLDERS),cd $(folder) && $(MAKE)$(nl))

assemble:
	$(foreach folder,$(DOCUMENT_FOLDERS),cd $(folder) && $(MAKE) assemble$(nl))

clean:
	$(foreach folder,$(DOCUMENT_FOLDERS),cd $(folder) && $(MAKE) clean$(nl))

.PHONY: default assemble clean 

define nl


endef