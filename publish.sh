#!/bin/bash
set -exo
version=$1
git tag -a -f ${version} ${version} -F CHANGELOG.md
git push --force origin ${version}
repo_info=${input#*:}
username=$(git config --get user.name)
repository=$(basename -s .git $(git config --get remote.origin.url))
repository=${repository%.git}
repository=${repository#docker-}
docker tag ${username}/${repository}:${version} ${username}/${repository}:latest
docker push ${username}/${repository}:${version}
