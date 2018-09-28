source .env

CMD=${2:-"/bin/sh"}

case "$1" in
  "telegraf")
    DOCKER_IMAGE="${1}:${TELEGRAF_VERSION}"
    ;;
  "influxdb")
    DOCKER_IMAGE="${1}:${INFLUXDB_VERSION}"
    ;;
  "chronograf")
    DOCKER_IMAGE="${1}:${CHRONOGRAF_VERSION}"
    ;;
  "kapacitor")
    DOCKER_IMAGE="${1}:${KAPACITOR_VERSION}"
    ;;
  *)
    DOCKER_IMAGE="ubuntu:16.04"
    ;;
esac

>&2 echo "$ docker run --rm --net=host -it ${DOCKER_IMAGE} ${CMD}"
docker run --rm --net=host -it ${DOCKER_IMAGE} ${CMD}
