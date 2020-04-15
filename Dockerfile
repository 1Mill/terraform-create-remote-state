FROM ubuntu:18.04

# Install appropriate libraries
RUN apt-get update && apt-get install --yes unzip wget

# Install terraform
ARG TERRAFORM_VERSION
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_386.zip
RUN mv terraform /usr/local/bin/
RUN rm terraform_${TERRAFORM_VERSION}_linux_386.zip

# Copy terraform files over to Docker container
WORKDIR /app
COPY store/*.tf ./

# Placeholder
CMD [ "terraform", "--version" ]
