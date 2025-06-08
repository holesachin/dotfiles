#!/usr/bin/env bash
#
#

GIT_BRANCH="xyz"
GIT_CURRENT_BRANCH="$(git branch --show-current)"


# create branch
if [[ ! $(git branch | grep -q xyz) ]]; then
  git branch xyz
fi

# change brach
git checkout "${GIT_BRANCH}"

git add . ; git commit -am "xyz: auto commit"
git push

git checkout "${GIT_CURRENT_BRANCH}"
