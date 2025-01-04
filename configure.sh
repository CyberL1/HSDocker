#!/bin/bash

mkdir tmp
cd tmp

wget https://github.com/Swofty-Developments/HypixelSkyBlock/archive/refs/heads/master.zip
unzip -o master.zip HypixelSkyBlock-master/configuration/*

rm -rf ../servers/game/configuration/collections
rm -rf ../servers/game/configuration/items

mv HypixelSkyBlock-master/configuration/collections ../servers/game/configuration
mv HypixelSkyBlock-master/configuration/items ../servers/game/configuration

cd ..

# Rename collections to lowercase
for i in $(ls servers/game/configuration/collections); do
  mv -i servers/game/configuration/collections/$i `echo servers/game/configuration/collections/$i | tr 'A-Z' 'a-z'`;
done

rm -rf tmp
