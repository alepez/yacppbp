add_gtest_test(yacppbp_test yacppbp_test.cpp)

target_link_libraries(yacppbp_test
        PRIVATE yacppbp
        )

target_valgrind_setup(yacppbp_test)