#!/bin/bash

cd spring-petclinic-angular
npm install karma
ng test --karma-config karma.conf.js --browsers=ChromeHeadless

cd ..
cd spring-petclinic-rest-api
mvn test
cd ..


