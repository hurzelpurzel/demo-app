# Spring Boot Demo App

A demo Spring Boot application with:
- MVC (Thymeleaf templates)
- REST API
- Spring Boot Actuator
- Dockerfile based on Red Hat UBI 10
- GitHub Actions workflow for build and test

## Endpoints
- `GET /` - MVC home page
- `GET /api/greeting?name=YourName` - REST API endpoint
- `GET /actuator` - Actuator endpoints (health, info, metrics)

## Build locally
```bash
mvn clean package
java -jar target/demoapp-0.0.1-SNAPSHOT.jar
```

## Build Docker image
```bash
docker build -t demoapp:latest .
docker run -p 8080:8080 demoapp:latest
```
