# Copyright 2017 - 2019, Udi Fuchs
# SPDX-License-Identifier: MIT

BIN_PATH=/usr/local/bin/
AUTO_START_PATH=/usr/share/gnome/autostart/

all: icc-brightness-gen

icc-brightness-gen: icc-brightness-gen.c
	$(CC) -W -Wall $(CFLAGS) $^ -l lcms2 $(LDFLAGS) -o $@

clean:
	rm -f icc-brightness-gen

install: all
	mkdir -p $(DESTDIR)$(BIN_PATH)
	install -m 755 icc-brightness-gen $(DESTDIR)$(BIN_PATH)
	install -m 755 icc-brightness $(DESTDIR)$(BIN_PATH)
	mkdir -p $(DESTDIR)$(AUTO_START_PATH)
	install -m 644 icc-brightness.desktop $(DESTDIR)$(AUTO_START_PATH)

uninstall:
	rm -f $(DESTDIR)$(BIN_PATH)icc-brightness-gen
	rm -f $(DESTDIR)$(BIN_PATH)icc-brightness
	rm -f $(DESTDIR)$(AUTO_START_PATH)icc-brightness.desktop
