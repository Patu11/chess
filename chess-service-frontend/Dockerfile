FROM node:18-alpine3.15 as build
WORKDIR /app
# Copy all files from current directory to working dir in image
COPY . .
ENV NODE_OPTIONS=--openssl-legacy-provider
# install node modules and build assets
RUN npm i && npm run build

FROM nginx as runtime
COPY --from=build /app/dist/chess-service-frontend /usr/share/nginx/html
