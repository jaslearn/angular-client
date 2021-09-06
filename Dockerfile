# Stage 1

FROM node:14.17-alpine3.11 as build-step

RUN mkdir -p /app

RUN ls

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

# Stage 2

FROM nginx:1.21.1-alpine

COPY --from=build-step /app /usr/share/nginx/html