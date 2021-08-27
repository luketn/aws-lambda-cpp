cmake_minimum_required(VERSION 3.0)

project (lambda)

set(CMAKE_CXX_STANDARD 17)

add_executable(program main.cpp)

add_subdirectory(test)
