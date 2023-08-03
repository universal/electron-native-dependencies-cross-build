#! /bin/bash

docker run --rm \
        --env-file <(env | grep -iE 'DEBUG|NODE_|ELECTRON_|YARN_|NPM_|CI|CIRCLE|TRAVIS|APPVEYOR_|CSC_|_TOKEN|_KEY|AWS_|STRIP|BUILD_') \
        -v "$(pwd)":/project \
        -v "$(pwd)/.cache/electron":/root/.cache/electron \
        -v "$(pwd)/.cache/electron-builder":/root/.cache/electron-builder \
        electronuserland/builder:18-wine \
        /bin/bash -c "yarn --link-duplicates --pure-lockfile && yarn release --win"
