#!/bin/bash

set -e

# Clone the dart sdk
# git clone https://github.com/dart-lang/sdk.git dart_sdk

# Set this to point at at the git checkout of the dart sdk.
DART_SDK=../dart_sdk

rm -rf out
mkdir -p out

# Using the dartdevc shipped with the dart sdk v1.19.1
dartdevc -o out/hello_world.js --modules legacy -s $DART_SDK/pkg/dev_compiler/lib/js/legacy/dart_sdk.sum hello_world.dart

cp hello_world.html out/
cp $DART_SDK/pkg/dev_compiler/lib/js/legacy/dart_library.js out/
cp $DART_SDK/pkg/dev_compiler/lib/js/legacy/dart_sdk.js out/

# Install https://pub.dartlang.org/packages/web_server
# pub global activate web_server
# export PATH=$PATH:~/.pub-cache/bin
# web_server --port=8282 out

# open http://localhost:8282/hello_world.html
