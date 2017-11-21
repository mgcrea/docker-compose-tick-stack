all: build

exec:
	@docker-compose exec influxdb /bin/sh

pull:
	@bash scripts/pull.sh

build:
	@bash scripts/build.sh
