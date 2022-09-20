# Pull from base image
FROM node:18-alpine

# Use app as the working directory
WORKDIR /app

# Copy the files from the current directory to app
COPY . /app

# Install dependencies
RUN yarn install

# Build app
RUN yarn build

# Listen on port
EXPOSE 3000

# Set node server
ENTRYPOINT yarn start
