docker build -t tmp-aws-lambda-cpp-build .
docker create -ti --name build-the-program tmp-aws-lambda-cpp-build /bin/bash
mkdir -p bin
docker cp build-the-program:/app/main ./bin/program
docker rm -f build-the-program
docker rmi tmp-aws-lambda-cpp-build