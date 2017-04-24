#!/bin/bash
#
# Use fzf to search through bash history
#

# sift --no-color -e "^[^#]" --files "_${HOSTNAME_SHORT}_" -N --no-filename $HOME/Sync/Dotfiles/history | sort | uniq -c | sort | $(__fzfcmd) +s --tac +m -n1..,.. --tiebreak=index --toggle-sort=ctrl-r | sed "s/ [0-9] *//"
# $(__fzfcmd) +s --tac +m -n1..,.. --tiebreak=index --toggle-sort=ctrl-r | sed "s/ [0-9] *//"
# Note: unlike the sift version above, this ag version doesn't allow for the 
# addition of an additional pattern to the current pattern, which means that
# you're not filtering out commented (# asdlfkj?) entries in the history 
# files.

echo "hostname short"
echo ${HOSTNAME_SHORT}
ag "#@" --nocolor -G "_${HOSTNAME_SHORT}_" --nonumbers --nofilename --nobreak $HOME/.history #| \
# sort | \
# uniq -c | \
# sort | \
# fzf +s --tac +m -n1..,.. --tiebreak=index --toggle-sort=ctrl-r # | \
# sed "s/ [0-9] *//"
