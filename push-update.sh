#!/bin/bash
cd ~/Sites/compassroseband/compassrose
perl -i.bak -lpe 'BEGIN { sub inc { my ($num) = @_; ++$num } } s/(build = )(\d+)/$1 . (inc($2))/eg' config.toml
docker image build -t compassrose .
docker login
docker tag compassrose summittdweller/compassrose:latest
docker push summittdweller/compassrose:latest
