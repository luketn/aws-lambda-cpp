FROM amazonlinux:2
RUN amazon-linux-extras install epel -y
RUN yum install -y mongo-c-driver libbson tar clang cmake3 make gzip wget
WORKDIR /opt/mongocpp
RUN curl -OL https://github.com/mongodb/mongo-cxx-driver/releases/download/r3.6.5/mongo-cxx-driver-r3.6.5.tar.gz
RUN tar -xzf mongo-cxx-driver-r3.6.5.tar.gz
WORKDIR	mongo-cxx-driver-r3.6.5/build
RUN cmake3 ..                                \
        -DCMAKE_BUILD_TYPE=Release          \
        -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cmake3 --build .
RUN cmake3 --build . --target install