set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:kday20/vue-app.git master:gh-pages

cd -