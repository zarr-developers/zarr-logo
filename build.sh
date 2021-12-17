#! /bin/sh

set -e
set -u
set -x

mkdir -p target/pngs

convert_each(){
    convert -background none ${1}.svg target/pngs/${1}-transparent.png
    convert -background white ${1}.svg target/pngs/${1}-on-white.png
    convert -background black ${1}.svg target/pngs/${1}-on-black.png
}

convert_each zarr-pink-horizontal
convert_each zarr-pink-stacked

# And convert the gradient as is
convert zarr-gradient-2.svg target/pngs/zarr-gradient.png

cd target/pngs
zip -r ../zarr-logos.zip *.png
