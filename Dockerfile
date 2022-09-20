# Pull from base image
FROM node:16.17.0-alpine

# Use app as the working directory
WORKDIR /app

# Copy the files from the current directory to app
COPY . /app

# Install python
RUN apk --no-cache add --virtual .builds-deps build-base python3

# Install dependencies
RUN yarn install

# Build app
RUN yarn build

# Listen on port
EXPOSE 3000

# Set node server
ENTRYPOINT yarn start
