#!/bin/bash

echo "📡 Importing Chinook..."

mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Album --type csv --headerline --file /chinook/Album.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Artist --type csv --headerline --file /chinook/Artist.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Customer --type csv --headerline --file /chinook/Customer.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Employee --type csv --headerline --file /chinook/Employee.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Genre --type csv --headerline --file /chinook/Genre.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Invoice --type csv --headerline --file /chinook/Invoice.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection InvoiceLine --type csv --headerline --file /chinook/InvoiceLine.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection MediaType --type csv --headerline --file /chinook/MediaType.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Playlist --type csv --headerline --file /chinook/Playlist.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection PlaylistTrack --type csv --headerline --file /chinook/PlaylistTrack.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinook --collection Track --type csv --headerline --file /chinook/Track.csv

loadSchema() {
    local collection="$1"
    local schema_file="$2"
    echo "🔐 Applying validation for ${collection}..."
    mongosh --host localhost:27017 --username root --password password --authenticationDatabase=admin --eval "
        var schema = $(cat ${schema_file});
        db.createCollection('${collection}', { validator: schema });
    " chinookValidation
}

loadSchema "Album" "/chinook/Album.json"
loadSchema "Artist" "/chinook/Artist.json"
loadSchema "Customer" "/chinook/Customer.json"
loadSchema "Employee" "/chinook/Employee.json"
loadSchema "Genre" "/chinook/Genre.json"
loadSchema "Invoice" "/chinook/Invoice.json"
loadSchema "InvoiceLine" "/chinook/InvoiceLine.json"
loadSchema "MediaType" "/chinook/MediaType.json"
loadSchema "Playlist" "/chinook/Playlist.json"
loadSchema "PlaylistTrack" "/chinook/PlaylistTrack.json"
loadSchema "Track" "/chinook/Track.json"

mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Album --type csv --headerline --file /chinook/Album.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Artist --type csv --headerline --file /chinook/Artist.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Customer --type csv --headerline --file /chinook/Customer.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Employee --type csv --headerline --file /chinook/Employee.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Genre --type csv --headerline --file /chinook/Genre.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Invoice --type csv --headerline --file /chinook/Invoice.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection InvoiceLine --type csv --headerline --file /chinook/InvoiceLine.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection MediaType --type csv --headerline --file /chinook/MediaType.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Playlist --type csv --headerline --file /chinook/Playlist.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection PlaylistTrack --type csv --headerline --file /chinook/PlaylistTrack.csv
mongoimport --host localhost:27017 --username root --password password --authenticationDatabase=admin --db chinookValidation --collection Track --type csv --headerline --file /chinook/Track.csv

echo "✅ Sample Chinook data imported..."