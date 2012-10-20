#!/bin/sh
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\"" > ~/Desktop/cache.html
echo "    \"http://www.w3.org/TR/html4/strict.dtd\">" >> ~/Desktop/cache.html
echo "<html lang=\"en\">" >> ~/Desktop/cache.html
echo "  <head>" >> ~/Desktop/cache.html
echo "    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">" >> ~/Desktop/cache.html
echo "    <title>Cached Images</title>" >> ~/Desktop/cache.html
echo "  </head>" >> ~/Desktop/cache.html
echo "  <body>" >> ~/Desktop/cache.html
sqlite3 ~/Library/Caches/com.apple.Safari/Cache.db "SELECT request_key, time_stamp FROM cfurl_cache_response WHERE request_key LIKE '%.pdf' OR '%.jpg' OR request_key LIKE '%.jpeg' OR request_key LIKE '%.gif' OR request_key LIKE '%.png' ORDER BY time_stamp DESC;" | perl -ne 'chomp; ($url, $time) = split(/\|/); print "<a href=\"$url\"><img src=\"$url\" alt=\"Downloaded at $time\"></a> <a href=\"$url\">$url</a> $time<br>\n";' >> ~/Desktop/cache.html
echo "  </body>" >> ~/Desktop/cache.html
echo "</html>" >> ~/Desktop/cache.html
open -a Safari ~/Desktop/cache.html
sleep 1
rm ~/Desktop/cache.html
