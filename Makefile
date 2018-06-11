SHELL:=/bin/bash

TOP_DIR = $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

PROVISIONING_DIR = $(TOP_DIR)/provisioning

CONFIG_DIR = $(TOP_DIR)/provisioning/config
