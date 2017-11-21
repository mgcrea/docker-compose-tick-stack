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

## Quickstart

- You can quickly start your compose gitlab instance (requires a working automated nginx_proxy compose instance)

```bash
git clone git@github.com:mgcrea/docker-compose-tick-stack.git gitlab; cd $_
cp .env.default .env; nano .env # edit your variables
make
docker-compose up -d
```
