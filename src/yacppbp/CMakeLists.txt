add_library(yacppbp
        yacppbp.cpp
        yacppbp.hpp
        )

# Be super-pedantic on compiler warnings
target_compile_options(yacppbp
        PRIVATE -Wall
        PRIVATE -Wpedantic
        PRIVATE -Wextra
        PRIVATE -Werror
        PRIVATE -Wno-unused-parameter
        )

target_include_directories(yacppbp
        PUBLIC ${CMAKE_SOURCE_DIR}/src
        )

target_analysis_setup(yacppbp)

add_gtest_test(yacppbp_test yacppbp_test.cpp)
target_link_libraries(yacppbp_test PRIVATE yacppbp)

target_valgrind_setup(yacppbp_test)