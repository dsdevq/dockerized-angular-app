# Use a lightweight Node.js image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for dependency installation
COPY package*.json ./

# Install dependencies (including Angular CLI)
RUN npm install -g @angular/cli
RUN npm install

# Copy the rest of the application code (this is to reduce rebuild time when only code changes)
COPY . .

# Expose the default Angular port
EXPOSE 4200