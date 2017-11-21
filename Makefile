all: build

bash:
	@source .env
	@docker run --rm --net=host -it influxdb:${INFLUXDB_VERSION} /bin/sh

pull:
	@bash scripts/pull.sh

build:
	@bash scripts/build.sh
