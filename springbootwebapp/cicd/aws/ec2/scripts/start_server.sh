#! /bin/bash

SERVICE_HOST=localhost
SERVICE_PORT=8080
STARTUP_WAIT_TIME=10
APPLICATION_JAR_PATH=/springbootwebapp/springbootwebapp-0.0.1-SNAPSHOT.jar
LOG_FILE_PATH=/springbootwebapp/general.log
APPLICATION_MAIN_CLASS_NAME=one.aegon.springbootwebapp.App

echo "Starting application..."

nohup java -jar $APPLICATION_JAR_PATH $APPLICATION_MAIN_CLASS_NAME > $LOG_FILE_PATH 2>&1 &
sleep $STARTUP_WAIT_TIME
nc -z $SERVICE_HOST $SERVICE_PORT

if [ ! $? -eq 0 ]; then
  echo "Could not start application"
  exit 1
fi

echo "Application started OK"
