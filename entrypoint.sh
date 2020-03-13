#!/bin/bash

mkdir -p /output
./gradlew --stack --info assemble${BUILD_VARIANT}