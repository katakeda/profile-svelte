FROM node:16-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN yarn install && yarn build

FROM pierrezemb/gostatic
COPY --from=builder /usr/src/app/dist/ /srv/http/
