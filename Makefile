PREFIX=/opt/button
#BINDIR=$(PREFIX)/bin
#APPDIR=$(PREFIX)/app
#MANDIR=$(PREFIX)/man
ETC=/etc
SYSTEMD=/etc/systemd/system

.PHONY: install
install:
	mkdir -p $(PREFIX)
	#mkdir -p $(BINDIR)
	cp -r ./* $(PREFIX)/
	ln -sf $(PREFIX)/select.rb $(PREFIX)/select
	#if ! [ -s $(ETC)/sw_gateway.conf ]; then cp ./sw_gateway.conf $(ETC)/; fi
	cp ./button.service $(SYSTEMD)/
	systemctl enable button.service
	cp ./button_subject.service $(SYSTEMD)/
	systemctl enable button_subject.service
	cp ./nwled.service $(SYSTEMD)/
	systemctl enable nwled.service
	cp ./led_updater.service $(SYSTEMD)/
	systemctl enable led_updater.service

.PHONY: uninstall
uninstall:
	rm -rf $(PREFIX)

.PHONY: start
start:
	systemctl start button.service
	systemctl start button_subject.service
	systemctl start nwled.service
	systemctl start led_updater.service

.PHONY: stop
stop:
	systemctl stop button.service
	systemctl stop button_subject.service
	systemctl stop nwled.service
	systemctl stop led_updater.service

.PHONY: restart
restart:
	systemctl stop button.service
	systemctl stop button_subject.service
	systemctl stop nwled.service
	systemctl stop led_updater.service
	systemctl start button.service
	systemctl start button_subject.service
	systemctl start nwled.service
	systemctl start led_updater.service

.PHONY: status
status:
	@systemctl status --no-pager button.service
	@echo
	@systemctl status --no-pager button_subject.service
	@echo
	@systemctl status --no-pager nwled.service
	@echo
	@systemctl status --no-pager led_updater.service

#.PHONY: test
#test:
#	./test/all.sh
