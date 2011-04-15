#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH additions and env vars for Go
export PATH=${PATH}:${HOME}/dev/go/bin
export GOROOT=${HOME}/dev/go
export GOARCH=amd64
export GOOS=linux

alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias ll='ls --color=auto -l'
alias la='ls --color=auto -al'
alias givm='gvim'
alias gitinfo='${HOME}/doc/dotfiles/git-info.txt'
alias unison='unison-gtk2'

PS1='[\u@\h \W]\$ '


