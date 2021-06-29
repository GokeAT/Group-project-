FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM openjdk:8-jre-alpine AS runtime
EXPOSE 9966
WORKDIR /app
ARG JAR=spring-petclinic-rest-2.4.2.jar

COPY --from=BUILD /src/target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]