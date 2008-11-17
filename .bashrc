# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
alias ls='ls --color=auto'
alias grep='grep --colour=auto'

# Change the window title of X terminals 
case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# ignore duplicate history entries
export HISTCONTROL=ignoredups

export EDITOR=vim
export ECHANGELOG_USER="Jürgen Geuter (tante) <tante@the-gay-bar.com>"

# I want a bin folder in my home dir
export PATH=$PATH:~/bin/:

export GPGKEY=74CD65AB
shopt -s checkwinsize
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

#environment to speed intel GMA up
export INTEL_BATCH=1

# some convenient aliases
alias open="gnome-open"
