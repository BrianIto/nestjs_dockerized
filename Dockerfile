# Use a Bun base image
FROM oven/bun:latest

# Set the working directory
WORKDIR /app

# Install procps to get the ps command
RUN apt-get update && apt-get install -y procps

# Copy the package.json and bun.lockb to the container
COPY package.json bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the NestJS application using Bun
CMD ["bun", "start:dev"]
