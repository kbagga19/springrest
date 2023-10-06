FROM openjdk:17-alpine AS builder

COPY ../.mvn .mvn
COPY ../mvnw .
COPY ../pom.xml .
COPY ../src src
RUN chmod +x mvnw

RUN ./mvnw clean package

FROM openjdk:17-alpine

COPY --from=builder target/*.jar /app.jar

EXPOSE 9090

ENTRYPOINT ["java","-jar","/app.jar"]
