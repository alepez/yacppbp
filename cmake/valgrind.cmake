function(target_valgrind_setup target)
    add_custom_target(
            ${target}_valgrind_check
            COMMAND
            valgrind
            --leak-check=full
            --track-fds=yes
            --trace-children=yes
            --error-exitcode=1
            $<TARGET_FILE:${target}>
            COMMENT "running valgrind"
    )
    
    target_add_to_target(${target}_valgrind_check valgrind_check)
endfunction()