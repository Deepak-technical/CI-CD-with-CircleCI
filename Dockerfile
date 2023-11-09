# Use an official Node runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the current directory contents into the container at /app
COPY . .

# Build the app
RUN npm run build

# Set environment variables
ENV NODE_ENV production
ENV PORT 80

# Expose port 80 to the outside world
EXPOSE 80

# Define the command to run your app
CMD ["npm", "start"]
