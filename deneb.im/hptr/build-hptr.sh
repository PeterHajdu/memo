#!/usr/bin/env sh

function build_index {
  echo "<html>"
  echo "<head>"
  echo "<title>hptr@deneb.im</title>"
  echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
  echo "</head>"
  echo "<body style=""text-align:center"">"
  echo "<h1>hptr@deneb.im</h1>"
  for file in `ls -1 public_gopher/posts/`; do
    echo "<a href=""posts/$file.html"">$file</a><br>"
  done
  echo "</body>"
  echo "</html>"
}

function build_post {
  md_file=$1
  echo "<html>"
  echo "<head>"
  echo "<title>hptr@deneb.im</title>"
  echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
  echo "</head>"
  echo "<body>"
  echo "<h1 style=""text-align:center"">hptr@deneb.im</h1>"
  lowdown public_gopher/posts/$md_file
  echo "</body>"
  echo "</html>"
}

build_index > public_html/index.html
mkdir -p public_html/posts
for file in `ls public_gopher/posts`; do
  build_post $file > public_html/posts/$file.html;
done

