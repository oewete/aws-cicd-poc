#! /bin/bash

SERVICE_HOST=localhost
SERVICE_PORT=8080

nc -z $SERVICE_HOST $SERVICE_PORT

if [ ! $? -eq 0 ]; then
  echo "Service is not running, nothing to do"
  exit 0
fi

echo "Sending shutdown request to service..."
curl -v -X POST $SERVICE_HOST:$SERVICE_PORT/actuator/shutdown
curl_result=$?
echo -ne "\n"

if [ ! $curl_result -eq 0 ]; then
  echo "Could not stop service. This may mean that that we couldn't send the shutdown request, or that the shutdown URL is secured. You should check if the service is running and stop it manually"
  echo "Curl exit code: $curl_result"
  exit 1
fi

echo "Service stopped"
