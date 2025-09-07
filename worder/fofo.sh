#!/usr/bin/bash
igfofo() { 
## wait random time __ 
rnd=$((RANDOM%44 + 4)); 
# printf %b "\n"; 
printf %b "\n${rnd}\n"; 
sleep ${rnd}; 
# for i in $(seq ${rnd};); do printf %b "\e[G\e[K -- waiting for $((rnd - i))\tseconds ..."; 
# done; 
##
## set variables __ 
foff="${HOME}/fofo"; fofo_new="$(date +%y%m%d_%H%M%S)"; fofo_url="https://aa.aeniks.com/fofo";  
cd ${foff}; 
##
## generate quote __
# seq 12 > ${foff}/ff.log; while [ "$(cat ${foff}/ff.log | wc --lines)" -gt "4" ]; 
fortune > ${foff}/ff.log; 
##
## generate jpg __ 
convert -size 2000x2000 \
pango:"<span size='56000'>$(cat ${foff}/ff.log|fmt -w 40|gum style --padding 4 --margin 4|sed s/\\n/\\n\\n/g|tr "\t" "\n")</span>" ${foff}/${fofo_new}.jpg; 
##
## update node index,js __ 
sed -e "/url:/curl:\ \'${fofo_url}/${fofo_new}.jpg\'," ${foff}/index_template.js > ${foff}/index.js; 
##
## runit __
node index.js; 
## 
## clean up __ 
mv ${foff}/ff.log ${foff}/old/${fofo_new}.log; 
mv ${foff}/${fofo_new}.jpg ${foff}/old/; cd ${OLDPWD}; 
}; 
igfofo; 
##
##
## sudo apt install gum 
## [ -e ${foff}/old ]||mkdir ${foff}/old 2>/dev/null; 
##
##
