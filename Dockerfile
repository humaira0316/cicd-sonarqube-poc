FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY target/docker-maven-poc-1.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
