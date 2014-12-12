#!/bin/bash

docker run \
       --rm \
       -p 80:80 \
       -t -i gboys/sugarizer \
       "$@"
