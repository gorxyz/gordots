#!/bin/sh
mkdir -p ~/.config/{bspwm,sxhkd,nvim,qtile,polybar}
mv ~/.bashrc ~/.bashrc.bac
mv bash/.bashrc ~/
mv bspwm-sxhkd/bspwmrc ~/.config/bspwm/
mv bspwm-sxhkd/sxhkdrc ~/.config/sxhdk/
mv nvim/* ~/.config/nvim/
mv polybar/config.ini ~/.config/polybar/
mv qtile/config.py ~/.config/qtile/
