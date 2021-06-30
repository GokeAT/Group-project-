#!/bin/bash

cd spring-petclinic-angular
npm install karma
ng test

cd ..
cd spring-petclinic-rest-api
mvn test
cd ..


