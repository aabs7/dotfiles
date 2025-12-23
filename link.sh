# Set vscode config directory according to linux or mac
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export VSCODE_CONFIG_DIR="$HOME/.config/Code/User"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
fi

rm -rf ~/.ssh/config ~/.vimrc
rm -rf ~/.gitconfig
rm -rf $VSCODE_CONFIG_DIR/settings.json
rm -rf $VSCODE_CONFIG_DIR/keybindings.json
rm -rf ~/.tmux.conf ~/.useful_functions.sh
rm -rf ~/.emacs.d

ln -s "$(pwd)/vim/vimrc" ~/.vimrc
ln -s "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/scripts/useful_functions.sh" ~/.useful_functions.sh
ln -s "$(pwd)/emacs.d" ~/.emacs.d
# link vscode settings
ln -s "$(pwd)/vscode/settings.json" $VSCODE_CONFIG_DIR/settings.json
ln -s "$(pwd)/vscode/keybindings.json" $VSCODE_CONFIG_DIR/keybindings.json


# ask to copy ssh/config to .ssh/config
read -p "Do you want to remove your ~/.ssh/config and copy template ssh/config? (y/n): "
if [[ $REPLY =~ ^[Yy](es)?$ ]]; then
    rm -f ~/.ssh/config
    cp ssh/config ~/.ssh/config
fi

# ask to copy git/gitconfig to .gitconfig
read -p "Do you want to remove your ~/.gitconfig and copy template git/gitconfig? (y/n): "
if [[ $REPLY =~ ^[Yy](es)?$ ]]; then
    rm -f ~/.gitconfig
    cp git/gitconfig ~/.gitconfig
fi

echo "All done!"
echo "Please make sure you've installed the install script from "scripts/install.sh""
