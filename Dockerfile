# Use an official Node runtime as a parent image
FROM node:alpine

# Set the working directory in the container
WORKDIR /root/React-Todo-list/

# Copy package.json and package-lock.json to the working directory
#COPY /root/React-Todo-list/public/
#COPY /root/React-Todo-list/src/
COPY /React-Todo-list/ /root/React-Todo-list/

# Install the application dependencies
RUN npm install
#RUN npm start

# Copy the local code to the container
#COPY React-Todo-list/ /root/

# Build the React app
RUN npm run build

# Expose the port on which the app will run (adjust if necessary)
EXPOSE 3000

# Set environment variables if needed
# ENV REACT_APP_API_URL=http://api.example.com

# Command to run your application
CMD ["npm", "start"]
