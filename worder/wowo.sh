#!/usr/bin/env bash
####
wo_home=${HOME}/logs/wowo; 
wo_log=${wo_home}/logs; 
####
[ -d ${wolog} ] 2>/dev/null || mkdir -p -m 775 ${wolog} 2>/dev/null; 
####
####
####
wo_web() { 
local IFS=$'\n'; 
wowo=($(lynx -width 2400 -dump https://www.dictionary.com/e/word-of-the-day | \
grep -m 1 -e "Learn More" -B7 | \
sed -e '/^$/d' -e 's/\]\ /\]\n/g' -e 's/^[ \t]*//' | \
sed -e 4d -e 7d)); 
####
printf %b "${wowo[*]}" | tee ${wo_log}/${wowo}.log; 
####
####
wo_img() { 
clcl=($(shuf -rn6 -e a b c d e f|tr -d '\n'))
####
local IFS=$'\n'; 
convert -background "#$clcl" -gravity center pango:"
<span font='monospace' size='22222'>$(IFS=$'\n'; printf %b "\n${wowo[0]}\n\n${wowo[2]}\n${wowo[3]}\n\n${wowo[4]}"|fmt -g 22 -w 44|gum style --border normal --padding '1 2' --margin '5 12' --align center)\n#${clcl}</span>" ${wo_log}/${wowo}.jpg; 
}; 
####
wo_img; 
}; 
##
##
wo_web | tee -a ${wo_log}/wolog.log; 
# printf %b "\n$(date -R)\n$0 - $UID - $SHELL - $TERM\n----\n" | tee -a ${wo_log}/wolog.log; 
# 
# 
# #!/bin/bash
# unset -v wowo; declare -a wowo; date="$(date +%y-%m-%d)"; wowof="${HOME}/logs/wowo"; 
# ##
# [ -e "${wowof}/logs/dictionary.com_${date}.html" ] && \
# #printf %b "\n${wowof}/logs/dictionary.com_${date}.html\nalready exists\n" || \
# lynx -width 2400 -dump https://www.dictionary.com/e/word-of-the-day > ${wowof}/logs/dictionary.com_${date}.html; 
# ##
# wowo=($(cat ${wowof}/logs/dictionary.com_${date}.html|grep -m 1 -e "Learn More" -B7|sed -e 's/[][]/\n/g'|sed -e 's/^[ \t]*//' -e '/^$/d'|sed -e 4d)); 
# ##
# c1="$(shuf -zen1 a b c d e f)"; c2="$(shuf -zen1 a b c d e f)"; 
# c3="$(shuf -zen1 a b c d e f)"; c4="$(shuf -zen1 a b c d e f)"; 
# cl=$c1$c1$c2$c2$c3$c3; 
# ##
# IFS=$'\n'; 
# convert -background "#$cl" -gravity center pango:"\
# <span font='monospace' size='44444'>$(printf %b "${wowo[0]}" | gum style --border normal --padding '0 1' --margin '5 2 1 2' --align center)</span>\n
# <span font='monospace' size='44444'>$(printf %b "${wowo[2]}" | gum style --border none --align center)</span>\n
# <span font='monospace' size='42222'>$(printf %b "${wowo[3]}";)</span>\n
# <span font='serif' size='44444'>$(printf %b "${wowo[4]}"|fmt -g 28|gum style --border none --padding '1 2 1 2' --margin '0 12 5 12' --align center)\n
# </span>
# <span>\n$cl</span>
# " ${wowo}${date}.jpg; 
# 
# 
# 
# printf %b "\nhttps://aa.aeniks.com/logs/wowo/${wowo}${date}.jpg  \n";
# 
# 
# ## get all
# # wowo=($(cat ./dictionary.com_${date}.html | grep -m 1 -e 'Learn More' -B7 | sed -e '/[]/d' -e 's/Show IPA.*//g' -e '/[0-9]/d' | sed -e 's/^[ \t]*//' -e '/^$/d'))
