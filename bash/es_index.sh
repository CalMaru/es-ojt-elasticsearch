#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

LOG_PATH=../logs/index
INDEX_PATH=../data/index

if [ -d "$LOG_PATH" ]; then
    rm -rf "$LOG_PATH"
fi

mkdir "$LOG_PATH"

curl -X PUT "$ES_URL/$CATEGORY" -H "Content-Type: application/json" -d @$INDEX_PATH/category.json -o $LOG_PATH/$CATEGORY.log
echo ""
curl -X PUT "$ES_URL/$PROVIDER" -H "Content-Type: application/json" -d @$INDEX_PATH/provider.json -o $LOG_PATH/$PROVIDER.log
echo ""
curl -X PUT "$ES_URL/$REPORTER" -H "Content-Type: application/json" -d @$INDEX_PATH/reporter.json -o $LOG_PATH/$REPORTER.log
echo ""
curl -X PUT "$ES_URL/$KEYWORD" -H "Content-Type: application/json" -d @$INDEX_PATH/keyword.json -o $LOG_PATH/$KEYWORD.log
echo ""
curl -X PUT "$ES_URL/$NEWS" -H "Content-Type: application/json" -d @$INDEX_PATH/news.json -o $LOG_PATH/$NEWS.log
echo ""
