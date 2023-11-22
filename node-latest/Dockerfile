FROM node:latest as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
