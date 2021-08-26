FROM alpine as build
WORKDIR /app
RUN apk add --no-cache gcc clang g++ binutils
ADD main.cpp .
RUN clang++ -static main.cpp -o main && strip main
RUN echo "done!"
