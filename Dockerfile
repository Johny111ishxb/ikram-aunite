FROM openjdk:17-jdk-slim
   WORKDIR /app
   RUN apt-get update && apt-get install -y maven
   COPY . .
   RUN mvn clean package -DskipTests
   RUN ls -la /app/target/
   RUN mv /app/target/maintenance.prediction-0.0.1-SNAPSHOT.jar app.jar
   EXPOSE 8080
   ENTRYPOINT ["java", "-jar", "app.jar"]
