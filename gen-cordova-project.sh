#!/bin/bash

git clean -d -f

# rm -rf /home/nix/.cordova/lib/tizen

node_modules/cordova/bin/cordova -d create hello com.example.hello "Hello World"
cd hello
../node_modules/cordova/bin/cordova -d platform add tizen
