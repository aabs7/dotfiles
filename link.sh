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

ln -s "$(pwd)/ssh/config" ~/.ssh/config
ln -s "$(pwd)/vim/vimrc" ~/.vimrc
ln -s "$(pwd)/git/gitconfig" ~/.gitconfig
ln -s "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/scripts/useful_functions.sh" ~/.useful_functions.sh
ln -s "$(pwd)/emacs.d" ~/.emacs.d
# link vscode settings
ln -s "$(pwd)/vscode/settings.json" $VSCODE_CONFIG_DIR/settings.json
ln -s "$(pwd)/vscode/keybindings.json" $VSCODE_CONFIG_DIR/keybindings.json

# Add to .bashrc
# If not in .bashrc then add
# echo -e "\n\n # source script functions" >> ~/.bashrc
# if ! grep -q "source ~/.useful_functions.sh" ~/.bashrc; then
#     echo "source ~/.useful_functions.sh" >> ~/.bashrc
# fi
