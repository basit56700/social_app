# Use an official Node.js runtime as a parent image
FROM node:14.17.0-alpine3.13

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npm install -g expo-cli

# Copy the rest of the application files to the container
COPY . .

# Create and add the env.js file to the container
RUN echo 'const vars = { \
        apiUrl: "https://socialapp-serverr.herokuapp.com", \
        defaultImageUri: "https://socialapp-serverr.herokuapp.com/static/images/defaultprofile.jpg" \
    }; \
    export default vars;' > env.js

# Expose the port that the application listens on
EXPOSE 19000

# Start the application
CMD ["npm", "start"]
