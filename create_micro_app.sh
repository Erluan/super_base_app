#!/bin/bash

MICRO_APP_NAME=$1
APP_NAME="example_"$MICRO_APP_NAME"_app"
shift

if [ -z $MICRO_APP_NAME ]; then
  echo "Missing 1st argument: should be a name to a new Micro App";
  exit 1;
fi

echo "Create new Micro App: $APP_NAME"

flutter create --template=package "$APP_NAME"

cd example_base_app || exit

echo "Adding "$APP_NAME" to pubspec"

sed -i '' '/^dependency_overrides:.*/a\
  '"${APP_NAME}"': \
    path: ../'"${APP_NAME}"'
' pubspec.yaml || exit

flutter pub get

echo "$APP_NAME Created!"