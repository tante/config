# Environment
source /etc/profile

setopt ALL_EXPORT

PATH="$HOME/bin/:$HOME/Dropbox/bin:/usr/local/heroku/bin:$HOME/.local/bin/:$PATH:"
# Add Go folder to path
PATH="$PATH:$HOME/gocode/bin/:"
# add PHP composer to path
PATH=$PATH:$HOME/.composer/vendor/bin/:

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
GPGKEY=41E3EF4E

# Python stuff
SCIPY_PIL_IMAGE_VIEWER=eog
export WORKON_HOME="/home/tante/envs/"

# Go stuff
GOPATH=/home/tante/gocode

# virtualenvwrapper
#source /usr/bin/virtualenvwrapper.sh

unsetopt ALL_EXPORT

##--------------
## OSX Crap
###--------------

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin/:$PATH:"
# ruby path
export PATH="/usr/local/opt/ruby/bin/:/usr/local/lib/ruby/gems/2.5.0/bin/:$PATH"

##---------------
## HiRez Fixes
##---------------
export QT_AUTO_SCREEN_SCALE_FACTOR=1

##--------------------------------------------------------------------
## aliases
##--------------------------------------------------------------------

alias ls='ls --color=auto'           
alias grep='grep --colour=auto'
#credit to HansHuebner https://twitter.com/HansHuebner/status/319910203346808832
alias doch='sudo $(fc -ln -1)'
# thefuck integration
alias fuck='eval $(thefuck $(fc -aln|tail -2|head -n 1))'

# unfuck GREP
unset GREP_OPTIONS

##--------------------------------------------
## Functions
##--------------------------------------------
#
slang(){ elinks -no-references -no-numbering -dump "www.urbandictionary.com/define.php?term=$1" |sed -n '/1\. /,/2\./p'; }
