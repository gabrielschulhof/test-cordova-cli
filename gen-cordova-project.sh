#!/bin/bash

git clean -d -f

rm -rf /home/nix/.cordova/lib/tizen

node_modules/cordova/bin/cordova create hello com.example.hello "Hello World"
