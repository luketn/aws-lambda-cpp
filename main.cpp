#include <iostream>
#include "./httplib.h"

int main () {
    httplib::Client cli("http://localhost:3000");

    auto res = cli.Get("/");

    if (res) {
        std::cout << res->status << std::endl;
        std::cout << res->body << std::endl;
    } else {
        std::cout << "error: " << httplib::to_string(res.error()) << std::endl;
    }
}