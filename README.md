# dotfiles 

My list of dotfiles 

## Environment Setup

### Debian 

Debian specific packages to install


```sh
sudo apt install network-manager

```

### General packages

Additional environment packages:

```sh
zsh kitty bemenu sway waybar dunst tmux keepassxc 
```

Install ZSH plugins

```sh
mkdir ~/.zsh_plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh_plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh_plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh_plugins/zsh-history-substring-search
source ~/.zshrc
```


## Tips

### To start a GUI

```sh
# startx ~/.config/.xinitrc
```

### To modify networks:

```sh
nmtui
```

