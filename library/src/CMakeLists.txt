cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(example)

find_package(Torch REQUIRED)

add_executable(exampleapp example.cpp)
target_link_libraries(exampleapp "${TORCH_LIBRARIES}")
set_property(TARGET exampleapp PROPERTY CXX_STANDARD 11)

set_target_properties(exampleapp PROPERTIES
  OUTPUT_NAME example
)

install(
  TARGETS exampleapp DESTINATION bin
)