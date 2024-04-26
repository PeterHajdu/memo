#!/usr/bin/env sh

function build_header {
  echo "<html>"
  echo "<head>"
  echo "<title>hptr</title>"
  echo "<style>"
  echo "  @media (prefers-color-scheme: dark){"
  echo "    body {"
  echo "      background:#000"
  echo "    }"
  echo "  }"
  echo "  body{"
  echo "    margin:1em auto;"
  echo "    max-width:40em;"
  echo "    padding:0 .62em 3.24em;"
  echo "    font:1.2em/1.62 sans-serif"
  echo "  }"
  echo "  h1,h2,h3 {"
  echo "    line-height:1.2"
  echo "  }"
  echo "  @media print{"
  echo "    body{"
  echo "      max-width:none"
  echo "    }"
  echo "  }"
  echo "</style>"
  echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
  echo "</head>"
  echo "<body>"
  echo "<h1>hptr</h1>"
  echo "contact: hptr@deneb.im<br>"
}

function build_footer {
  echo "</body>"
  echo "</html>"
}

function build_index {
  build_header
  for file in `ls -1t public_gopher/posts/`; do
    echo "<a href=""posts/$file.html"">$file</a><br>"
  done
  build_footer
}

function build_post {
  md_file=$1
  build_header
  lowdown public_gopher/posts/$md_file
  build_footer
}

build_index > public_html/index.html
mkdir -p public_html/posts
for file in `ls -t public_gopher/posts`; do
  build_post $file > public_html/posts/$file.html;
done

