FROM node:20 as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
