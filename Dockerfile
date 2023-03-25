FROM ubuntu:22.04 AS installer-env

RUN apt-get update

RUN apt-get -y install python3-pip \
    && pip install boto3