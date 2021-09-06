# Stage 1

FROM node:14.17-alpine3.11 as build-step

RUN mkdir -p /usr/src/app

RUN ls

WORKDIR /usr/src/app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

# Stage 2

FROM nginx:1.21.1-alpine

COPY --from=build-step /usr/src/app /usr/share/nginx/html