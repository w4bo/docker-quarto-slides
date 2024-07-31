#!/bin/bash
set -exo
version=$1
username=$2
repository=$3
# git tag -a -f ${version} ${version} -F CHANGELOG.md
# git push --force origin ${version}
# username=$(git config --get user.name)
# repository=$(basename -s .git $(git config --get remote.origin.url))
# repository=${repository%.git}
# repository=${repository#docker-}
cd image
docker build -t ${repository}:${version} --progress=plain . &> build.log
docker build -t ${repository}:latest --progress=plain . &> build.log
docker tag ${repository} ${username}/${repository}:${version}
docker tag ${repository} ${username}/${repository}:latest
docker push ${username}/${repository}:${version}
cd -