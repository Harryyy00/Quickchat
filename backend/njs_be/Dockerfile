# Use Node.js 18 as the base image
FROM node:18 AS build

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application (if using TypeScript)
# RUN npm run build

# Create a second stage for the runtime
FROM node:18

WORKDIR /usr/src/app

# Copy only the necessary files from the build stage
COPY --from=build /usr/src/app .

# Expose port 3000
EXPOSE 3000

# Start the Node.js application
CMD ["npm", "start"]
