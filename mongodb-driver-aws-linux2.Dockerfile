FROM amazonlinux:2
RUN amazon-linux-extras install epel -y
RUN yum install -y mongo-c-driver libbson tar clang make gzip wget openssl
WORKDIR /opt/cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.2/cmake-3.21.2.tar.gz && \
    tar -xvzf cmake-3.21.2.tar.gz && \
    cd cmake-3.21.2 && \
    ./bootstrap && \
    make && \
    make install
WORKDIR /opt/mongocpp
RUN curl -OL https://github.com/mongodb/mongo-cxx-driver/releases/download/r3.6.5/mongo-cxx-driver-r3.6.5.tar.gz && \
    tar -xzf mongo-cxx-driver-r3.6.5.tar.gz && \
    cd mongo-cxx-driver-r3.6.5/build && \
    cmake ..                                \
        -DCMAKE_BUILD_TYPE=Release          \
        -DCMAKE_INSTALL_PREFIX=/usr/local && \
    cmake --build . && \
    cmake --build . --target install