function(target_analysis_setup target)
    target_clang_format_setup(${target})
    target_clang_tidy_setup(${target})
endfunction()