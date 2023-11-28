cmake_minimum_required(VERSION 3.26)
project(hello C)

set(CMAKE_C_STANDARD 11)

include_directories("/usr/local/Cellar/kore/4.2.3/include")

add_custom_command(
        OUTPUT mymodule
        COMMAND kodev build
        VERBATIM
)

add_library(mymodule SHARED src/hello.c)

target_include_directories(mymodule PRIVATE "/usr/local/Cellar/kore/4.2.3/include")

target_link_directories(mymodule PRIVATE "/usr/local/Cellar/kore/4.2.3/lib")