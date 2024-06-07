# Use an official Node runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 8080

# Command to run the dev server
CMD [ "npx", "webpack", "serve", "--mode", "development", "--host", "0.0.0.0" ]
