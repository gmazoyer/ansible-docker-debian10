FROM debian:stretch
MAINTAINER Guillaume Mazoyer

ENV DEBIAN_FRONTEND noninteractive

# Install requirements
RUN apt-get update
RUN apt-get install -y build-essential libffi-dev libssl-dev python-pip python-dev systemd
RUN apt-get clean

# Install Ansible
RUN pip install cryptography ansible

# Ansible inventory file
RUN mkdir -p /etc/ansible/roles \
    && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
