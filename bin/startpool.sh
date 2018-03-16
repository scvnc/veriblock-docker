#!/bin/bash

echo -e 'connect nodecore:10500\ngetinfo\nstartpool\nquit\n' | docker-compose run --rm  nodecore-cli
