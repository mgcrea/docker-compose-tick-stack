set -a
source .env

echo "Building \"telegraf.conf\" via envsubst"
envsubst < templates/telegraf.conf > "volumes/config/telegraf.conf"
echo "Building \"influxdb.conf\" via envsubst"
envsubst < templates/influxdb.conf > "volumes/config/influxdb.conf"
echo "Building \"kapacitor.conf\" via envsubst"
envsubst < templates/kapacitor.conf > "volumes/config/kapacitor.conf"

ENV_VARS=""
if [[ -v INFLUXDB_DB ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_DB=${INFLUXDB_DB}"; fi
if [[ -v INFLUXDB_ADMIN_USER ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_ADMIN_USER=${INFLUXDB_ADMIN_USER}"; fi
if [[ -v INFLUXDB_ADMIN_PASSWORD ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_ADMIN_PASSWORD=${INFLUXDB_ADMIN_PASSWORD}"; fi
if [[ -v INFLUXDB_USER ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_USER=${INFLUXDB_USER}"; fi
if [[ -v INFLUXDB_USER_PASSWORD ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_USER_PASSWORD=${INFLUXDB_USER_PASSWORD}"; fi
if [[ -v INFLUXDB_READ_USER ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_READ_USER=${INFLUXDB_READ_USER}"; fi
if [[ -v INFLUXDB_READ_USER_PASSWORD ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_READ_USER_PASSWORD=${INFLUXDB_READ_USER_PASSWORD}"; fi
if [[ -v INFLUXDB_WRITE_USER ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_WRITE_USER=${INFLUXDB_WRITE_USER}"; fi
if [[ -v INFLUXDB_WRITE_USER_PASSWORD ]]; then ENV_VARS="${ENV_VARS} -e INFLUXDB_WRITE_USER_PASSWORD=${INFLUXDB_WRITE_USER_PASSWORD}"; fi

echo "Initializing InfluxDB database"
docker run --rm $ENV_VARS -v $PWD/volumes/influxdb:/var/lib/influxdb influxdb:${INFLUXDB_VERSION} /init-influxdb.sh
