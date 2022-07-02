add_gtest_test(integration_test integration_test.cpp)

target_link_libraries(integration_test
        PRIVATE yacppbp
        )

target_valgrind_setup(integration_test)