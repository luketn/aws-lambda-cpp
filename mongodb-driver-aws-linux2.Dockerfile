FROM amazonlinux:2
RUN amazon-linux-extras install epel -y
RUN echo "hello"
RUN yum install -y mongo-c-driver libbson
WORKDIR /usr/bin
