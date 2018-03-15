#!/bin/bash
git clone https://github.com/jellybob/sinatra-example.git .
gem install sinatra shotgun
if [ "$RACK_ENV" == "production" ]; 
then 
  bundle install --without development test
  ruby $MAIN_APP_FILE
else
  bundle install
  if [ "$RACK_ENV" == "test" ]; 
  then
    rspec
  else
    gem install shotgun
    shotgun -I /usr/src/app $MAIN_APP_FILE -p 4567 -o '0.0.0.0'
  fi
fi


