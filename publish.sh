#!/bin/bash
set -exo
version=$1
username=$2
repository=$3
cd image
versions=("${version}" "latest")
for v in "${versions[@]}"; do
docker build -t ${repository}:${v} --progress=plain . &> build.log
docker tag ${repository} ${username}/${repository}:${v}
docker push ${username}/${repository}:${v}
done
cd -