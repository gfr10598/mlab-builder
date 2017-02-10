# mlab-builder [![Test Status](https://travis-ci.org/gfr10598/mlab-builder.svg?branch=master)](https://travis-ci.org/gfr10598/mlab-builder.svg?branch=master)

Docker file for creating mlab builder images.

## Building
To build the docker image and tag it as gfr10598/mlab-builder...

    docker build https://github.com/gfr10598/mlab-builder

## Running the builder
The builder is configured by default to build iupui_ndt.

To do this, after building...

    docker run -v `pwd`/ndt:/root/builder gfr10598/mlab-builder

On completion, the newly build NDT code will be available in the ndt subdirectory.


## To build other slices:
To start a bash shell instead:

    docker run -ti gfr10598/mlab-builder bash

This will leave you in a 32 bit bash shell.

