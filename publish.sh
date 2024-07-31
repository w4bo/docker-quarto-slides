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
versions=("${version}" "latest")
for version in "${versions[@]}"; do
docker build -t ${repository}:${version} --progress=plain . &> build.log
docker tag ${repository} ${username}/${repository}:${version}
docker push ${username}/${repository}:${version}
done
cd -