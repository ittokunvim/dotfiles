#!/bin/bash

DIR=$(pwd)

for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -sfnv "$DIR/$f" ~/"$f"
done
