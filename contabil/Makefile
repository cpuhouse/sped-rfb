#!/usr/bin/make

PROJECT=$(shell grep -m1 -iE '^Source:' debian/control | awk '{print $$2}')
VERSION=$(shell grep -m1 -iE "^$(PROJECT)\ \(.*\)" debian/changelog | cut -d\( -f2 | cut -d\) -f1)

ifeq ($(ARCH),i386)
BUILD_ARCH=i386
SRC_ARCH=x86
else
BUILD_ARCH=amd64
SRC_ARCH=x64
endif

PROG=$(shell p=$(PROJECT); echo $${p\#\#*-};)
BUILDIR=$(CURDIR)/build
DESTDIR=/opt/sped/$(PROG)

all:
	@echo
	@echo "Makefile for $(PROJECT) - version $(VERSION)"
	@echo
	@echo "Usage:"
	@echo
	@echo " make build-deb : Generate a deb package"
	@echo " make changelog : Update the debian changelog"
	@echo " make clean     : Get rid of scratch and byte files"
	@echo " make clean-all : Get rid of *ALL* scratch and byte files"
	@echo " make prep      : Download and prepare sources for build"
	@echo " make source    : compress this project into tarball"
	@echo

installer.properties: clean
	rm -rf installer.properties
	@echo INSTALL_PATH=./debian/$(PROJECT)$(DESTDIR) > installer.properties

prep: clean
	SRC_ARCH=$(SRC_ARCH) DESTDIR=$(DESTDIR) \
		 make -f debian/rules override_dh_prep

source: prep
	mkdir dist
	tar cJf dist/$(PROJECT)-$(VERSION).tar.xz .

build-deb: installer.properties
	mkdir dist
	SRC_ARCH=$(SRC_ARCH) DESTDIR=$(DESTDIR) \
		 dpkg-buildpackage -i -I -rfakeroot -a $(BUILD_ARCH)

clean:
	rm -rf build/ \
	       dist/ \
	       MANIFEST && \
	dh_clean

clean-all: clean
	git annex drop
	rm -rf ../$(PROJECT)*_*.deb \
	       ../$(PROJECT)_*.dsc \
	       ../$(PROJECT)_*.changes \
	       ../$(PROJECT)_*.tar.xz \
	       ../$(PROJECT)_*.tar.gz \
	       ../$(PROJECT)_*.build*

changelog: clean-all
	dch -M -U -D stable -u low
	sh ./update-sources
