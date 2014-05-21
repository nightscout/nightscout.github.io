#! /bin/bash -eu

function replace_token ( ) {
  echo $1 | sed -e "s/git@/$GH_TOKEN@/g"
}

rm -f out
# mkdir out
GIT_REMOTE=$(git config remote.origin.url)
NEW_REMOTE=$(replace_token $GIT_REMOTE)
( git clone -q -b master $NEW_REMOTE out ) 2>&1 > /dev/null
ls out
(
  cd out;
  git rm -r -q ./*
  ls

)
./node_modules/.bin/docpad generate --env static
(
  cd out;
  touch .nojekyll
  git add ./
  git status
  msg="build from $((cd ../; git rev-parse HEAD))"
  git commit -avm "$msg"
  # gh-pages uses master branch on user/org repos
  ( git push -q origin master:master
  ) 2>&1 > /dev/null

)
