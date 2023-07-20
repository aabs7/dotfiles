# Delete existing files before linking
rm -rf ~/.ssh/config ~/.vimrc ~/.gitconfig ~/.config/Code/User/settings.json ~/.config/Code/User/keybindings.json
rm -rf ~/.tmux.conf ~/.useful_functions.sh

ln -s "$(pwd)/ssh/config" ~/.ssh/config
ln -s "$(pwd)/vim/vimrc" ~/.vimrc
ln -s "$(pwd)/git/gitconfig" ~/.gitconfig
ln -s "$(pwd)/vscode/settings.json" ~/.config/Code/User/settings.json
ln -s "$(pwd)/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
ln -s "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/scripts/useful_functions.sh" ~/.useful_functions.sh

# Add to .bashrc
# If not in .bashrc then add
echo -e "\n\n # source script functions" >> ~/.bashrc
if ! grep -q "source ~/.useful_functions.sh" ~/.bashrc; then
    echo "source ~/.useful_functions.sh" >> ~/.bashrc
fi
