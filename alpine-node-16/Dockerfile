FROM node:16-alpine as node
WORKDIR /node

FROM google/cloud-sdk:alpine
WORKDIR /root/
COPY --from=node ./node .
