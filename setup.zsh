CONFIG=$HOME/config

FILES=(.vimrc .vim .zshrc .zshenv .pystartup .gitconfig .gvimrc .gitignore)

# Special Treatment for oh-my-zsh-theme
ln -f -s $CONFIG/customization/themes $CONFIG/oh-my-zsh/custom/

echo "Setting up Links"
for i in $FILES; do
    echo "Linking $i \n"
    ln -f -s $CONFIG/$i $HOME
done
echo "Done"
