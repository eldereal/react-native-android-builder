# react-native-android-builder

Build react native android projects on docker


## Usage

```bash
docker run -it --rm -v PROJECT_ROOT:/app
```

`PROJECT_ROOT`: Your project **nodejs** root folder (the folder contains `package.json`, not `/android` subfolder)

Output artifacts will be placed at `PROJECT_ROOT/build`



## With Gradle cache

Add parameter `-v GRADLE_CACHE_VOLUME_OR_FOLDER:/root/.gradle` to run arguments.



## Custom Build Types and Flavors

Add environment `-e BUILD_VARIANT=FlavorType` to run arguments.



