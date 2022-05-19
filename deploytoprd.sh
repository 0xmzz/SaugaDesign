set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:0xmzz/SaugaDesign-Site.git master:gh-pages --force

cd - 