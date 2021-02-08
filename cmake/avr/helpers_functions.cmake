# - IN_VAR: EXECUTABLE_NAME ->TARGET
# MCU
FUNCTION(PRINT_SIZE_OF_TARGET EXECUTABLE_NAME)
    set(OUTPUT_DIR ${EXECUTABLE_OUTPUT_PATH})
    set(elf_file ${EXECUTABLE_NAME}.elf)
	get_target_property(MCU ${EXECUTABLE_NAME} MCU)
    add_custom_command(
        TARGET ${EXECUTABLE_NAME} POST_BUILD
        COMMAND ${CMAKE_SIZE} -C --mcu=${MCU} ${OUTPUT_DIR}/${elf_file}	
    )
ENDFUNCTION()
FUNCTION(PRINT_SIZE_ALL_SOURCES EXECUTABLE_NAME)
    set(OUTPUT_DIR ${EXECUTABLE_OUTPUT_PATH})
    set(elf_file ${EXECUTABLE_NAME}.elf)
    set(BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})
    get_target_property(SOURCES ${elf_file} SOURCES)
    #get all sources, and make path to object files
    list(TRANSFORM SOURCES PREPEND ${BUILD_DIR}/CMakeFiles/${elf_file}.dir/)
    list(TRANSFORM SOURCES  APPEND ".obj")
    #MESSAGE("OBJECT FILES = ${SOURCES}")
    add_custom_command(TARGET ${EXECUTABLE_NAME}
            POST_BUILD
            COMMAND ${CMAKE_SIZE} ${SOURCES} > ${BUILD_DIR}/size_sources.txt)
    set(PATH_TO_SIZE_UTILITY "${CURRENT_DIR}/../utils")
    add_custom_command(TARGET ${EXECUTABLE_NAME} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} POST_BUILD COMMAND ${PATH_TO_SIZE_UTILITY}/print_size.cmd ${BUILD_DIR}/size_sources.txt)
ENDFUNCTION()