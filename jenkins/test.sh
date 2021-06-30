#!/bin/bash

sudo apt update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install
npm install -g @angular/cli

cd spring-petclinic-angular
npm install karma
ng test

cd ..
cd spring-petclinic-rest-api
mvn test
cd ..


