SHELL := /bin/bash

GITHUB_USER ?= tstachl
GITHUB_ORG ?= devedotus
GITHUB_REPO := deve
GITHUB_TAG = $(shell git tag | sort -n | tail -1)

DOCKER_USER ?= tstachl
DOCKER_ORG ?= devedotus
DOCKER_REPO := deve
DOCKER_TAG := mysql
DOCKER_IMAGE := $(DOCKER_ORG)/$(DOCKER_REPO):$(DOCKER_TAG)

.PHONY: all build test

all: build test

build:
	docker build --force-rm -t $(DOCKER_IMAGE) .

test:
	dgoss run $(DOCKER_IMAGE)
