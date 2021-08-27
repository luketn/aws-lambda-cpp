#include <cstdlib>
#include <iostream>
#include <string>
#include "./httplib.h"

int main()
{
    const char *rawLambdaApi = std::getenv("AWS_LAMBDA_RUNTIME_API");
    if (rawLambdaApi)
    {
        std::cout << "Lambda api: " << rawLambdaApi << std::endl;
    }
    else
    {
        std::cerr << "Could not find lambda api variable" << std::endl;
        std::abort();
    }
    std::string lambdaApi(rawLambdaApi);
    httplib::Client cli("http://" + lambdaApi);
    while (true)
    {
        auto res = cli.Get("/2018-06-01/runtime/invocation/next");

        if (res)
        {
            std::cout << "Recieved event from " << lambdaApi << std::endl;
            std::cout << "Status: " << res->status << std::endl;
            std::cout << "Body:" << std::endl
                      << res->body << std::endl;
            std::string responseId = res->get_header_value("Lambda-Runtime-Aws-Request-Id");
            std::string response = "{\"result\": \"If you ever see this (again) then it works!\"}";
            cli.Post(("/2018-06-01/runtime/invocation/" + responseId + "/response").c_str(), response, "application/json");
        }
        else
        {
            std::cerr << "error: " << res.error() << std::endl;
        }
    }
}
