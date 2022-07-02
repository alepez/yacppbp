function(clang_tidy_check_setup prefix)
    add_custom_command(OUTPUT ${prefix}_clang_tidy_report.txt
            COMMAND
            clang-tidy
            -p ${CMAKE_BINARY_DIR} > ${prefix}_clang_tidy_report.txt
            ${clang_tidy_sources}
            )

    add_custom_command(OUTPUT ${prefix}_clang_tidy_report.xml
            COMMAND
            clang-tidy-to-junit ${CMAKE_SOURCE_DIR} < ${prefix}_clang_tidy_report.txt >  ${prefix}_clang_tidy_report.xml
            DEPENDS ${prefix}_clang_tidy_report.txt
            )

    target_add_to_target(${prefix}_clang_tidy_report.xml clang_tidy_check)
endfunction()

function(clang_tidy_fix_setup prefix)
    add_custom_target(${prefix}_clang_tidy_fix
            COMMAND
            clang-tidy
            -fix
            -p ${CMAKE_BINARY_DIR}
            ${clang_tidy_sources}
            WORKING_DIRECTORY
            ${CMAKE_SOURCE_DIR}
            )

    target_add_to_target(${prefix}_clang_tidy_fix clang_tidy_fix)
endfunction()

function(prefix_clang_tidy_setup prefix)
    foreach (clang_tidy_source ${ARGN})
        get_filename_component(clang_tidy_source ${clang_tidy_source} ABSOLUTE)
        list(APPEND clang_tidy_sources ${clang_tidy_source})
    endforeach ()

    clang_tidy_check_setup(${prefix} ${clang_format_sources})
    clang_tidy_fix_setup(${prefix} ${clang_format_sources})
endfunction()

function(target_clang_tidy_setup target)
    get_target_property(target_sources ${target} SOURCES)
    prefix_clang_tidy_setup(${target} ${target_sources})
endfunction()