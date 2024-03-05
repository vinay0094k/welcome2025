#dockerfile welcome
FROM alpine:latest
RUN apk update && apk --no-cache add curl && apk --no-cache add openjdk11 && adduser welcome --disabled-password && mkdir -p /opt/app/ && chown -R welcome:welcome /opt/app/
COPY /target/welcome-1.0.0.jar /opt/app/welcome.jar
COPY application.properties /opt/app/application.properties
#ADD html /opt/app/html
USER welcome
WORKDIR /opt/app/
EXPOSE 8025
#ENTRYPOINT exec java -Dserver.port=8024 -Xlog:gc:gclog.log -Dspring.config.location=/opt/app/application.properties -jar welcome.jar 
ENTRYPOINT exec java -Dserver.port=8025 -Dspring.config.location=/opt/app/application.properties -jar welcome.jar
