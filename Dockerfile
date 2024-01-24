FROM node:latest as build-stage
WORKDIR /app
COPY www/ ./www/ 
WORKDIR /app/www
RUN npm install
RUN npm run build

# Stage 2: Set up the Node.js server
FROM node:latest
WORKDIR /app
COPY --from=build-stage /app/www/build ./public
COPY server.js ./
RUN npm install express
EXPOSE 5000 
CMD ["node", "server.js"]                                                                                                                                
