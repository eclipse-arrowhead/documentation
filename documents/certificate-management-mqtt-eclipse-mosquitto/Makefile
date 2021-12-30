# Copyright (c) 2021 Eclipse Arrowhead Project
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

ASSEMBLY_NAME := Certificate Management for MQTT with Eclipse Mosquitto
NAME          := certificate-management-mqtt-eclipse-mosquitto
CP            := cp

default:

ifdef ASSEMBLY_PATH

assemble:
	$(CP) $(NAME).pdf "$(ASSEMBLY_PATH)/$(ASSEMBLY_NAME).pdf"

endif

clean:

.PHONY: default assemble clean
