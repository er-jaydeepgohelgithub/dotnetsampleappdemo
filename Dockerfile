# Use the official .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# Set the working directory
WORKDIR /app

# Copy the .csproj and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Use a smaller runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine3.18-amd64
WORKDIR /app

# Create a non-root user
RUN addgroup -g 1000 dotnetuser && adduser -D -u 1000 -G dotnetuser dotnetuser

# Set ownership of the app directory to the non-root user
RUN chown -R dotnetuser:dotnetuser /app

# Change to the non-root user
USER dotnetuser

# Copy the published application to the smaller runtime image
COPY --from=build-env /app/out .

# Set the entry point
ENTRYPOINT ["dotnet", "DotNetDockerAppSample.dll"]
