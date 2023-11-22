FROM node:18 as node

FROM google/cloud-sdk:alpine
COPY --from=node . .
