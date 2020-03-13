#!/bin/bash

mkdir -p /app/build
./gradlew --stack --info assemble${BUILD_VARIANT}