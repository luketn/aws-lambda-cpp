FROM alpine as build
WORKDIR /app
RUN apk add --no-cache clang g++ binutils
ADD httplib.h .
ADD main.cpp .
RUN clang++ -static main.cpp -o main && strip main
RUN echo "done!"
