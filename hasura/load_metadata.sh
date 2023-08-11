#!/bin/bash

apt-get update
apt-get install -y curl

METADATA_TYPE=$1
METADATA_FILE=""

case $METADATA_TYPE in
    logical)
        METADATA_FILE="/hasura/3-metadata-logical-models.json"
        ;;
    validation)
        METADATA_FILE="/hasura/2-metadata-validation.json"
        ;;
    *)
        echo "Invalid argument. Please use 'logical' or 'validation'"
        exit 1
        ;;
esac

HASURA_ENDPOINT="http://localhost:8080/v1/metadata"
METADATA_CONTENT=$(cat $METADATA_FILE)

JSON_PAYLOAD=$(cat <<EOF
{
    "type" : "replace_metadata",
    "version": 2,
    "args": $METADATA_CONTENT
}
EOF
)

curl -X POST $HASURA_ENDPOINT \
     -H "Content-Type: application/json" \
     -H "x-hasura-role: admin" \
     -H "x-hasura-admin-secret: myadminsecretkey" \
     -d "$JSON_PAYLOAD"