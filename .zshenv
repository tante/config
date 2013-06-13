# Environment
setopt ALL_EXPORT

PATH="/home/tante/bin/:$PATH:"
CLASSPATH=.:/home/tante/Library/jade.jar:/home/tante/Library/:/home/tante/Library/joda-time-2.2.jar:/home/tante/Library/guava-14.0.1.jar:/home/tante/Library/gson-2.2.4.jar

TZ="Europe/Berlin"
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
LC_ALL="en_US.UTF-8"
ECHANGELOG_USER="Jürgen Geuter (tante) <tante@tante.cc>"
GPGKEY=41E3EF4E
SCIPY_PIL_IMAGE_VIEWER=eog

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
alias gvim="gvim -f" # fixes powerline gvim hang bug

##--------------------------------------------
## Functions
##--------------------------------------------
#
slang(){ elinks -no-references -no-numbering -dump "www.urbandictionary.com/define.php?term=$1" |sed -n '/1\. /,/2\./p'; }
