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
    httplib::Client cli("http://" + lambdaApi + "/2018-06-01/runtime/invocation/next");
    while (true)
    {
        auto res = cli.Get("/");

        if (res)
        {
            std::cout << res->status << std::endl;
            std::cout << res->body << std::endl;
        }
        else
        {
            std::cerr << "error: " << res.error() << std::endl;
        }
    }
}
