# Step 1: Build stage (Maven)
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

COPY . .
RUN mvn clean package -DskipTests

# Step 2: Runtime stage (Tomcat)
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat

RUN rm -rf webapps/*
COPY --from=build /app/target/*.war webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
