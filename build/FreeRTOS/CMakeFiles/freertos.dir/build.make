# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build"

# Include any dependencies generated for this target.
include FreeRTOS/CMakeFiles/freertos.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.make

# Include the progress variables for this target.
include FreeRTOS/CMakeFiles/freertos.dir/progress.make

# Include the compile flags for this target's objects.
include FreeRTOS/CMakeFiles/freertos.dir/flags.make

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj: ../FreeRTOS/FreeRTOS-Kernel/event_groups.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/event_groups.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/event_groups.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/event_groups.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj: ../FreeRTOS/FreeRTOS-Kernel/list.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/list.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/list.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/list.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj: ../FreeRTOS/FreeRTOS-Kernel/queue.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/queue.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/queue.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/queue.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj: ../FreeRTOS/FreeRTOS-Kernel/stream_buffer.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/stream_buffer.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/stream_buffer.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/stream_buffer.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj: ../FreeRTOS/FreeRTOS-Kernel/tasks.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/tasks.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/tasks.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/tasks.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj: ../FreeRTOS/FreeRTOS-Kernel/timers.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/timers.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/timers.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/timers.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj: ../FreeRTOS/FreeRTOS-Kernel/portable/MemMang/heap_3.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/MemMang/heap_3.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/MemMang/heap_3.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/MemMang/heap_3.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.s

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj: FreeRTOS/CMakeFiles/freertos.dir/flags.make
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj: ../FreeRTOS/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c
FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj: FreeRTOS/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building C object FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj -MF CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj.d -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj -c "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c"

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c" > CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.i

FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && /usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c" -o CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.s

# Object files for target freertos
freertos_OBJECTS = \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj" \
"CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj"

# External object files for target freertos
freertos_EXTERNAL_OBJECTS =

FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/event_groups.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/list.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/queue.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/stream_buffer.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/tasks.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/timers.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/MemMang/heap_3.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/FreeRTOS-Kernel/portable/GCC/ARM_CM0/port.c.obj
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/build.make
FreeRTOS/libfreertos.a: FreeRTOS/CMakeFiles/freertos.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libfreertos.a"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && $(CMAKE_COMMAND) -P CMakeFiles/freertos.dir/cmake_clean_target.cmake
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/freertos.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
FreeRTOS/CMakeFiles/freertos.dir/build: FreeRTOS/libfreertos.a
.PHONY : FreeRTOS/CMakeFiles/freertos.dir/build

FreeRTOS/CMakeFiles/freertos.dir/clean:
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" && $(CMAKE_COMMAND) -P CMakeFiles/freertos.dir/cmake_clean.cmake
.PHONY : FreeRTOS/CMakeFiles/freertos.dir/clean

FreeRTOS/CMakeFiles/freertos.dir/depend:
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/FreeRTOS" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/FreeRTOS/CMakeFiles/freertos.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : FreeRTOS/CMakeFiles/freertos.dir/depend

