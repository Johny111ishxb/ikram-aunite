# Build stage
     FROM maven:3-openjdk-17 AS build
     WORKDIR /app
     COPY . .
     RUN mvn clean package -DskipTests
     # Debug: List contents of target directory
     RUN ls -la /app/target/

     # Package stage
     FROM openjdk:17-jdk-slim
     WORKDIR /app
     COPY --from=build /app/target/maintenance.prediction-0.0.1-SNAPSHOT.jar app.jar
     EXPOSE 8080
     ENTRYPOINT ["java", "-jar", "app.jar"]
