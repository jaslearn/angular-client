FROM node:14.17-alpine3.11 as build
RUN mkdir -p /app
WORKDIR /app

RUN npm install -g @angular/cli

#COPY ./package.json .
COPY package.json /app
RUN npm install
#COPY . .
COPY . /app
RUN ng build --prod

FROM nginx as runtime
COPY --from=build /app/dist/angular-client /usr/share/nginx/html