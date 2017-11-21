set -a
source .env

echo "Building \"telegraf.conf\" via envsubst"
envsubst < templates/telegraf.conf > "volumes/config/telegraf.conf"

echo "Building \"influxdb.conf\" via envsubst"
envsubst < templates/influxdb.conf > "volumes/config/influxdb.conf"

echo "Building \"kapacitor.conf\" via envsubst"
envsubst < templates/kapacitor.conf > "volumes/config/kapacitor.conf"


# docker run --rm influxdb:1.4.2-alpine influxd config > volumes/config/influxdb.conf
# docker run --rm \
#       -e INFLUXDB_DB=db0 -e INFLUXDB_ADMIN_ENABLED=true
#       -e INFLUXDB_ADMIN_USER=admin -e INFLUXDB_ADMIN_USER=supersecretpassword
#       -e INFLUXDB_USER=telegraf -e INFLUXDB_USER_PASSWORD=secretpassword
#       -v $PWD:/var/lib/influxdb \
#       /init-influxdb.sh
