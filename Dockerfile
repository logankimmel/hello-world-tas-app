FROM maven:3.9-eclipse-temurin-8 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src src
RUN mvn -q -Dmaven.test.skip=true package

FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /workspace/target/hello-world-tas-app-0.0.1-SNAPSHOT.jar app.jar
RUN useradd --create-home appuser && chown -R appuser:appuser /app
USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
