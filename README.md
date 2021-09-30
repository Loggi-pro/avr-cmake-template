# AVR Template project

## Simple Cmake AVR project

### Setup for VSCode:

Setup variables in `.vscode\settings.json`:

```json
"CMAKE_RUNTIME_OUTPUT_DIRECTORY": output binary dir
"TOOLCHAIN_PATH": path to toolchain
"CPPTOOL_PATH": path to generated file c_cpp_properties "${workspaceFolder}/.vscode/c_cpp_properties.json", for better syntax highlight
"VOID_LIB_PATH": path to void lib (optional)
```

### Setup for CLion:

1. Create compiler for AVR (Set `Path to C\C++ compilers`) in `File->Settings->Build,Execute,Deployment->Toolchains`

2. Set path to cmake file in `Cmake options` in `File->Settings->Build,Execute,Deployment->Cmake`:
```cmake
-DCMAKE_TOOLCHAIN_FILE:FILEPATH=cmake/avr/entrypoint.cmake
-DVOID_LIB_PATH= path to void lib(optional)
-G Ninja 
```
3. Change `project_name` `MCU` and `F_CPU` in [CMakeList.txt](/CMakeList.txt) file.
