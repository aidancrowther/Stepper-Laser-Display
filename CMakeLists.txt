cmake_minimum_required(VERSION 3.12)

# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "/home/aidancrowther/Documents/Projects/pico/pico-sdk")

include(pico_sdk_import.cmake)

project(Halloween-Laser)

pico_sdk_init()

add_subdirectory(FreeRTOS)
add_subdirectory(src)