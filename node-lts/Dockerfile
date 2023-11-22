FROM node:lts as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
