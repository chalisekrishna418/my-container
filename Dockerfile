FROM ubuntu:latest

RUN apt update -y && apt upgrade -y
RUN apt install unzip vim curl less wget -y
RUN apt update -y && apt install -y git

RUN wget https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip \
    && unzip terraform_1.4.4_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -f terraform_1.4.4_linux_amd64.zip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN mkdir /root/.aws/ /root/.ssh/

WORKDIR /root/

# ENTRYPOINT sleep infinity
