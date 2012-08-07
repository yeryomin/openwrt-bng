#
# Copyright (C) 2011 Roman Yeryomin <roman@advem.lv>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PACKAGE_DIR = ./package/
TARGETS_DIR = ./target/linux/

content:
#	@set -e;
	@[ -d $(CONTENT_DIR) ] || ( echo "ERROR: Invalid CONTENT_DIR" && exit 1 )
	@[ -d $(CONTENT_DIR)/package ] || ( echo "ERROR: There is no package/ directory in CONTENT_DIR" && exit 1 )
	@[ -d $(PACKAGE_DIR) ] || mkdir $(PACKAGE_DIR)
	@cp -vur $(CONTENT_DIR)/package/* $(PACKAGE_DIR)
	@cp -vur Makefile.package package/Makefile
	@[ -d $(CONTENT_DIR)/target/linux ] || ( echo "ERROR: There is no target/linux/ directory in CONTENT_DIR" && exit 1 )
	@[ -d $(TARGETS_DIR) ] || mkdir $(TARGETS_DIR)
	@cp -vur $(CONTENT_DIR)/target/linux/* $(TARGETS_DIR)
	@cp -vur Makefile.targets target/linux/Makefile
	@echo "Content updated!"

content-clean:
	rm -rf package/*
	rm -rf target/linux/*
