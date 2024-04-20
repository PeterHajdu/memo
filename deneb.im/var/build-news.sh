#!/usr/bin/env sh

echo "<html>"
echo "<h1 style="text-align:center">deneb.im / news</h1>"
lowdown gopher/news.md
echo "</html>"

