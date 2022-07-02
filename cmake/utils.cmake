function(target_add_to_target target common)
    if (TARGET ${common})
        add_dependencies(${common} ${target})
    else ()
        add_custom_target(${common} DEPENDS ${target})
    endif ()
endfunction()