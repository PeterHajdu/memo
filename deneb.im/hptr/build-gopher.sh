#!/usr/bin/env sh

function build_gophermap {
  echo "!@hptr"
  echo ""
  echo "contact: hptr@deneb.im"
  echo ""
  echo "0 About	/~hptr/about.md	deneb.im	70"
  echo ""
  echo "=== phlog ==="
  echo ""

  for file in `ls -t ./posts`; do
    echo "0 $file	/~hptr/posts/$file	deneb.im	70"
  done
}

build_gophermap > public_gopher/gophermap
cp -r posts public_gopher/

