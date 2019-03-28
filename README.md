# fron-10-dash
runtime-configurable static web-app


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
