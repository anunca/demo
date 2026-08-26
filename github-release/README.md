# GitHub release
## overview
- [doc](#doc)
- [notes](#notes)
## doc
- [Release package version](doc/release-package.md)
## notes
```sh
GIT_TAG_VERSION=0.0.1
```
```sh
git tag -d $GIT_TAG_VERSION
```
```sh
git tag $GIT_TAG_VERSION\
&& git push origin $GIT_TAG_VERSION
```