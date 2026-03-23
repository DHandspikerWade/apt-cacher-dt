[![status-badge](https://ci.spikedhand.com/api/badges/17/status.svg)](https://ci.spikedhand.com/repos/17)


# Apt-cacher-dt

Duct Tape Apt-Cacher is a caching HTTP proxy intended for use with APT package manager. Caches packages for up to 90 days to provide a fast local network cache when installing/updating multiple systems. 


<p align="center">
  <img alt="Gonna use duct tape to do it" src="https://raw.githubusercontent.com/DHandspikerWade/apt-cacher-dt/main/.github/ducttape.gif"/>
</p>

## Usage

### Run the server
```
docker run -d \
    -p 3241:3241 \
    -e CACHER_CACHE_SIZE_GB=10 \
    -v $PWD/cache:/usr/share/nginx/cache \
    ghcr.io/dhandspikerwade/apt-cacher-dt:1
```

### Configure APT

```
echo 'Acquire::http::Proxy "http://DOMAIN_OR_IP:3142";' > /etc/apt/apt.conf.d/apt-proxy
```

...or configure [apt-auto-proxy](https://github.com/terceiro/auto-apt-proxy) based on the project's instructions. 

### Environment variables

| Variable | Default Value | Description |
|-|-|-|
| NAMESERVER | 8.8.8.8 | DNS server used to make requests to upstream repositories |
| CACHER_CACHE_SIZE_GB | 10 | Maximum size for cache storage |