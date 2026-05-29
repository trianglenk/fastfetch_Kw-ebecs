#!/bin/bash

echo "Installing Kwéebecs fastfetch setup..."

sudo pacman -S --needed fastfetch chafa

mkdir -p ~/.config/fastfetch

cp fastfetch/config.jsonc ~/.config/fastfetch/
cp fastfetch/logo.png ~/.config/fastfetch/

echo ""
echo "Installation complete."
echo "Run: fastfetch"
