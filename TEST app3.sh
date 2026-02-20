#!/bin/bash


FILENAME="test.txt"

FILEPATH="C:\Users\ПК\Desktop\Новая папка (2)"

TOKEN='y0__xDv7anKAxiAhD4gpv3lvRZ65N72FHD6sHbKj8xhjTZpy7VgZw'

echo "Начинаю отправку файла: $FILENAME"


echo "Запрашиваю ссылку для загрузки..."
RESPONSE=$(curl -s -H "Authorization: OAuth $TOKEN" "https://cloud-api.yandex.net/v1/disk/resources/upload")


UPLOAD_URL=$(echo $RESPONSE | grep -o '"href":"[^"]*' | grep -o 'http[^"]*')


echo "Отправляю файл..."
curl -T "$FILEPATH" "$UPLOAD_URL"

echo ""
echo "Готово! Файл отправлен."
