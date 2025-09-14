#  OpenJDK 21
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/apple-academy-api-0.0.1-SNAPSHOT.jar /app/apple-academy-api.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/apple-academy-api.jar"]
