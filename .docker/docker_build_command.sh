#!/bin/bash

docker build --rm -f Dockerfile -t endorse-command-interface \
    --build-arg GITHUB_USERNAME=$(cut -d = -f 2 .github_credentials | head -n 1 | awk '{$1=$1};1') \
    --build-arg GITHUB_PASSWORD=$(cut -d = -f 2 .github_credentials | tail -n 1 | awk '{$1=$1};1') \
    .

####!/bin/bash
###
###docker build --force-rm -t mikekaram/rb-log-sim:test --network=container:secrets-server .
