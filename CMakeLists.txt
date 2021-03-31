cmake_minimum_required(VERSION 3.13)

project(yacppbp)

set(CMAKE_CXX_STANDARD 17)

add_library(yacppbp
        lib/yacppbp/example.cpp
        )

add_executable(yacppbp_bin
        main.cpp
        )

set_target_properties(yacppbp_bin
        PROPERTIES OUTPUT_NAME yacppbp
        )

target_link_libraries(yacppbp_bin
        yacppbp
        )

target_include_directories(yacppbp_bin
        PRIVATE ${PROJECT_SOURCE_DIR}/lib
        )

enable_testing()
include(GoogleTest)
add_subdirectory(test)

# Hide third party targets, so IDEs like Visual Studio aren't cluttered with
# too many targets.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_target_properties(gmock gmock_main gtest gtest_main PROPERTIES FOLDER hidden_targets)