#!/usr/bin/make -f

SHELL:=/bin/bash

SOURCES=$(shell find . -mindepth 2 -maxdepth 2 -name Makefile | awk -F/ '{print $$2}')

all: build-all

build-all: build-debs

build-debs:
	@for s in $(SOURCES); do pushd $$s; make build-deb; make clean && git annex drop; popd; done

build-rpms:
	@for s in $(SOURCES); do pushd $$s; make build-rpm; make clean && git annex drop; popd; done
