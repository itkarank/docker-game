# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Clone the 2048 repository from GitHub
RUN git clone https://github.com/gabrielecirulli/2048.git .

# Install dependencies
RUN npm install

# Expose the port on which the app will run
EXPOSE 8080

# Start the 2048 game
CMD ["npm", "start"]
