include(GoogleTest)

function(add_gtest_test test_name test_src)
    get_filename_component(test_src_absolute ${test_src} REALPATH)

    add_executable(${test_name}
            ${test_src}
            )

    target_include_directories(${test_name}
            PRIVATE ${CMAKE_SOURCE_DIR}/src
            )

    target_link_libraries(${test_name} PRIVATE
            gtest
            gtest_main
            yacppbp
            )

    gtest_discover_tests(${test_name}
            WORKING_DIRECTORY ${PROJECT_DIR}
            PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}"
            )

    set_target_properties(${test_name} PROPERTIES FOLDER tests)

    add_test(NAME ${test_name} COMMAND ${test_name})
endfunction()