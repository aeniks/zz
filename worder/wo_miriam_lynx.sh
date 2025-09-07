#sed -n 45p
#sed -n 48p
#sed -n54,56p


lynx -reload -dont-wrap-pre -force_empty_hrefless_a -dump https://www.merriam-webster.com/word-of-the-day |grep -e 'Est. 1828' -A20|tail -n+7|grep -Ev "[][]|//|What It Means"|tr -s "\n " "\n "|sed -n 45,56p; 
