#!/bin/bash
unset -v wowo cl; declare -a wowo; date="$(date +%y-%m-%d_%H%M%S)"; wowof="${HOME}/logs/wowo"; 
##
[ -e "${wowof}/logs/dictionary.com_${date:0:8}.html" ] && \
printf %b "\n${wowof}/logs/dictionary.com_${date:0:8}.html\nalready exists\n" || \
lynx -width 2400 -dump https://www.dictionary.com/e/word-of-the-day > ${wowof}/logs/dictionary.com_${date:0:8}.html; 
##
wowo=($(cat ${wowof}/logs/dictionary.com_${date:0:8}.html|grep -m 1 -e "Learn More" -B7|sed -e 's/[][]/\n/g'|sed -e 's/^[ \t]*//' -e '/^$/d'|sed -e 4d)); 
##
cl=$(shuf -en6 a b c d e f|tr -d '\n')

pastel=($(pastel random)); 
printf %b "${pastel[$((RANDOM%${#pastel[*]}))]}";
# pastel 

pa=$(pastel random -n1); 
paname=$(printf %b "$pa"|pastel format name); 
pansi=$(pastel format ansi-8bit $pa); 
pahex=$(pastel format hex $pa); 
pahexw=$(pastel complement $pa|pastel format hex); 


printf %b "\n  \x1b[4${pansi:(6)} \e[${#paname}b   \x1b[0m\n  \x1b[4${pansi:(6)}  ${paname}  \x1b[0m  code: $pansi\x1b[1m${pahex}\n  \x1b[4${pansi:(6)} \e[${#paname}b   \x1b[0m\n  ${pansi}\n\n";


##
IFS=$'\n'; 
convert -background "$pahex" -gravity center pango:"\
<span font='monospace' size='44444' background='$pahexw'>$(printf %b "${wowo[0]}" | gum style --border normal --padding '0 1' --margin '5 22 1 22' --align center)</span>\n
<span font='monospace' size='44444'>$(printf %b "${wowo[2]}" | gum style --border none --align center)</span>\n
<span font='monospace' size='42222'>$(printf %b "${wowo[3]}";)</span>\n
<span font='serif' size='44444'>$(printf %b "${wowo[4]}"|fmt -g 28|gum style --border none --padding '1 2 1 2' --margin '0' --align center)\n
</span>\n
<span font='monospace' size='44444'>$(pastel color $cl)\n$(printf %b "\#${cl[@]}" | gum style --border normal --padding '0 1' --margin '1 2 5 2' --align center)</span>
" ${wowof}/logs/${wowo}_${date}.jpg; 



printf %b "\nhttps://aa.aeniks.com/logs/wowo/logs/${wowo}_${date}.jpg  \n";


## get all
# wowo=($(cat ./dictionary.com_${date}.html | grep -m 1 -e 'Learn More' -B7 | sed -e '/[]/d' -e 's/Show IPA.*//g' -e '/[0-9]/d' | sed -e 's/^[ \t]*//' -e '/^$/d'))
