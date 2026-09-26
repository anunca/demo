# Release package version
- with Github actions
    - [version bump](https://github.com/anunca/demo/library/actions/workflows/version-bump.yml)
    - [version create release](https://github.com/anunca/demo/library/actions/workflows/version-create-release.yml)
- Or
```sh
VERSION=0.0.1
```
```sh
sed -i "s/\"version\": \".*\"/\"version\": \"$VERSION\"/" composer.json
```
```sh
git add composer.json
git commit -m "Version bump to $VERSION"
git push
```
```sh
git tag $VERSION
git push origin $VERSION
```