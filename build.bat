@echo off
SETLOCAL

REM Define variables
SET APP_JAR=build\libs\demo-0.0.1-SNAPSHOT.jar
SET IMAGE_NAME=demo:latest

REM Build the Spring Boot JAR file with Gradle
echo Building the Spring Boot JAR with Gradle...
REM gradlew clean bootJar

REM Check if the JAR file exists
IF NOT EXIST %APP_JAR% (
    echo JAR file not found. Exiting...
    exit /b 1
)

REM Build the Podman image
echo Building the Podman image...
podman build -t %IMAGE_NAME% .

REM Run the Podman container
echo Running the Podman container...
podman run -p 8080:8080 %IMAGE_NAME%

REM End of script
ENDLOCAL
pause
