# Diegosaurus custom dotfiles

## Clone Instruction 
```sh
git clone https://github.com/diego-saurus/dotfiles ~/.config/dotfiles
```

## Symlink Installation
### Tmux
```sh
ln -s -n ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

### Neovim
```sh
ln -s -n ~/.config/dotfiles/nvim ~/.config/nvim
```

### Ghostty
```sh
ln -s -n ~/.config/dotfiles/ghostty ~/.config/ghostty
```

### Oh My Zsh
### Add this env to ~/.zshrc 
```sh
export ZSH_CUSTOM=~/.config/dotfiles/omz
```
### Omz Plugins
#### fast-syntax-highlighting
```sh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/fast-syntax-highlighting
```

#### zsh-autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
```
