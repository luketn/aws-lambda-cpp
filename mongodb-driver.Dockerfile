FROM debian:stretch-slim
RUN apt update && \
    apt install -y \
        libmongoc-1.0-0 \
        libbson-1.0-0 \
        cmake \
        libssl-dev \
        libsasl2-dev
RUN