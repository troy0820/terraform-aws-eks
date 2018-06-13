SHELL:=/bin/bash

TOP_DIR = $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

PROVISIONING_DIR = $(TOP_DIR)/provisioning

CONFIG_DIR = $(TOP_DIR)/provisioning/config

remote-state-create:
	cd $(PROVISIONING_DIR)/platforms/remote_state/; \
		terraform init -get; \
		terraform apply -auto-approve -var-file="$(CONFIG_DIR)/remote_state.tfvars"
