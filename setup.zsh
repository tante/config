CONFIG=$HOME/config

FILES=".vimrc .vim .zshrc .zshenv .pystartup .gitconfig .gvimrc .gitignore"
    
echo "Setting up Links"
for i in $FILES; do
    echo "Linking $i"
    ln -f -s $CONFIG/$i $HOME
done
echo "Done"
