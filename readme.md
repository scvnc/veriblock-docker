# veriblock-docker

VeriBlock distributables with Docker

## Add Oracle JDK

Nodecore does not work with OpenJDK anymore, so you need to create an account
on Docker Hub and checkout [Oracle JDK docker image](https://hub.docker.com/_/oracle-serverjre-8/).

After going through the free checkout process, login to your docker
account if you are not already:

```bash
docker login
```

## Preliminary checks

Check if there is no [new version of
nodecore](https://github.com/VeriBlock/nodecore-releases). If yes,
adjust the VERSION variable in *.Dockerfile.

If you are not running on Linux, make sure your docker virtual machine
has enough RAM (I recommend 4GB+), otherwise the blockchain won't
synchronize.

## Recipes

```bash
# Start nodecore in the background
docker-compose up -d nodecore

# Look at nodecore's logs and wait for it to initialize
docker-compose logs -f nodecore

# Start the mining pool
./bin/startpool.sh

# Start miner
CORES=4 ADDR=V5M3q2hmj7RwSEM8r7otNJkNw9JW1Q docker-compose up -d nodecore-pow
```
