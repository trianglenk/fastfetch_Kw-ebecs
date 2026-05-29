#!/bin/bash

echo "Installing rice setup..."

# Создаём директорию для fastfetch
mkdir -p ~/.config/fastfetch

# Копируем файлы
cp fastfetch/config.jsonc ~/.config/fastfetch/
cp fastfetch/logo.png ~/.config/fastfetch/

# Исправляем путь к логотипу в конфиге
sed -i 's|"source": ".*"|"source": "'"$HOME"'/.config/fastfetch/logo.png"|' ~/.config/fastfetch/config.jsonc

echo "Done!"
echo "Run: fastfetch"

# Проверяем, установлен ли fastfetch
if ! command -v fastfetch &> /dev/null; then
    echo ""
    echo "⚠️  fastfetch not found! Install it:"
    echo "  • Arch: sudo pacman -S fastfetch"
    echo "  • Ubuntu/Debian: sudo apt install fastfetch"
    echo "  • Fedora: sudo dnf install fastfetch"
