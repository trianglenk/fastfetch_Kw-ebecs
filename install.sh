#!/bin/bash

echo "Installing rice setup..."

# Создаём директорию для fastfetch
mkdir -p ~/.config/fastfetch

# Копируем файлы
cp fastfetch/config.jsonc ~/.config/fastfetch/
cp fastfetch/logo.png ~/.config/fastfetch/

# Исправляем путь к логотипу в конфиге
sed -i "s|\"source\": \"fastfetch/logo.png\"|\"source\": \"$HOME/.config/fastfetch/logo.png\"|" ~/.config/fastfetch/config.jsonc

echo "Done!"
echo "Run: fastfetch"
