# build Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
FROM eclipse-temurin:21-jre-jammy

# Cria um usuário não-root para rodar a aplicação
RUN useradd -m appuser

WORKDIR /home/appuser

COPY --from=build /app/target/*.jar app.jar

USER appuser

EXPOSE 8080

# Comando para executar a aplicação
CMD ["java", "-jar", "app.jar"]
