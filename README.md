# Compose file for the TICK stack!
## Telegraf, InfluxDB, Chronograf, Kapacitor

[![License](https://img.shields.io/github/license/mgcrea/docker-compose-tick-stack.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Docker Stars](https://img.shields.io/docker/stars/_/influxdb.svg)](https://registry.hub.docker.com/u/_/influxdb/)
[![Docker Pulls](https://img.shields.io/docker/pulls/_/influxdb.svg)](https://registry.hub.docker.com/u/_/influxdb/)

Working `docker-compose.yml` for official [influxdata](https://www.influxdata.com/) TICK stack:

- [telegraf](https://hub.docker.com/_/telegraf/)
- [influxdb](https://hub.docker.com/_/influxdb/)
- [chronograf](https://hub.docker.com/_/chronograf/)
- [kapacitor](https://hub.docker.com/_/kapacitor/)

Made to work behind a separate automated [nginx-proxy](https://github.com/jwilder/nginx-proxy) with SSL support via letsencrypt.

## Docs

- [telegraf](https://docs.influxdata.com/telegraf/v1.8/administration/configuration/)
- [influxdb](https://docs.influxdata.com/influxdb/v1.6/administration/config/)
- [chronograf](https://docs.influxdata.com/chronograf/v1.6/administration/configuration/)
- [kapacitor](https://docs.influxdata.com/kapacitor/v1.5/administration/configuration/)

## Configuration

- [telegraf](https://github.com/influxdata/telegraf/blob/release-1.8/etc/telegraf.conf)

Generate an up-to-date sample telegraf config

```bash
bash scripts/bash.sh telegraf "telegraf config" > /tmp/telegraf.conf
```

- [influxdb](https://raw.githubusercontent.com/influxdata/influxdb/1.6/etc/config.sample.toml)

Generate an up-to-date sample telegraf config

```bash
bash scripts/bash.sh influxdb "influxd config" > /tmp/influxd.conf
```

- [chronograf](https://github.com/influxdata/chronograf/blob/1.6.x/etc/config.sample.toml)


- [kapacitor](https://github.com/influxdata/kapacitor/blob/master/etc/kapacitor/kapacitor.conf)

Generate an up-to-date sample kapacitor config

```bash
bash scripts/bash.sh kapacitor "kapacitord config" > /tmp/kapacitord.conf
```

## Quickstart

- You can quickly start your compose gitlab instance (requires a working automated nginx_proxy compose instance)

```bash
git clone git@github.com:mgcrea/docker-compose-tick-stack.git tick_stack; cd $_
cp .env.default .env; nano .env # edit your variables
make
docker-compose up -d
```
