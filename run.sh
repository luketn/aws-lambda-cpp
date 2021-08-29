docker build --platform linux/amd64 -t aws-lambda-cpp .
docker run --rm -ti -p 3777:3777 aws-lambda-cpp
