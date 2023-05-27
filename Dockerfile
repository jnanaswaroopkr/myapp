FROM maven:3.8.2-openjdk-8 as mavenbuilder
WORKDIR /var/lib/
COPY . .
RUN mvn clean package

FROM tomcat:jre8-temurin-focal
COPY --from=mavenbuilder /var/lib/target/myapp-1.0.war /usr/local/tomcat/webapps/
