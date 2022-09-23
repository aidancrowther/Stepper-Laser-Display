# Generated Cmake Pico project file

#cmake_minimum_required(VERSION 3.13)

#set(CMAKE_C_STANDARD 11)
#set(CMAKE_CXX_STANDARD 17)

# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "/home/aidancrowther/Documents/Projects/pico/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(../pico_sdk_import.cmake)

#project(Halloween-Laser LANGUAGES C CXX ASM VERSION 1.0.0)

# Select files to compile
add_executable(Halloween-Laser)

target_include_directories(Halloween-Laser PRIVATE
        .
        ../../PicoStepper/src
        ../../PicoStepper/src/libraries
        ../../PicoStepper/src/picostepper
        ../../PicoStepper/src/picostepper/driver
)

target_sources(Halloween-Laser PRIVATE 
        Halloween-Laser.c
        ../../PicoStepper/src/libraries/stack.c
        ../../PicoStepper/src/picostepper/picostepper.c
)

target_link_libraries(Halloween-Laser PRIVATE 
        pico_stdlib
        hardware_pio
        hardware_dma
        hardware_pwm
        pico_multicore
)

# Initalise the SDK
pico_sdk_init()

pico_add_extra_outputs(Halloween-Laser)
 
# Enable USB, UART output
pico_enable_stdio_uart(Halloween-Laser 1)
pico_enable_stdio_usb(Halloween-Laser 1)

# Compile the PIO-programs and include it into the project
pico_add_extra_outputs(Halloween-Laser)
pico_generate_pio_header(Halloween-Laser ${CMAKE_CURRENT_LIST_DIR}/../../PicoStepper/src/picostepper/driver/four_wire.pio)
pico_generate_pio_header(Halloween-Laser ${CMAKE_CURRENT_LIST_DIR}/../../PicoStepper/src/picostepper/driver/two_wire.pio)
pico_generate_pio_header(Halloween-Laser ${CMAKE_CURRENT_LIST_DIR}/clocked_input.pio)