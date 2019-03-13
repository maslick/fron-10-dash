# fron-10-dash
runtime configurable frontend


## Openshift
```
$ oc new-project test
$ oc new-app registry.access.redhat.com/rhscl/nodejs-8-rhel7~https://github.com/maslick/fron-10-dash.git --name frontendash
$ oc expose svc/frontendash
$ oc set env dc/frontendash PORT=8080 URL=www.maslick.ru
```
