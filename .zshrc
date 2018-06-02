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
antigen theme ~/config/customization/themes tante
if [ $UID -eq 0 ]; then 
    source /root/config/customization/themes/tante.zsh-theme ;
fi

antigen apply

# Shell customization
setopt  notify correct autolist appendhistory autocd histignoredups nocorrectall extended_glob
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first

# load local environment
source $HOME/config/.zshenv
