FROM node:18-alpine as build

WORKDIR /app

COPY package.json .
COPY yarn.lock .
COPY . .
RUN yarn --version && yarn && yarn install && yarn run build

FROM nginx:1.23-alpine
COPY --from=build /app/public /usr/share/nginx/html
COPY --from=build /app/out/*.js /usr/share/nginx/html/
COPY --from=build /app/out/build /usr/share/nginx/html/build
EXPOSE 80
