# Chinook / Hasura / MongoDB Demo

- Add enterprise key to `HASURA_GRAPHQL_EE_LICENSE_KEY`
- Start containers with:

```
docker compose up -d
```

When conatiners up and healthy, load Hasura metadata with:

- For metdata for logical models:
```
docker exec mongo_hasura bash -c "chmod +x /hasura/load_metadata.sh && /hasura/load_metadata.sh logical"
```

- For metdata for logical validation schema:
```
docker exec mongo_hasura bash -c "chmod +x /hasura/load_metadata.sh && /hasura/load_metadata.sh validation"
```
