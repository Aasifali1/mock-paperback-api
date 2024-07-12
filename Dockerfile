# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg

# Install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install json-server globally
RUN npm install -g json-server

# Create a working directory
WORKDIR /app

# Copy the db.json file to the container
COPY db.json /app/db.json

# Expose the port json-server will run on
EXPOSE 3000

# Run json-server
CMD ["npx", "json-server", "db.json"]
