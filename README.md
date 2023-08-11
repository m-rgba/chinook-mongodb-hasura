# Chinook / Hasura / MongoDB Demo

Start containers with:
```
docker compose up -d
```

When conatiners up and healthy, load Hasura metadata with:

- with metdata for logical models:
```
docker exec mongo_hasura bash -c "chmod +x /hasura/load_metadata.sh && /hasura/load_metadata.sh logical"
```

- with metdata for logical validation schema:
```
docker exec mongo_hasura bash -c "chmod +x /hasura/load_metadata.sh && /hasura/load_metadata.sh validation"
```