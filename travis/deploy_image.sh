#!/bin/bash
# Pushes new docker image to docker hub
# PREREQS: Caller (travis-ci) should have set $TARGET_IMAGE and $TRAVIS_COMMIT
# ARGS:  Expects owner/repo and tag arguments

# DO NOT set -x as that exposes passwords!
set -e
NAME=${1:?Please provide the full image name e.g. owner/repo}
TAG=${2:?Please provide the commit tag, e.g. latest}

owner_repo='(.*)\/(.*)'
if [[ $NAME =~ $owner_repo ]]; then
  OWNER=${BASH_REMATCH[1]}
  REPO=${BASH_REMATCH[2]}
  echo 'Owner = ' $OWNER ' repo = ' $REPO
else
  echo 'NAME must be in form owner/repo'
  exit 1
fi

if [[ $TARGET_IMAGE =~ $owner_repo ]]; then
  T_OWNER=${BASH_REMATCH[1]}
  T_REPO=${BASH_REMATCH[2]}
else
  echo '$TARGET_IMAGE must be set, in owner/repo format.'
fi

echo 'Target: ' $TARGET_IMAGE

if [[ $T_OWNER == $OWNER ]]; then
  # This is the mlab origin, so just use the provided tag.
  echo 'Adding ' $NAME':'$TAG
  docker tag $TARGET_IMAGE':'$TRAVIS_COMMIT $NAME':'$TAG
else 
  # This some other fork, so adjust the name
  echo 'Adding ' $TARGET_IMAGE':'$OWNER'-'$TAG
  docker tag $TARGET_IMAGE':'$TRAVIS_COMMIT $TARGET_IMAGE':'$OWNER'-'$TAG
fi

# Push the image out to dockerhub
echo 'Pushing ' $TARGET_IMAGE ' from ' $NAME
docker inspect $TARGET_IMAGE':'$TRAVIS_COMMIT
docker login -u $DOCKER_USER -p $DOCKER_PASS

# Push all tags
docker push $TARGET_IMAGE

exit 0
