#!/bin/sh
set -e

echo "Create folder struct"
mkdir -p /var/www/bitrix && \
cd /var/www/bitrix && \
rm -f /var/www/bitrix/bitrixsetup.php && \
wget https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php && \
cd /var/www/ && \
rm -rf /var/www/bitrixdock && \
git clone https://github.com/bitrixdock/bitrixdock.git && \
cd /var/ && chmod -R 775 www/ && chown -R root:www-data www/ && \
cd /var/www/bitrixdock

echo "Config"
cp -f .env_template .env

echo "Run"
docker compose -p bitrixdock up -d