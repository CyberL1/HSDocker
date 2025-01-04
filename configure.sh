#!/bin/bash

mkdir tmp
cd tmp

echo Downloading server source
wget https://github.com/Swofty-Developments/HypixelSkyBlock/archive/refs/heads/master.zip

echo Unpacking server configuration
unzip -o master.zip HypixelSkyBlock-master/configuration/*

echo Removing old server configuration directories
rm -rf ../servers/game/configuration/collections
rm -rf ../servers/game/configuration/items

echo Moving server configuration
mv HypixelSkyBlock-master/configuration/collections ../servers/game/configuration
mv HypixelSkyBlock-master/configuration/items ../servers/game/configuration

cd ..

# Rename collections to lowercase
echo Renaming collections to lowercase

for i in $(ls servers/game/configuration/collections); do
  mv -i servers/game/configuration/collections/$i `echo servers/game/configuration/collections/$i | tr 'A-Z' 'a-z'`;
done

echo Importing regions into the database

docker compose up mongo -d
docker compose cp tmp/HypixelSkyBlock-master/configuration/Minestom.regions.csv mongo:tmp/Minestom.regions.csv

docker compose exec mongo mongoimport \
  --uri mongodb://mongo:mongo@localhost/Minestom?authSource=admin \
  --collection regions \
  --type csv \
  --headerline \
  --file tmp/Minestom.regions.csv \
  --ignoreBlanks \
  --drop

docker compose stop mongo

echo Cleaning up
rm -rf tmp
