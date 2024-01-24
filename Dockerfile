FROM node:latest as build-stage
WORKDIR /app
COPY www/ ./www/ # Assuming your front-end code is in the "front-end" directory
WORKDIR /app/www
RUN npm install
RUN npm run build

# Stage 2: Set up the Node.js server
FROM node:latest
WORKDIR /app
COPY --from=build-stage /app/www/build ./public
COPY server.js ./
RUN npm install express # or any other dependencies your server.js needs
EXPOSE 5000 # Or the port your server.js listens on
CMD ["node", "server.js"]                                                                                                                                
