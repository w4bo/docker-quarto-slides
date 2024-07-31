#!/bin/bash
set -exo
version=$1
git tag -a -f ${version} ${version} -F CHANGELOG.md
git push --force origin ${version}
input=$(git remote get-url origin)
repo_info=${input#*:}
username=${repo_info%%/*}
repository=${repo_info#*/}
repository=${repository%.git}
repository=${repository#docker-}
docker tag ${username}/${repository}:${version} ${username}/${repository}:latest
docker push ${username}/${repository}:${version}
