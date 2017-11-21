DOCKER_IMAGE := influxdb

all: build

bash:
	@source .env
	@docker run --rm --net=host -it ${DOCKER_IMAGE}:${INFLUXDB_VERSION} /bin/sh

build:
	@bash scripts/buildEnv.sh
