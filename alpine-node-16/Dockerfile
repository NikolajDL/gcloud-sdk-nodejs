FROM node:16-alpine as node

FROM google/cloud-sdk:latest
COPY --from=node . .
