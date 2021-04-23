# Start with a base image containing Java runtime 
FROM openjdk:11.0.5-jre-slim
 
# Add Maintainer Info 
LABEL maintainer="waseemahammed96@gmail.com" 
 
# Add a volume pointing to /mnt/artefact
VOLUME /mnt/artefact 
 
# Make port 8080 available to the world outside this container 
EXPOSE 8080
 
# The application's jar file 
ARG JAR_FILE=$PWD/target/spring-petclinic-2.4.2.jar
 
# Add the application's jar to the container 
ADD ${JAR_FILE} spring-petclinic-service.jar
 
# Run the jar file 
ENTRYPOINT ["java","-Dserver.port=8080","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-petclinic-service.jar"]



