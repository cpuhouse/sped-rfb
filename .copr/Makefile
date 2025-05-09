#!/usr/bin/make
SHELL=/bin/bash

PROJECT=$(shell grep -m1 -iE '^Source:' debian/control | awk '{print $$2}')
VERSION=$(shell grep -m1 -iE "^$(PROJECT)\ \(.*\)" debian/changelog | cut -d\( -f2 | cut -d\) -f1)

ifeq ($(ARCH),i386)
BUILD_ARCH=i386
RPM_BUILD_ARCH=i686
SRC_ARCH=x86
else
BUILD_ARCH=x86_64
RPM_BUILD_ARCH=x86_64
SRC_ARCH=x64
endif

APPNAME=$(shell echo $(PROJECT) | sed 's/.*-//')

BUILDIR=$(CURDIR)/build
DESTDIR=/opt/sped/$(APPNAME)

PM=$(shell which dnf yum apt 2>/dev/null | head -1)

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
	@echo " make spec      : create spec file for rpm building"
	@echo " make srpm      : create rpm source ready for build"
	@echo

builddeps:
	test -f /usr/bin/dh || $(PM) -y install debhelper
	test -f /usr/bin/dch || $(PM) -y install devscripts
	test -f /usr/bin/dpkg-source || $(PM) -y install dpkg-source

installer.properties: clean
	rm -rf installer.properties
	@echo INSTALL_PATH=./debian/$(PROJECT)$(DESTDIR) > installer.properties

prep: clean update-sources
	BUILD_ARCH=$(BUILD_ARCH) SRC_ARCH=$(SRC_ARCH) DESTDIR=$(DESTDIR) \
		 make -f debian/rules override_dh_prep

source: update-sources clean
	mkdir dist
	cd dist && \
	dpkg-source \
		-I.gitignore \
		-Iinstaller.properties \
		-Idist* \
		-I*.spec* \
		-I$(shell find sources/ -type l) \
		-b ../ && \
	cd ..

spec:
	rm -rf $(PROJECT).spec
	@cat pkg.spec.in | \
		sed 's/__PROJECT__/$(PROJECT)/g' | \
		sed 's/__VERSION__/$(VERSION)/g' | \
		sed 's/__APPNAME__/$(APPNAME)/g' | \
		sed 's/__BUILDARCH__/$(RPM_BUILD_ARCH)/g' \
	> $(PROJECT).spec

srpm: source spec
	srcdir="$${PWD}/dist"; \
	test -z "$(outdir)" && outdir="$${srcdir}"; \
	cp -a ../.copr/Makefile $${srcdir}/; \
	rpmbuild \
		--define="_sourcedir $${srcdir}" \
		--define="_srcrpmdir $${outdir}" \
		-bs $(PROJECT).spec

build-rpm:
	@echo "Not implemented yet"

build-deb: installer.properties
	mkdir dist
	SRC_ARCH=$(SRC_ARCH) DESTDIR=$(DESTDIR) \
		 dpkg-buildpackage -i -I -rfakeroot -a $(BUILD_ARCH)

clean: builddeps
	find sources/ -xtype l -delete
	rm -rf build/ \
	       dist/ \
	       MANIFEST \
	       $(PROJECT).spec && \
	dh_clean || :

clean-all: clean
	git annex drop || :
	find sources/ -xtype l -delete
	rm -rf ../$(PROJECT)*_*.deb \
	       ../$(PROJECT)_*.dsc \
	       ../$(PROJECT)_*.changes \
	       ../$(PROJECT)_*.tar.xz \
	       ../$(PROJECT)_*.tar.gz \
	       ../$(PROJECT)_*.build*

changelog: clean-all
	dch -M -U -D stable -u low
	sh ./update-sources

.PHONY: update-sources
update-sources:
	sh ./update-sources
