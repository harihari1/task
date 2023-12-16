# Use an official Node runtime as a parent image
FROM node:alpine

# Set the working directory in the container
WORKDIR /root/React-Todo-list/

# Copy package.json and package-lock.json to the working directory
COPY /React-Todo-list/ /root/React-Todo-list/

# Install the application dependencies
RUN npm install

# Build the React app
RUN npm run build

# Expose the port on which the app will run (adjust if necessary)
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]
