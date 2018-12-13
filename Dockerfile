FROM debian:stretch

LABEL version="1.0"
LABEL maintainer="Guillaume Mazoyer"
LABEL description="Debian 9 container for Ansible role testing"

ENV DEBIAN_FRONTEND noninteractive

# Install requirements
RUN apt-get update && \
    apt-get install -y build-essential libffi-dev libssl-dev python-pip python-dev sudo systemd \
    apt-get clean

# Install Ansible
RUN pip install cryptography ansible

# Ansible inventory file
RUN mkdir -p /etc/ansible/roles \
    && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
