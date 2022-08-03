#!/bin/bash

cd super_base_app || exit
flutter pub get

cd ../super_home_app || exit
flutter pub get

cd ../super_welcome_app || exit
flutter pub get