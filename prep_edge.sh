#!/bin/bash
#
# Basically copy files from stable and remove git checkout lines from the Dockerfile
#
rm -r edge
cp -r stable/ edge/
sed -i '/checkout/d' edge/Dockerfile >/dev/null 2>&1 || sed -i '' '/checkout/d' edge/Dockerfile #handle Unix and MacOS
