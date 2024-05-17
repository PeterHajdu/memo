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

function build_rss {
  echo '<?xml version="1.0" encoding="UTF-8" ?>'
  echo '<rss version="2.0">'
  echo '<channel>'
  echo "<title>hptr's gemini capsule</title>"
  echo "<description>hptr's rambling about life, the universe, and everything</description>"
  echo '<link>gemini://deneb.im/users/hptr/</link>'

  for file in `ls -t ./posts`; do
    echo '<item>'
    echo "<title>$file</title>"
    echo "<description>$file</description>"
    echo "<link>gemini://deneb.im/users/hptr/posts/$file</link>"
    echo "<guid>gemini://deneb.im/users/hptr/posts/$file</guid>"
    echo '</item>'
  done

  echo '</channel>'
  echo '</rss>'
}

build_index > gemini/index.gmi
mkdir -p gemini/posts
for post in `ls -t ./posts`; do
  ~/go/bin/md2gmi -i posts/$post -o gemini/posts/$post
done

build_rss > gemini/rss.xml
