#!/usr/bin/make -f

RECORD_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

RECORD_CSV_FILE = $(RECORD_DIR)/record.csv

SPEEDTEST = /usr/local/bin/speedtest

#IPA CyberLab (Bunkyo, Japan)
SPEEDTEST_SERVER = 14623

record: $(RECORD_CSV_FILE)
	$(SPEEDTEST) --server $(SPEEDTEST_SERVER) --csv >> $(RECORD_CSV_FILE)
.PHONY: record

# install
$(SPEEDTEST):
	brew install speedtest-cli

# init file
$(RECORD_CSV_FILE):
	$(SPEEDTEST) --csv-header > $@
