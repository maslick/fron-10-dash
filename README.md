# fron-10-dash
runtime configurable frontend


## Openshift
```
$ oc new-project test
$ oc new-app registry.access.redhat.com/rhscl/nodejs-8-rhel7~https://github.com/maslick/fron-10-dash.git
$ oc expose svc/fron-10-dash
$ oc set env dc/fron-10-dash PORT=8080 URL=www.maslick.ru
```

```
$ oc set env dc/fron-10-dash URL=google.com
```
