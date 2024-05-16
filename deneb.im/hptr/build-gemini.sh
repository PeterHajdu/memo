#!/usr/bin/env sh

function build_index {
  echo "# hptr's capsule"
  echo ""
  echo "contact: hptr@deneb.im"
  echo ""
  echo "=> about.md about"
  echo ""

  for file in `ls -t ./posts`; do
    echo "=> posts/$file $file"
  done
}

build_index > gemini/index.gmi
mkdir -p gemini/posts
for post in `ls -t ./posts`; do
  ~/go/bin/md2gmi -i posts/$post -o gemini/posts/$post
done

