FROM maven:3.9.0-eclipse-temurin-17-alpine AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#

FROM openjdk: 19
COPY --from=build /target/springrest_api_app.jar springrest_api_app.jar
# ENV PORT=8080
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "springrest_api_app.jar"]
