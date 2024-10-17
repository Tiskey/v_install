#!/bin/bash

# Обновляем пакеты и устанавливаем зависимости
apt update && apt upgrade -y
apt install git unzip nano python3.11 python3-pip python3-venv curl -y

# Устанавливаем Poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Проверяем версию Poetry
poetry --version

# Устанавливаем Node.js и npm
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm use --install-if-missing 22

# Проверяем версию Node.js и npm
node -v && npm -v

# Устанавливаем Yarn
npm install -g yarn

# Клонируем репозиторий Vana
git clone https://github.com/vana-com/vana-dlp-chatgpt.git
cd vana-dlp-chatgpt

# Создаём .env файл
cp .env.example .env

# Устанавливаем зависимости
poetry install

# Устанавливаем CLI Vana
pip install vana --break-system-packages

# Генерация ключей
./keygen.sh

echo "Установка завершена! Не забудьте продолжить настройку вручную: создать кошелек, экспортировать ключи и настроить сеть."
