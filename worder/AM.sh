
ol=$(pastel random -n1|pastel desaturate .22|pastel darken .12); printf %b "$ol"|pastel color; printf %b "$ol"|pastel rotate 1905|pastel lighten .22

ol1=$(pastel random -n1|pastel desaturate .00422|pastel darken .14); ol2="$(pastel complement $ol1)"; for i in $ol1 $ol2; do printf %b "$i\n"; printf %b "$i"|pastel format name; pastel format hex $i; pastel format ansi-8bit $i; done;
