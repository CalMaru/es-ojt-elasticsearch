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

curl -X PUT "$ES_URL/_scripts/$GET_ALL_ITEMS" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/get_all_items.json -o $LOG_PATH/$GET_ALL_ITEMS.log
echo ""
curl -X PUT "$ES_URL/_scripts/$AUTOCOMPLETE" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/autocomplete.json -o $LOG_PATH/$AUTOCOMPLETE.log
echo ""
curl -X PUT "$ES_URL/_scripts/$SEARCH_NEWS" -H "Content-Type: application/json" -d @$TEMPLATE_PATH/search_news.json -o $LOG_PATH/$SEARCH_NEWS.log
echo ""
