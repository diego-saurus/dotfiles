#!/bin/zsh
read -r ROWS COLS < <(stty size)

# Refrence : https://misc.flogisoft.com/bash/tip_colors_and_formatting
COLOR="34"
EFFECT="5" # => 0
STOP="\e[0m"

if [ $ROWS -ge 30 ] && [ $COLS -ge 120 ]; then
  echo
  printf "\e[${EFFECT};${COLOR}m"
  figlet -w 100 -f ~/.dotfiles/zsh/fonts/3d.flf $(perl -ne 'print ucfirst' <<<$(whoami))
  printf "${stop}"
  echo
  neofetch
fi
