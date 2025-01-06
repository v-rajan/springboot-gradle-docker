# Use Amazon Corretto as the base image
FROM amazoncorretto:21

# Set the working directory
WORKDIR /app

# Copy the application JAR file into the container
COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your application will run on
EXPOSE 8080

# Set the default command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
