# 1-bosqich: Build
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# 2-bosqich: Run
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY --from=build /app/target/crm.war crm.war

EXPOSE 8081

ENTRYPOINT ["java","-Xms256m","-Xmx512m","-jar","crm.war"]
