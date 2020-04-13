#!/usr/bin/make -f

RECORD_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
RECORD_CSV_FILE = $(RECORD_DIR)/record.csv

PLIST_FILE = monitor-internet-speed.plist
PLIST_INSTALL_PATH = $(HOME)/Library/LaunchAgents/$(PLIST_FILE)

SPEEDTEST = /usr/local/bin/speedtest

#IPA CyberLab (Bunkyo, Japan)
SPEEDTEST_SERVER = 14623

record: $(RECORD_CSV_FILE)
	$(SPEEDTEST) --server $(SPEEDTEST_SERVER) --csv >> $(RECORD_CSV_FILE)
.PHONY: record

intall: $(SPEEDTEST) $(RECORD_CSV_FILE) $(PLIST_INSTALL_PATH)
.PHONY: install

# install
$(SPEEDTEST):
	brew install speedtest-cli

# init file
$(RECORD_CSV_FILE):
	$(SPEEDTEST) --csv-header > $@

# register job
$(PLIST_INSTALL_PATH): $(PLIST_FILE)
	cp -p $< $@
	launchctl load $@

