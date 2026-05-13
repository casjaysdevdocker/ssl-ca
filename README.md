## 👋 Welcome to ssl-ca 🚀  

ssl-ca README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update ssl-ca
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/ssl-ca/ssl-ca/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/ssl-ca/rootfs"
git clone "https://github.com/dockermgr/ssl-ca" "$HOME/.local/share/CasjaysDev/dockermgr/ssl-ca"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/ssl-ca/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-ssl-ca-latest \
--hostname ssl-ca \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/ssl-ca:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/ssl-ca
    container_name: casjaysdevdocker-ssl-ca
    environment:
      - TZ=America/New_York
      - HOSTNAME=ssl-ca
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/ssl-ca/ssl-ca/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/ssl-ca/ssl-ca/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/ssl-ca
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/ssl-ca" "$HOME/Projects/github/casjaysdevdocker/ssl-ca"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/ssl-ca"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
