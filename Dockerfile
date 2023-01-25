# Base image
FROM node

# Create working directory
RUN mkdir -p /usr/src/app

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the project
RUN npm run build


# Copy .env file
ENV HOST="0.0.0.0"
ENV PORT="3000"
ENV DATABASE_URL="mysql://root:750cadf078090855@srv-captain--wa-api-db/baileys_api"
ENV RECONNECT_INTERVAL="5000"
ENV MAX_RECONNECT_RETRIES="5"
ENV SSE_MAX_QR_GENERATION="10"
ENV LOG_LEVEL="warn"

# Run migration
RUN npx prisma migrate dev

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]