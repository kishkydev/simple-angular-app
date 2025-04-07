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