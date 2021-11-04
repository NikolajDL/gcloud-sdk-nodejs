FROM node:16-alpine as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
