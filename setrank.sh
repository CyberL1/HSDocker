#!/bin/bash

player=$1
rank=${2:-DEFAULT}

if ! test $player; then
  echo Provide username
  exit 1
fi

docker compose up mongo -d
sleep 1 # Wait for mongod service

old_rank=$(docker compose exec mongo mongosh Minestom \
  --username mongo \
  --password mongo \
  --authenticationDatabase admin \
  --eval "db.data.findOne({ ign: '\"$player\"' }, { 'rank': 1 }).rank.replaceAll('\"', '') || quit(1)")

if ! test $? -eq 0; then
  echo Player $player not found
  exit 1
fi

docker compose exec mongo mongosh Minestom \
  --username mongo \
  --password mongo \
  --authenticationDatabase admin \
  --eval "db.data.findOneAndUpdate({ ign: '\"$player\"' }, { \$set: { 'rank': '\"$rank\"' } }) && quit(0) || quit(1)"

if test $? -eq 0; then
  echo "[$old_rank] $player is now [$rank] $player"
fi

docker compose stop mongo &> /dev/null
