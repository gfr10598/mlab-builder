#!/bin/bash
# Pushes new docker image to docker hub
# DO NOT set -x as that exposes passwords!
set -e

# Push the image out to dockerhub
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
export REPO=measurementlab/ndt-builder
export TAG=`if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo $TRAVIS_BRANCH ; fi`
docker tag gfr10598/mlab-builder $REPO:$COMMIT
docker tag $REPO:$COMMIT $REPO:$TAG
docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
docker push $REPO

exit 0
