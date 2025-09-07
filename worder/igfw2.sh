#!/bin/bash
#igdd=~/logs/words; 
igff=~/logs/igff; 
dddd="dd$(date +%y%m%d%H%M%S)"; 
ig_file=${igff}/${dddd}; 
igur="https://aa.aeniks.com/logs/igff"; 
[ -e ~/logs/igff/ ] 2>/dev/null || mkdir -p $igff -m 775; 
####
lynx "http://www.thefreedictionary.com/_/WoD/rss.aspx" -dump -width 800 -force_empty_hrefless_a | tr "<>/" "\n" | grep -e "Definition" | cut -f2 -d" " --complement > ${igfile}.log; 
printf %b "done\n"; 
####
for i in $(cat ${igfile}.log | nl --number-width=1|cut -c1); 
do 
printf -v "igf" %b "$(sed -n ${i}p ${igfile}.log)"; 
printf -v "igfw" %b "\n$(printf %b "$igf"|cut -f1 -d" ")"; 
[ -e ${igff}/${igfw}.jpg ] && printf %b "${igff}/${igfw}.jpg already exist\n" && break; 
(figlet -w ${COLUMNS-222} -f Roman "$(printf %b "\n\n$igf" | \
cut -f1 -d" ")"|tr "''" "+"|bat -ppfljava; 
####
printf %b "\n\e[2A\e[2m${igf}\e[0m\n" | \
cut -f2 -d" " | bat -ppflr; 
printf %b "\n${igf}" | \
cut -f3- -d" " | fmt -g 55 | \
gum style --border none  --align center --padding "0" --margin "0" | \
gum style --margin "1 40 22 40" --padding "1 2" --border normal | \
bat -ppfljava) | aha | tail -n+11 | head -n-3 | \
sed -e 's/style\=//g' -e s/\"color\:/color\=\'/g -e s/[\"]/\'/g -e s/\;\'\>/\'\>/g | \
col -xb|ul > ${igff}/${igf}.html; 
####
####
# [ -e ${igff}/${igfw}.jpg ] 
convert -background "#222222" -gravity center pango:\
"<tt>$(cat $igfw.html)</tt>" \
${igff}/${igfw}.jpg; 
####
sed -e "/url:/curl:\ \'${igur}/${igfw}.jpg\'," ${igff}/index_template.js > ${igff}/index.js; 
node index.js; 
####
done; 
####
####
printf %b "\ndone\n"; 
##

## runit __
## 
## clean up __ 
#mv ${foff}/ff.log ${foff}/old/${fofo_new}.log; 
#mv ${foff}/${fofo_new}.jpg ${foff}/old/; cd ${OLDPWD}; 
##
##
## sudo apt install gum 
## [ -e ${foff}/old ]||mkdir ${foff}/old 2>/dev/null; 
##
##
