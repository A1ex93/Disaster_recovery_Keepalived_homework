#!/bin/bash

INDEX_FILE="/var/www/html/index.html"
URL="http://localhost"

# Проверяем доступность веб-сервера через curl
curl -sf "$URL" > /dev/null
port_result=$?

# Проверяем наличие файла index.html
if [ -f "$INDEX_FILE" ]; then
    file_result=0
else
    file_result=1
fi

# Если порт недоступен или файл отсутствует — возвращаем ошибку
if [ $port_result -ne 0 ] || [ $file_result -ne 0 ]; then
    exit 1
else
    exit 0
fi
