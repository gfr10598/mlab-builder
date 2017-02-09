# mlab-builder [![Test Status](https://travis-ci.org/gfr10598/mlab-builder.svg?branch=master)](https://travis-ci.org/gfr10598/mlab-builder.svg?branch=master)

Docker file for creating mlab builder images.

## Building
docker build -t "gfr10598/mlab-builder" .

This creates a docker image called gfr10598/mlab-builder

## Running the builder
The builder is configured by default to build iupui_ndt.

To do this, after building...

docker run -it gfr10598/mlab-builder

## To build other slices:
Prevent building the ndt slice by:

docker run -it --entrypoint linux32 gfr10598/mlab-builder bash

This will leave you in a 32 bit bash shell.

