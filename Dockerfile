# Use the Google Cloud SDK slim image as the base
FROM google/cloud-sdk:slim

# Specify the Node.js version as an argument
ARG NODE_MAJOR

# Update the package manager
RUN apt-get update

# Install necessary dependencies
RUN apt-get install -y ca-certificates curl gnupg jq

# Copy the script to determine the Node.js version and make it executable
COPY node_version.sh .
RUN chmod +x node_version.sh

# Run the script to determine the Node.js version and store the result in a file
RUN . ./node_version.sh > /tmp/result.txt

# Display the determined Node.js version
RUN echo "Node version: " $(cat /tmp/result.txt)

# Configure the source of the specific Node.js version
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$(cat /tmp/result.txt).x nodistro main" \
    | tee /etc/apt/sources.list.d/nodesource.list

# Update the package manager and install the specific Node.js version
RUN apt-get update
RUN apt-get install nodejs -y