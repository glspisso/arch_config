
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ubuntu="sudo mount /dev/sda2 /mnt/ubuntu/"
alias ls='ls --color=auto'
alias cf="cd -P"
alias ll="ls -lh"
alias la="ls -a"
alias lsd="ls -d */"
alias finh="sudo find ./ -name "
alias cd..="cd .."
alias klogout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias pacman="sudo pacman"
alias add="git add"
alias gparted="gksu gparted"
alias matlab="matlab -nodesktop -nosplash"
alias wifi-menu="sudo wifi-menu"

# alias mpv="mpv --ytdl-format=best" 
# IW related command
alias scan="sudo iw dev wlp2s0 scan | grep SSID"
# This lines puts the ~/bin folder in the $PATH at startup
# hence commands or symlink to commands in it will
# be run from everywhere in the system
export PATH="$PATH:$HOME/bin"

# PS1='[\u@\h \W]\$ '
PS1='\[\e[0;36m\]\W \$\[\e[0m\] '
