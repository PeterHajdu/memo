#!/usr/bin/env sh

echo "<html>"
echo "<head>"
echo "<title>hptr@deneb.im / posts</title>"
echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
echo "</head>"
echo "<h1 style="text-align:center">hptr@deneb.im</h1>"
lowdown public_gopher/*.md
echo "</html>"

