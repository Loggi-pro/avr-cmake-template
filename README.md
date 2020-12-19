# AVR Template project

## Simple Cmake AVR project

### Setup for VSCode:

Setup variables in `.vscode\settings.json`:

```json
"PROJECT_NAME": name of project,
"CMAKE_EXPORT_COMPILE_COMMANDS": "1", //Generate compile_commands.json
"MCU": avr mcu like "atmega168p",
"F_CPU": frequency like"16000000UL",
"CMAKE_RUNTIME_OUTPUT_DIRECTORY": output binary dir
"TOOLCHAIN_PATH": path to toolchain
"CPPTOOL_PATH": path to generated file c_cpp_properties "${workspaceFolder}/.vscode/c_cpp_properties.json", for better syntax highlight
```

### Setup for CLion:

Setup `Cmake options` in `File->Settings->Build,Execute,Deployment->Cmake`:

```cmake
-DPROJECT_NAME:STRING=<name_of_project>
-DCMAKE_TOOLCHAIN_FILE:FILEPATH=<PROJECT_DIR>/cmake/avr/entrypoint.cmake
-DTOOLCHAIN_PATH:STRING=<PATH_TO_TOLCHAIN>
-DMCU:STRING=<MCU(ex: atmega168p)>
-F_CPU:STRING=<FREQUENCY(ex: 16000000UL)>
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY:STRING=<PROJECT_DIR>/bin
-DCPPTOOL_PATH:STRING=<PROJECT_DIR>/.vscode/c_cpp_properties.json
-G Ninja
```

Don't forget to setup `Path to C\C++ compilers` in `File->Settings->Build,Execute,Deployment->Toolchain`
