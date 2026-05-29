#!/bin/bash

echo "Installing fastfetch Kwéebecs customization..."

# Создаём директорию
mkdir -p ~/.config/fastfetch

# Копируем файлы из репозитория
cp fastfetch/config.jsonc ~/.config/fastfetch/
cp .config/fastfetch/logo.png ~/.config/fastfetch/

# Исправляем путь к логотипу в конфиге
sed -i "s|\"source\": \".*\"|\"source\": \"$HOME/.config/fastfetch/logo.png\"|" ~/.config/fastfetch/config.jsonc

echo "Done!"
echo "Run: fastfetch"
