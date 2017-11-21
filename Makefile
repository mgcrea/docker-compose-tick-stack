all: build

bash:
	@source .env
	@docker run --rm --net=host -it influxdb:${INFLUXDB_VERSION} /bin/sh

pull:
	@docker pull telegraf:${TELEGRAF_VERSION}
	@docker pull influxdb:${INFLUXDB_VERSION}
	@docker pull chronograf:${CHRONOGRAF_VERSION}
	@docker pull kapacitor:${KAPACITOR_VERSION}

build:
	@bash scripts/buildEnv.sh
