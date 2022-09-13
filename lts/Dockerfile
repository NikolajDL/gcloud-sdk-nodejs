FROM node:lts as node

FROM google/cloud-sdk:latest
COPY --from=node . .
