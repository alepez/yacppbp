# Prevent overriding the parent project's compiler/linker
# settings on Windows

if (MSVC)
	set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endif()

add_subdirectory("${PROJECT_SOURCE_DIR}/extern/googletest" "extern/googletest")

add_executable(yacppbp_test
        example.cpp
        )

target_link_libraries(yacppbp_test
        gtest
        gtest_main
        yacppbp
        )

target_include_directories(yacppbp_test
        PRIVATE ${PROJECT_SOURCE_DIR}/lib
        )

gtest_discover_tests(yacppbp_test
        WORKING_DIRECTORY ${PROJECT_DIR}
        PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}"
        )

set_target_properties(yacppbp_test
  PROPERTIES FOLDER tests)
