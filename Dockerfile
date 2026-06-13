# Stage 1 - Build WAR
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package

# Stage 2 - Deploy to Tomcat
FROM tomcat:10

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
