# Build stage
FROM registry.access.redhat.com/ubi10/openjdk-21:latest AS builder
USER root
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM registry.access.redhat.com/ubi10/openjdk-21-runtime:latest
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
USER root
RUN chown -R 1001:0 /app && chmod -R g+rwX /app
USER 1001
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
