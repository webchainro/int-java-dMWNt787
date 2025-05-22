FROM openjdk:17-slim
VOLUME /tmp
COPY target/weather-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]