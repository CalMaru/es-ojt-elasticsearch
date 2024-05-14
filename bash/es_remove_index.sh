#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

curl -X DELETE "$ES_URL/$CATEGORY"
echo ""
curl -X DELETE "$ES_URL/$PROVIDER"
echo ""
curl -X DELETE "$ES_URL/$REPORTER"
echo ""
curl -X DELETE "$ES_URL/$KEYWORD_PREPROCESSING"
echo ""
curl -X DELETE "$ES_URL/$KEYWORD"
echo ""
curl -X DELETE "$ES_URL/$NEWS"
echo ""
