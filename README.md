# fron-10-dash
runtime-configurable static web-app

[![image size](https://img.shields.io/badge/image%20size-48MB-blue.svg)](https://cloud.docker.com/u/maslick/repository/docker/maslick/fron10dash)

## Docker multistage build
[Here](docker/Dockerfile) I'm using ``node:8`` image as build image and ``nginx`` as runtime image. This reduces image size from ~500Mb to 100Mb.

Build yourself:
```zsh
docker build -t fron10dash:1.0 -f docker/Dockerfile .
docker image prune --filter label=stage=intermediate -f
docker run -d \
   -e URL=maslick.io \
   -e USER=test \
   -e KEY=54321 \
   -p 8080:80 \
   fron10dash:1.0
open http://`docker-machine ip`:8080
```

Download from Dockerhub: 
```zsh
docker run -d \
   -e URL=maslick.ru \
   -e USER=test \
   -e KEY=12345 \
   -p 8081:80 \
   maslick/fron10dash
open http://`docker-machine ip`:8081
```

## s2i
```
s2i build https://github.com/maslick/fron-10-dash.git registry.access.redhat.com/rhscl/nodejs-8-rhel7 frontendash:1.0
docker run -d \
   -e URL=maslick.io \ 
   -e PORT=8080 \
   -e USER=test \
   -e KEY=54321 \
   -p 8080:8080 \ 
   frontendash:1.0
open http://`docker-machine ip`:8080
```

## Openshift
```
oc new-project test
oc new-app registry.access.redhat.com/rhscl/nodejs-8-rhel7~https://github.com/maslick/fron-10-dash.git
oc expose svc/fron-10-dash
oc set env dc/fron-10-dash \
   PORT=8080 \
   USER=test \
   KEY=54321 \
   URL=www.maslick.ru
```

```
oc set env dc/fron-10-dash URL=google.com
```

## Heroku
```
heroku create fron-10-dash
git push heroku master
heroku config:set USER=test KEY=54321 URL=www.maslick.ru
heroku open
```
