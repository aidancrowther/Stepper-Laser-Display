# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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
CMAKE_BINARY_DIR = "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers"

# Utility rule file for Halloween-Laser_two_wire_pio_h.

# Include any custom commands dependencies for this target.
include src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/progress.make

src/CMakeFiles/Halloween-Laser_two_wire_pio_h: src/two_wire.pio.h

src/two_wire.pio.h: /home/aidancrowther/Documents/Projects/pico/PicoStepper/src/picostepper/driver/two_wire.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir="/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Generating two_wire.pio.h"
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/src" && ../pioasm/pioasm -o c-sdk /home/aidancrowther/Documents/Projects/pico/Halloween\ Lasers/src/../../PicoStepper/src/picostepper/driver/two_wire.pio /home/aidancrowther/Documents/Projects/pico/Halloween\ Lasers/src/two_wire.pio.h

Halloween-Laser_two_wire_pio_h: src/CMakeFiles/Halloween-Laser_two_wire_pio_h
Halloween-Laser_two_wire_pio_h: src/two_wire.pio.h
Halloween-Laser_two_wire_pio_h: src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/build.make
.PHONY : Halloween-Laser_two_wire_pio_h

# Rule to build all files generated by this target.
src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/build: Halloween-Laser_two_wire_pio_h
.PHONY : src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/build

src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/clean:
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/src" && $(CMAKE_COMMAND) -P CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/clean

src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/depend:
	cd "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/src" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/src" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/depend

