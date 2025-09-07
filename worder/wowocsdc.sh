wowo() { local IFS=$'\n'; wowo=($(lynx -width 2400 -dump https://www.dictionary.com/e/word-of-the-day | grep -m 1 -e "Learn More" -B7|sed -e '/^$/d' -e 's/\]\ /\]\n/g' -e 's/^[ \t]*//'|sed -e 4d -e 7d)); printf %b "${wowo[*]}"| tee ${wowo[0]}; }; 
wowo 
