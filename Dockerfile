FROM node:14.17-alpine3.11 as build
WORKDIR /app

RUN npm install -g @angular/cli

#COPY angular-client/package.json .
RUN npm install
COPY . .
RUN ng build

FROM nginx as runtime
COPY --from=build /app/dist/angular-client /usr/share/nginx/html