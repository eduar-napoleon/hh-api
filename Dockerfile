# Base image
FROM node:14

# Create working directory
RUN mkdir -p /usr/src/app

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the project
RUN npm run build

# Copy .env file
COPY .env.example .

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
