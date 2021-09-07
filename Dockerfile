# Stage 1

FROM node:14.17-alpine3.11 as build-step

RUN mkdir -p /usr/src/app

RUN ls

WORKDIR /usr/src/app

COPY package.json /app

RUN npm install

COPY . /usr/src/app

RUN npm run build --prod

# Stage 2

FROM nginx:1.21.1-alpine

COPY --from=build-step /usr/src/app/dist/angular-client /usr/share/nginx/html