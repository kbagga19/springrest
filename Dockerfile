FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY target/*.jar springrest_api_app.jar
ENTRYPOINT ["java","-jar","/springrest_api_app.jar"]
EXPOSE 5000
