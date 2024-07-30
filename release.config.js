const publishCmd = `
git tag -a -f \${nextRelease.version} \${nextRelease.version} -F CHANGELOG.md
git push --force origin \${nextRelease.version}
input=$(git remote get-url origin)
repo_info=\${input#*:}
username=\${repo_info%%/*}
repository=\${repo_info#*/}
repository=\${repository%.git}
repository=\${repository#docker-}
docker tag \${username}/\${repository}:\${nextRelease.version} \${username}/\${repository}:latest
docker push \${username}/\${repository}:\${nextRelease.version}
`;
const config = require('semantic-release-preconfigured-conventional-commits');
config.plugins.push(
    ["@semantic-release/exec",
        {
            "publishCmd": publishCmd,
        }],
    ["@semantic-release/github",
        {
            "assets": [ /* {"path": "welaser/testScripts/*.pdf", "label": "Charts"} */]
        }],
    "@semantic-release/git"
)
module.exports = config
