#!/bin/bash
## menu fzf
zmenu() { local IFS=$'\n\t '; alts=($*); [ -z "$1" ] && alts=($(command ls -pw1 ./)); allw=($(printf %b "${alts[*]}"|wc -l --max-line-length|tr -s "\n\t " " ")); printf %b "${alts[*]}"|bat -ppfld --theme Dracula|fzf-tmux --min-height 2 -h $((allw + 4)) -w $((allw[1] + 6)) --ansi --bind "q:abort" --no-input --color "gutter:#000000,bg:#121212,bg+:#424242,list-bg:#222222,border:#424288" --no-sort; }; 
