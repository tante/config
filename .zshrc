# Load Antigen
source ~/config/antigen/antigen.zsh

# Load various lib files
#antigen bundle robbyrussell/oh-my-zsh /lib 
antigen use oh-my-zsh

# Antigen Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

antigen bundle jdavis/zsh-files

# Antigen Theme
#antigen theme ~/config/customization/themes tante
#if [ $UID -eq 0 ]; then 
#    source /root/config/customization/themes/tante.zsh-theme ;
#fi
antigen theme agnoster
antigen apply

# Shell customization
setopt  notify correct autolist appendhistory autocd histignoredups nocorrectall extended_glob
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first


unset GREP_OPTIONS
# remove security question
unalias rm

# load local environment
source $HOME/config/.zshenv

# disable bracketed paste because it's buggy
zle -N bracketed-paste-magic

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# add timestamp to prompt
export PROMPT='%{$fg[yellow]%}[%D{%H:%M:%S}] '$PROMPT
