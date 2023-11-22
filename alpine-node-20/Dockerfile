FROM node:20-alpine as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
