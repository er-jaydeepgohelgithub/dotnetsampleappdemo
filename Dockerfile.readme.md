# DotNetDockerAppSample

This repository contains a sample .NET application Dockerized for easy deployment. The dockerfile is configured to use the official .NET SDK image for building and a smaller runtime image for the final deployment.

## Build Instructions

1. **Clone this repository:**
    
    `git clone`
    
2. **Navigate to the project directory:**
    
    `cd dotnetsampleappdemo`
    
3. **Build the Docker image:**
    
    `docker build -t dotnet-docker-app .`
    

## Run Instructions

Run the Docker container:

	`docker run -p 8080:5000 dotnet-docker-app`

The application will be accessible at http://localhost:8080.

## Dockerfile Overview

### Build Stage

- Uses the official .NET SDK image as the base.
- Sets the working directory to `/app`.
- Copies the `.csproj` files and restores dependencies.
- Copies the rest of the application code.
- Builds the application and publishes it.

### Runtime Stage

- Switches to a smaller runtime image for deployment (Alpine-based).
- Creates a non-root user (`dotnetuser`).
- Sets ownership of the app directory to the non-root user.
- Changes to the non-root user.
- Copies the published application from the build stage.
- Sets the entry point for the Docker container.
