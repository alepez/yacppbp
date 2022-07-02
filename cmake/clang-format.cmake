function(clang_format_check_setup prefix)
    add_custom_target(${prefix}_clang_format_check
            COMMAND
            clang-format
            --dry-run --Werror
            -i
            ${ARGN}
            WORKING_DIRECTORY
            ${CMAKE_SOURCE_DIR}
            )

    target_add_to_target(${prefix}_clang_format_check clang_format_check)
endfunction()

function(clang_format_fix_setup prefix)
    add_custom_target(${prefix}_clang_format_fix
            COMMAND
            clang-format
            -i
            ${ARGN}
            WORKING_DIRECTORY
            ${CMAKE_SOURCE_DIR}
            )

    target_add_to_target(${prefix}_clang_format_fix clang_format_fix)
endfunction()

function(prefix_clang_format_setup prefix)
    foreach (clang_format_source ${ARGN})
        get_filename_component(clang_format_source ${clang_format_source} ABSOLUTE)
        list(APPEND clang_format_sources ${clang_format_source})
    endforeach ()

    clang_format_check_setup(${prefix} ${clang_format_sources})
    clang_format_fix_setup(${prefix} ${clang_format_sources})
endfunction()

function(target_clang_format_setup target)
    get_target_property(target_sources ${target} SOURCES)
    prefix_clang_format_setup(${target} ${target_sources})
endfunction()