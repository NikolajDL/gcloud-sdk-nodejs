FROM node:alpine as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
