cmake_minimum_required(VERSION 3.17)
project(template_project)
FIND_PACKAGE(VOID REQUIRED) #VOID_LIB_PATH

#configure
set(MCU atmega168p)
set(F_CPU 16000000UL)

add_avr_executable(template_project ${MCU} src/main$<$<BOOL:VOID_LIB_PATH>:_void>.cpp)
#setup frequency
target_compile_definitions(template_project.elf PUBLIC F_CPU=${F_CPU})
#setup options
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_17)
set_project_options(project_options)
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)
print_size_details(template_project)
#other libraries
if (VOID_LIB_PATH)
configure_void_library(NAME void MCU ${MCU} F_CPU ${F_CPU})
endif()
#link target with options
target_link_libraries(template_project.elf PRIVATE project_options project_warnings)
if (VOID_LIB_PATH)
target_link_libraries(template_project.elf PRIVATE void project_options project_warnings)
endif()
#configure cpptools for better syntax highlight for vscode
#CPPTOOL_PATH - path to generated file c_cpp_properties.json
#configure_cpptools(TARGET template_project PATH ${CPPTOOL_PATH})