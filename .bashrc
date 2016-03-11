
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias less='/usr/share/vim/vim74/macros/less.sh'
alias spare="sudo mount /dev/sda2 /mnt/spare/"
alias ls='ls --color=auto'
alias cf="cd -P"
alias rmr="rm -r "
alias ll="ls -lh"
alias la="ls -a"
alias lsd="ls -d */"
alias finh="sudo find ./ -name "
alias cd..="cd .."
alias klogout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias pacman="sudo pacman"
alias add="git add"
alias push="git push"
alias run="gdb "
alias commit="git commit -am "
alias gparted="gksu gparted"
# alias matlab="matlab -nodesktop -nosplash"
alias wifi-menu="sudo wifi-menu"

# alias mpv="mpv --ytdl-format=best" 
# IW related command
alias scan="sudo iw dev wlp2s0 scan | grep SSID"
alias feha="feh_multi && exit"
# A function to open your pdfs
p() {
		file=$1
		if [ ${file: -4} == ".pdf" ] 
		then
		llpp $1 & disown	
		else 
		llpp	 $1pdf & disown
		fi
}



# This lines puts the ~/bin folder in the $PATH at startup
# hence commands or symlink to commands in it will
# be run from everywhere in the system
export PATH="$PATH:$HOME/bin"

# PS1='[\u@\h \W]\$ '
PS1='\[\e[1;31m\]\W \$\[\e[0m\] '
