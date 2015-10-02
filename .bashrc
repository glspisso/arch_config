#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cf="cd -P"
alias ll="ls -l"
alias ll="ls -a"
alias finh="find ./ -name"
alias cd..="cd .."
alias klogout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias pacman="sudo pacman"
alias add="git add"

PS1='[\u@\h \W]\$ '
