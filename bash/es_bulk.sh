#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

LOG_PATH=../logs/bulk
BULK_PATH=../data/bulk

if [ -d "$LOG_PATH" ]; then
    rm -rf "$LOG_PATH"
fi

mkdir "$LOG_PATH"

curl -X POST "$ES_URL/$CATEGORY/_bulk?pretty" -H "Content-Type: application/x-ndjson" --data-binary @$BULK_PATH/category.json -o $LOG_PATH/$CATEGORY.log
echo ""
curl -X POST "$ES_URL/$PROVIDER/_bulk?pretty" -H "Content-Type: application/x-ndjson" --data-binary @$BULK_PATH/provider.json -o $LOG_PATH/$PROVIDER.log
echo ""
curl -X POST "$ES_URL/$REPORTER/_bulk?pretty" -H "Content-Type: application/x-ndjson" --data-binary @$BULK_PATH/reporter.json -o $LOG_PATH/$REPORTER.log
echo ""
curl -X POST "$ES_URL/$KEYWORD/_bulk?pretty" -H "Content-Type: application/x-ndjson" --data-binary @$BULK_PATH/keyword.json -o $LOG_PATH/$KEYWORD.log
echo ""
curl -X POST "$ES_URL/$NEWS/_bulk?pretty" -H "Content-Type: application/x-ndjson" --data-binary @$BULK_PATH/news.json -o $LOG_PATH/$NEWS.log
echo ""
