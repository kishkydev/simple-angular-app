FROM node:18-alpine as build

WORKDIR /app

# Copy package files first for better caching
COPY package.json  ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the app
RUN npm run build 



# Expose port 80
EXPOSE 4200
ENV PORT 4200

# Start Nginx
CMD ["npm", "run", "start"]


# # Stage 1: Build the Angular app
# FROM node:18-alpine as build

# WORKDIR /app

# # Copy package files first for better caching
# COPY package.json package-lock.json ./

# # Install dependencies
# RUN npm install

# # Copy all files
# COPY . .

# # Build the app
# RUN npm run build -- --configuration=production

# # Stage 2: Serve the app with Nginx
# FROM nginx:1.25-alpine

# # Copy nginx config
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Copy built files from build stage
# COPY --from=build /app/dist/simple-angular-app/browser /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
