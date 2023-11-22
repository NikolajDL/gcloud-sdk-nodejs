#!/bin/bash

# Set the default Node.js version to the specified NODE_MAJOR or use LTS/Latest based on the condition
NODE_VERSION=${NODE_MAJOR}

if [ "${NODE_MAJOR}" = "lts" ]; then
    NODE_VERSION=$(
        curl -sL https://nodejs.org/dist/index.json \
        | jq -r '.[] | select(.lts) | .version' \
        | head -n 1 \
        | cut -d '.' -f 1 \
        | sed 's/^v//'
    )
elif [ "${NODE_MAJOR}" = "latest" ]; then
    NODE_VERSION=$(
        curl -sL https://nodejs.org/dist/index.json \
        | jq -r '.[0].version' \
        | head -n 1 \
        | cut -d '.' -f 1 \
        | sed 's/^v//'
    )
fi

# Print the determined Node.js version
echo $NODE_VERSION