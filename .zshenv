# Environment
source /etc/profile

setopt ALL_EXPORT

PATH="$HOME/bin/:$HOME/Dropbox/bin:/usr/local/heroku/bin:$HOME/.local/bin/:$PATH:"
# Add Go folder to path
PATH="$PATH:$HOME/gocode/bin/:"
# add PHP composer to path
PATH=$PATH:$HOME/.composer/vendor/bin/:
# add cargo path
PATH=$PATH:$HOME/.cargo/bin:

TZ="Europe/Berlin"
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='nvim'
alias vim="nvim"
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
GPGKEY=41E3EF4E

# Python stuff
SCIPY_PIL_IMAGE_VIEWER=eog
case "$OSTYPE" in
    darwin*)
        export WORKON_HOME="/Users/tante/envs/"
    ;;
    linux*)
        export WORKON_HOME="/home/tante/envs/"
    ;;
esac

# Go stuff
GOPATH=/home/tante/gocode

# virtualenvwrapper
#source /usr/bin/virtualenvwrapper.sh

unsetopt ALL_EXPORT

##--------------
## OSX Crap
###--------------

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin/:$PATH:"

##---------------
## HiRez Fixes
##---------------
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=

##--------------------------------------------------------------------
## aliases
##--------------------------------------------------------------------

alias ls='ls --color=auto'           
alias grep='grep --colour=auto'
#credit to HansHuebner https://twitter.com/HansHuebner/status/319910203346808832
alias doch='sudo $(fc -ln -1)'
# thefuck integration
#alias thefuck='eval $(thefuck $(fc -aln|tail -2|head -n 1))'
eval "$(thefuck --alias)"

# unfuck GREP
unset GREP_OPTIONS

##--------------------------------------------
## Functions
##--------------------------------------------
#
slang(){ elinks -no-references -no-numbering -dump "www.urbandictionary.com/define.php?term=$1" |sed -n '/1\. /,/2\./p'; }
