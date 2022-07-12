# 👋 ssl-ca Readme 👋

ssl-ca README

## Run container

```shell
dockermgr install ssl-ca
```

### via command line

```shell
docker pull casjaysdevdocker/ssl-ca:latest && \
docker run -d \
--restart always \
--name casjaysdevdocker-ssl-ca \
--hostname casjaysdev-ssl-ca \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/docker/storage/ssl-ca/ssl-ca/data:/data \
-v $HOME/.local/share/docker/storage/ssl-ca/ssl-ca/config:/config \
-p 80:80 \
casjaysdevdocker/ssl-ca:latest
```

### via docker-compose

```yaml
version: "2"
services:
  ssl-ca:
    image: casjaysdevdocker/ssl-ca
    container_name: ssl-ca
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-ssl-ca
    volumes:
      - $HOME/.local/share/docker/storage/ssl-ca/data:/data:z
      - $HOME/.local/share/docker/storage/ssl-ca/config:/config:z
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 casjay: [Github](https://github.com/casjay) [Docker](https://hub.docker.com/r/casjay) 🤖  
⛵ CasjaysDev: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/r/casjaysdev) ⛵  
