SHELL := /bin/bash

all: build

bash:
	@bash scripts/bash.sh influxdb

pull:
	@bash scripts/pull.sh

build:
	@bash scripts/build.sh
