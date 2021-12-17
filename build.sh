#! /bin/sh

find * -name *.svg -exec sh -c 'convert -background none $1 "${1%.*}.png"' sh {} \;
mkdir -p target
zip -r target/zarr-logos.zip *.png
