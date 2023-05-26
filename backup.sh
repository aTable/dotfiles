#!/bin/sh

# loose files
cp -f ~/.zshrc ./.zshrc

mkdir -p ./alacritty 
cp -f ~/.config/alacritty/alacritty.yml ./alacritty/alacritty.yml

mkdir -p ./bspwm
cp -f ~/.config/bspwm/bspwmrc ./bspwm/bspwmrc
cp -f ~/.config/bspwm/external_rules ./bspwm/external_rules

mkdir -p ./nitrogen
cp -f ~/.config/nitrogen/nitrogen.cfg ./nitrogen/nitrogen.cfg

mkdir -p ./picom
cp -f ~/.config/picom/picom.conf ./picom/picom.conf

mkdir -p ./polybar 
cp -f ~/.config/polybar/config ./polybar/config
cp -f ~/.config/polybar/launch.sh ./polybar/launch.sh
cp -f ~/.config/polybar/git-status-checker.sh ./polybar/git-status-checker.sh

mkdir -p ./ranger
cp -f ~/.config/ranger/rc.conf ./ranger/rc.conf

mkdir -p ./rofi
cp -f ~/.config/rofi/config.rasi ./rofi/config.rasi
cp -f ~/.config/rofi/dracula.rasi ./rofi/dracula.rasi

mkdir -p ./sxhkd
cp -f ~/.config/sxhkd/sxhkdrc ./sxhkd/sxhkdrc

mkdir -p ./dunst
cp -f ~/.config/dunst/dunstrc ./dunst/dunstrc