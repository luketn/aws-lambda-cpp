FROM alpine as build
WORKDIR /app
RUN apk add --no-cache clang g++ binutils
ADD httplib.h .
ADD main.cpp .
RUN clang++ -Oz -fno-rtti -fno-stack-protector -fno-ident -fmerge-all-constants -static main.cpp -o main && strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag main
