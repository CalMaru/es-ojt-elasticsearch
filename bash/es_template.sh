#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

LOG_PATH=../logs/template
TEMPLATE_PATH=../data/template

if [ -d "$LOG_PATH" ]; then
    rm -rf "$LOG_PATH"
fi

mkdir "$LOG_PATH"

curl -X PUT -u elastic:$ES_PASSWORD "$ES_URL/_scripts/get_all_items" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/get_all_items.json -o $LOG_PATH/get_all_items.log
echo ""
curl -X PUT -u elastic:$ES_PASSWORD "$ES_URL/_scripts/autocomplete" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/autocomplete.json -o $LOG_PATH/autocomplete.log
echo ""
curl -X PUT -u elastic:$ES_PASSWORD "$ES_URL/_scripts/search_news" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/search_news.json -o $LOG_PATH/search_news.log
echo ""
