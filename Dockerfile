FROM openjdk:8-jdk-alpine
ARG JAR_FILE=./target/*.jar
WORKDIR /usr/src/app
COPY ${JAR_FILE} ./app.jar
ENTRYPOINT ["java","-jar","./app.jar"]
