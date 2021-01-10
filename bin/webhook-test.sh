#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "please provide webhook id as first argument";
    exit 1
fi;

if [ -z "$2" ]
  then
    echo "please provide your repository branch as secong argument";
    exit 1
fi;

if [ -z "$3" ]
  then
    echo "please provide your github webhook secret as third argument";
    exit 1
fi;

SECRET=$(echo -n "{\"ref\":\"refs/heads/$2\"}" | openssl sha1 -hmac "$3" | cut -d ' ' -f 2-)

curl -X POST -H "X-Hub-Signature: sha1=$SECRET" -H "Content-Type: application/json" -d "{\"ref\":\"refs/heads/$2\"}" -v "http://localhost:9000/hooks/$1"