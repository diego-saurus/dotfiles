Diegosaurus custom dotfiles

Installation lists

```
#Tmux
ln -s -n ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Neovim
ln -s -n ~/.config/dotfiles/nvim ~/.config/nvim

# Ghostty
ln -s -n ~/.config/dotfiles/ghostty ~/.config/ghostty

# Oh My Zsh
ZSH_CUSTOM=~/.config/dotfiles/omz
ln -s -n ~/.config/dotfiles/omz ~/.oh-my-zsh/custom

## Omz Plugins
### fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/fast-syntax-highlighting

### zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
```
