#!/bin/bash
## menu fzf
zmenu() { local IFS=$'\n\t '; alts=($*); [ -z $* ] && alts=($(command ls -pw1 ./)); allw=($(printf %b "${alts[*]}"|wc -l --max-line-length)); printf %b "${alts[*]}"|bat -ppfljava|fzf-tmux -h $((allw + 4)) -w $((allw[1] + 6)) --ansi --bind "q:abort" --no-input --color "gutter:#000000,bg:#121212,bg+:#424242,list-bg:#222222,border:#424288" --no-sort; }; 
