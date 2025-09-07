#!/bin/bash
#igdd=~/logs/words; 
igff() { 
igff=~/logs/igff; 
dddd=dd$(date +%y%m%d%H%M%S); 
ig_file=${igff}/${dddd}; 
igur="https://aa.aeniks.com/logs/igff"; 
[ -d ~/logs/igff/up ] 2>/dev/null || mkdir -p ${igff}/up -m 775; 
cd ${igff}; 
####
lynx "http://www.thefreedictionary.com/_/WoD/rss.aspx" -dump -width 800 -force_empty_hrefless_a | tr "<>/" "\n" | grep -e "Definition" | cut -f2 -d" " --complement > ${igfile}.log; 
printf %b "done\n"; 
####
for i in $(cat ${igfile}.log | nl --number-width=1|cut -c1); 
do 
printf -v "igf" %b "$(sed -n ${i}p ${igfile}.log)"; 
printf -v "igfw" %b "$(sed -n ${i}p ${igfile}.log|cut -f1 -d" ")"; 
####
[ -e ${igff}/${igfw}.jpg ] && printf %b "${igff}/${igfw}.jpg already exist\n" && break; 
####
(figlet -w 2222 -f Roman "$(printf %b "\n\n${igfw}" | \
cut -f1 -d" ")"|tr "''" "+"|bat -ppfljava; 
####
####
printf %b "\n\e[2A\e[2m${igf}\e[0m\n" | \
cut -f2 -d" " | bat -ppflr; 
printf %b "\n${igf}" | \
cut -f3- -d" " | fmt -g 55 | \
gum style --border none  --align center --padding "0" --margin "0" | \
gum style --margin "1 40 22 40" --padding "1 2" --border normal | \
bat -ppfljava) | aha | tail -n+11 | head -n-3 | \
sed -e 's/style\=//g' -e s/\"color\:/color\=\'/g -e s/[\"]/\'/g -e s/\;\'\>/\'\>/g | \
col -xb|ul > ${igff}/${igfw}.html; 
####
####
# [ -e ${igff}/${igfw}.jpg ] 
convert -background "#222222" -gravity center pango:\
"<tt>$(cat ${igff}/${igfw}.html)</tt>" \
${igff}/${igfw}.jpg; 
####
####
sed -e "/url:/curl:\ \'${igur}\/${igfw}\.jpg\'," ${igff}/index_template.js > ${igff}/index.js; 
[ -e ${igff}/up/${igfw}.jpg ] || node ${igff}/index.js && \
mv ${igff}/${igfw}.jpg ${igff}/up/${igfw}.jpg; 
####
rrrr="$((RANDOM%12+22))"; 
printf %b "\nsleep $rrrr\n"; 
sleep $rrrr; 
done; 
####
printf %b "\ndone\n"; 
}; 
igff
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
