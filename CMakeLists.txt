cmake_minimum_required(VERSION 4.1)
if(NOT DEFINED VERSION)
    message(FATAL_ERROR "VERSION is not defined. Did you run the build properly?")
endif()
project(resume VERSION ${VERSION})

# Function: add_typst_document
# Usage:
#   add_typst_document(target_name main.typ OUTPUT output.pdf [DEPENDS dep1.typ dep2.typ ...] [COMPILE_DEFINITIONS key1=value1 key2=value2 ...] [INSTALL])
function(add_typst_document target input_file)
    find_program(TYPST_EXECUTABLE typst)
    if(NOT TYPST_EXECUTABLE)
        message(FATAL_ERROR "Typst compiler not found. Please install Typst or add it to PATH.")
    endif()

    set(options INSTALL)
    set(oneValueArgs OUTPUT)
    set(multiValueArgs DEPENDS COMPILE_DEFINITIONS)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    get_filename_component(input_path "${input_file}" ABSOLUTE)
    get_filename_component(input_name_we "${input_path}" NAME_WE)

    set(output_pdf "${CMAKE_CURRENT_BINARY_DIR}/${ARG_OUTPUT}")
    set(compile_args compile "${input_path}" "${output_pdf}")

    # Convert all dependency paths to absolute
    set(dep_files)
    foreach(dep ${ARG_DEPENDS})
        get_filename_component(dep_abs "${dep}" ABSOLUTE)
        list(APPEND dep_files "${dep_abs}")
    endforeach()

    # Create compile definitions
    foreach(def ${ARG_COMPILE_DEFINITIONS})
        list(APPEND compile_args "--input" "${def}")
    endforeach()

    add_custom_command(
        OUTPUT "${output_pdf}"
        COMMAND "${TYPST_EXECUTABLE}" ${compile_args}
        DEPENDS "${input_path}" "${dep_files}"
        COMMENT "Compiling Typst document ${input_file} → ${output_pdf}"
        VERBATIM
    )

    add_custom_target(${target} ALL
        DEPENDS "${output_pdf}"
    )

    if(ARG_INSTALL)
        install(FILES "${output_pdf}" DESTINATION .)
    endif()
endfunction()

add_typst_document(resume ${CMAKE_CURRENT_SOURCE_DIR}/src/main.typ 
    OUTPUT resume.pdf
    COMPILE_DEFINITIONS
        version=${VERSION}
    INSTALL
    OUTPUT 
)

