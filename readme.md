# veriblock-docker

VeriBlock distributables with Docker

## Recipes

    # Start nodecore in the background
    docker-compose up -d nodecore

    # Look at nodecore's logs and wait for it to initialize
    docker-compose logs -f nodecore

    # Start the mining pool
    ./bin/startpool.sh

    # Start miner
    CORES=4 ADDR=V5M3q2hmj7RwSEM8r7otNJkNw9JW1Q docker-compose up -d nodecore-pow
