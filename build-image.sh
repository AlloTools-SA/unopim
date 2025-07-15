#! /bin/sh

aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 285754824804.dkr.ecr.eu-west-3.amazonaws.com
docker build -t allotools/batitrade-unopim .
docker tag allotools/batitrade-unopim:latest 285754824804.dkr.ecr.eu-west-3.amazonaws.com/allotools/batitrade-unopim:latest
docker push 285754824804.dkr.ecr.eu-west-3.amazonaws.com/allotools/batitrade-unopim:latest
