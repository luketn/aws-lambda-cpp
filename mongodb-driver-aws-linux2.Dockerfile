FROM amazonlinux:2
RUN amazon-linux-extras install epel -y
RUN yum install -y mongo-c-driver libbson file
WORKDIR /usr/bin
