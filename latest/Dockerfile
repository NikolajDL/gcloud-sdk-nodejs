FROM node:latest as node

FROM google/cloud-sdk:latest
COPY --from=node . .
