FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y curl wget unzip openjdk-8-jdk git && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

ARG ANDROID_CLI_VERSION=6200805
ARG ANDROID_PLATFORMS_VERSION=android-28
ARG ANDROID_BUILD_TOOLS_VERSION=28.0.3

ENV ANDROID_SDK_ROOT=/android \
    PATH=${PATH}:/android/tools/bin/ \
    BUILD_VARIANT=Release

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    mkdir /android && \
    cd /android && \
    wget --quiet https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_CLI_VERSION}_latest.zip -O cli.zip && \
    unzip cli.zip && \
    rm cli.zip && \
    yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses > /dev/null && \
    sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install \
        "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
        "platforms;${ANDROID_PLATFORMS_VERSION}" \
        "platform-tools"
        
VOLUME /root/.gradle

WORKDIR /app/android

ENTRYPOINT [ "/entrypoint.sh" ]
