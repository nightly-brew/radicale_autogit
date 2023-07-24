#!/bin/sh

cd "/var/lib/radicale/collections"

if [ ! -d ".git" ]; then
  git init
  git config user.name  "radicale_autogit"
  git config user.email "autogit@radicale.localdomain"
  echo -e ".Radicale.cache\n.Radicale.lock\n.Radicale.tmp-*" > ".gitignore"

  git add ".gitignore"
  git commit -m "Radicale collection repo setup"
fi

git add -A
git diff --cached --quiet || git commit -m "Changes by ${1}"