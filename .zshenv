# Environment
setopt ALL_EXPORT

PATH="$HOME/bin/:$HOME/Dropbox/bin:$HOME/gocode/bin/:$PATH:"
# JAVA shit
CLASSPATH=.:/home/tante/Library/jade.jar:/home/tante/Library/:/home/tante/Library/joda-time-2.2.jar:/home/tante/Library/guava-14.0.1.jar:/home/tante/Library/gson-2.2.4.jar
# try to make Java Apps look less horrible
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

TZ="Europe/Berlin"
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
ECHANGELOG_USER="Jürgen Geuter (tante) <tante@tante.cc>"
GPGKEY=41E3EF4E

# Python stuff
SCIPY_PIL_IMAGE_VIEWER=eog
export WORKON_HOME="/home/tante/envs/"

# Go stuff
GOPATH=/home/tante/gocode

# export python interpreter config
export PYTHONSTARTUP=~/.pystartup
unsetopt ALL_EXPORT


##--------------------------------------------------------------------
## aliases
##--------------------------------------------------------------------

alias ls='ls --color=auto'           
alias grep='grep --colour=auto'
#credit to HansHuebner https://twitter.com/HansHuebner/status/319910203346808832
alias doch='sudo $(fc -ln -1)'
# thefuck integration
alias fuck='eval $(thefuck $(fc -aln|tail -2|head -n 1))'


##--------------------------------------------
## Functions
##--------------------------------------------
#
slang(){ elinks -no-references -no-numbering -dump "www.urbandictionary.com/define.php?term=$1" |sed -n '/1\. /,/2\./p'; }
