#!/bin/bash

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Fastfetch Kwéebecs Customization   ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""

# Проверка, установлен ли fastfetch
if ! command -v fastfetch &> /dev/null; then
    echo -e "${YELLOW}⚠️  Fastfetch не установлен!${NC}"
    echo ""
    echo -e "${GREEN}Установите его одной из команд:${NC}"
    echo -e "  ${YELLOW}Arch Linux:${NC}      sudo pacman -S fastfetch"
    echo -e "  ${YELLOW}Ubuntu/Debian:${NC}    sudo apt install fastfetch"
    echo -e "  ${YELLOW}Fedora:${NC}           sudo dnf install fastfetch"
    echo -e "  ${YELLOW}openSUSE:${NC}         sudo zypper install fastfetch"
    echo -e "  ${YELLOW}macOS:${NC}            brew install fastfetch"
    echo ""
    read -p "Продолжить установку конфига? (y/n): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}❌ Установка отменена${NC}"
        exit 1
    fi
fi

# Создаём директорию для fastfetch
echo -e "${GREEN}📁 Создание директории ~/.config/fastfetch...${NC}"
mkdir -p ~/.config/fastfetch

# Копируем файлы
echo -e "${GREEN}📋 Копирование конфигурации и логотипа...${NC}"
cp fastfetch/config.jsonc ~/.config/fastfetch/
cp fastfetch/logo.png ~/.config/fastfetch/

# Исправляем путь к логотипу в конфиге
echo -e "${GREEN}🛠️  Настройка путей...${NC}"
sed -i "s|\"source\": \"fastfetch/logo.png\"|\"source\": \"$HOME/.config/fastfetch/logo.png\"|" ~/.config/fastfetch/config.jsonc

# Проверка успешности установки
if [ -f ~/.config/fastfetch/config.jsonc ] && [ -f ~/.config/fastfetch/logo.png ]; then
    echo ""
    echo -e "${GREEN}✅ Установка успешно завершена!${NC}"
    echo ""
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo -e "${GREEN}🚀 Запустите:${NC} fastfetch"
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo ""
    
    # Предложение добавить в автозагрузку
    read -p "Добавить fastfetch в автозагрузку (~/.bashrc или ~/.zshrc)? (y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [ -f ~/.zshrc ]; then
            echo "fastfetch" >> ~/.zshrc
            echo -e "${GREEN}✅ Добавлено в ~/.zshrc${NC}"
        elif [ -f ~/.bashrc ]; then
            echo "fastfetch" >> ~/.bashrc
            echo -e "${GREEN}✅ Добавлено в ~/.bashrc${NC}"
        else
            echo -e "${YELLOW}⚠️  Файл ~/.bashrc или ~/.zshrc не найден${NC}"
        fi
    fi
    
    # Показываем пример вывода
    echo ""
    echo -e "${BLUE}📺 Пример вывода:${NC}"
    fastfetch 2>/dev/null || echo -e "${YELLOW}Запустите 'fastfetch' чтобы увидеть результат${NC}"
    
else
    echo ""
    echo -e "${RED}❌ Ошибка: не удалось скопировать файлы${NC}"
    exit 1
fi
