# Stage 1: Build the React front-end
FROM node:latest as build-stage
WORKDIR /app
COPY www/package*.json ./www/
WORKDIR /app/front-end
RUN npm install
COPY www/ ./
RUN npm run build

# Stage 2: Set up the Node.js server
FROM node:latest
WORKDIR /app
COPY --from=build-stage /app/www/build ./public
COPY server.js ./
RUN npm install express 
EXPOSE 5000
CMD ["node", "server.js"]
