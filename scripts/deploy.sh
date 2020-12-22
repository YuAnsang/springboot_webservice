#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=asyu-boot-webservice

echo "> file copy"

cp $REPOSITORY/zip/*.jar $REPOSITORY/

echo "> confirm running application PID"

CURRENT_PID=(pgrep -fl asyu-boot-webservice | grep jar | awk '(print $1)')

echo "running application PID : $CURRENT_PID"

if [ -z "$CURRENT_PID"]; then
  echo "> not exists running application"
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> new application deploy"

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

echo "> jar name : $JAR_NAME"

chmod +X $JAR_NAME

nohup java -jar \
    -Dspring.config.location=classpath:/application.properties,classpath:/application-real.properties,/home/ec2-user/app/application-oauth.properties,/home/ec2-user/app/application-real-db.properties \
    -Dspring.profiles.active=real \
    $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &