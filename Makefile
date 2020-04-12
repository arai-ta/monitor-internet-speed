#!/usr/bin/make -f

#IPA CyberLab (Bunkyo, Japan)
SPEEDTEST_SERVER = 14623

RECORD_CSV_FILE = record.csv

SPEEDTEST = /usr/local/bin/speedtest

record: $(RECORD_CSV_FILE)
	$(SPEEDTEST) --server $(SPEEDTEST_SERVER) --csv >> $(RECORD_CSV_FILE)
.PHONY: record

# install
$(SPEEDTEST):
	brew install speedtest-cli

# init file
$(RECORD_CSV_FILE):
	$(SPEEDTEST) --csv-header
