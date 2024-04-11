# Step 1: Build the React app
FROM node:14-alpine as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .


# Step 2: Serve the React app using Nginx
FROM nginx:alpine

# Copy the build output from the previous stage to Nginx's default public directory
COPY ./index.html /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# CMD instruction to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]



                                                                                                                               1,1           Top
