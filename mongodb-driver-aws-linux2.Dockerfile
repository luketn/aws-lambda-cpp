FROM amazonlinux:2
RUN amazon-linux-extras install epel -y
RUN yum install -y mongo-c-driver libbson tar
WORKDIR /opt/mongocpp
RUN curl -OL https://github.com/mongodb/mongo-cxx-driver/releases/download/r3.6.5/mongo-cxx-driver-r3.6.5.tar.gz

