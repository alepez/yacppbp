cmake_minimum_required(VERSION 3.12)

project(yacppbp)

set(CMAKE_CXX_STANDARD 17)

# Needed by clang-tidy
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

enable_testing()

add_subdirectory(deps)
add_subdirectory(cmake)
add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(examples)

# Hide third party targets, so IDEs like Visual Studio aren't cluttered with
# too many targets.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
#set_target_properties(gmock gmock_main gtest gtest_main PROPERTIES FOLDER hidden_targets)