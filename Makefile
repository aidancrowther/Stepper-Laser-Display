# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake cache editor..."
	/usr/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/CMakeFiles" "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers//CMakeFiles/progress.marks"
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/CMakeFiles" 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named bs2_default

# Build rule for target.
bs2_default: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 bs2_default
.PHONY : bs2_default

# fast build rule for target.
bs2_default/fast:
	$(MAKE) $(MAKESILENT) -f pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default.dir/build.make pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default.dir/build
.PHONY : bs2_default/fast

#=============================================================================
# Target rules for targets named bs2_default_bin

# Build rule for target.
bs2_default_bin: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 bs2_default_bin
.PHONY : bs2_default_bin

# fast build rule for target.
bs2_default_bin/fast:
	$(MAKE) $(MAKESILENT) -f pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_bin.dir/build.make pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_bin.dir/build
.PHONY : bs2_default_bin/fast

#=============================================================================
# Target rules for targets named bs2_default_padded_checksummed_asm

# Build rule for target.
bs2_default_padded_checksummed_asm: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 bs2_default_padded_checksummed_asm
.PHONY : bs2_default_padded_checksummed_asm

# fast build rule for target.
bs2_default_padded_checksummed_asm/fast:
	$(MAKE) $(MAKESILENT) -f pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/build.make pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/build
.PHONY : bs2_default_padded_checksummed_asm/fast

#=============================================================================
# Target rules for targets named Halloween-Laser

# Build rule for target.
Halloween-Laser: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Halloween-Laser
.PHONY : Halloween-Laser

# fast build rule for target.
Halloween-Laser/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/Halloween-Laser.dir/build.make src/CMakeFiles/Halloween-Laser.dir/build
.PHONY : Halloween-Laser/fast

#=============================================================================
# Target rules for targets named ELF2UF2Build

# Build rule for target.
ELF2UF2Build: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 ELF2UF2Build
.PHONY : ELF2UF2Build

# fast build rule for target.
ELF2UF2Build/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/ELF2UF2Build.dir/build.make src/CMakeFiles/ELF2UF2Build.dir/build
.PHONY : ELF2UF2Build/fast

#=============================================================================
# Target rules for targets named PioasmBuild

# Build rule for target.
PioasmBuild: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 PioasmBuild
.PHONY : PioasmBuild

# fast build rule for target.
PioasmBuild/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/PioasmBuild.dir/build.make src/CMakeFiles/PioasmBuild.dir/build
.PHONY : PioasmBuild/fast

#=============================================================================
# Target rules for targets named Halloween-Laser_four_wire_pio_h

# Build rule for target.
Halloween-Laser_four_wire_pio_h: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Halloween-Laser_four_wire_pio_h
.PHONY : Halloween-Laser_four_wire_pio_h

# fast build rule for target.
Halloween-Laser_four_wire_pio_h/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/Halloween-Laser_four_wire_pio_h.dir/build.make src/CMakeFiles/Halloween-Laser_four_wire_pio_h.dir/build
.PHONY : Halloween-Laser_four_wire_pio_h/fast

#=============================================================================
# Target rules for targets named Halloween-Laser_two_wire_pio_h

# Build rule for target.
Halloween-Laser_two_wire_pio_h: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Halloween-Laser_two_wire_pio_h
.PHONY : Halloween-Laser_two_wire_pio_h

# fast build rule for target.
Halloween-Laser_two_wire_pio_h/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/build.make src/CMakeFiles/Halloween-Laser_two_wire_pio_h.dir/build
.PHONY : Halloween-Laser_two_wire_pio_h/fast

#=============================================================================
# Target rules for targets named Halloween-Laser_clocked_input_pio_h

# Build rule for target.
Halloween-Laser_clocked_input_pio_h: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Halloween-Laser_clocked_input_pio_h
.PHONY : Halloween-Laser_clocked_input_pio_h

# fast build rule for target.
Halloween-Laser_clocked_input_pio_h/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/Halloween-Laser_clocked_input_pio_h.dir/build.make src/CMakeFiles/Halloween-Laser_clocked_input_pio_h.dir/build
.PHONY : Halloween-Laser_clocked_input_pio_h/fast

#=============================================================================
# Target rules for targets named Halloween-Laser_uart_pio_h

# Build rule for target.
Halloween-Laser_uart_pio_h: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Halloween-Laser_uart_pio_h
.PHONY : Halloween-Laser_uart_pio_h

# fast build rule for target.
Halloween-Laser_uart_pio_h/fast:
	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/Halloween-Laser_uart_pio_h.dir/build.make src/CMakeFiles/Halloween-Laser_uart_pio_h.dir/build
.PHONY : Halloween-Laser_uart_pio_h/fast

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... ELF2UF2Build"
	@echo "... Halloween-Laser_clocked_input_pio_h"
	@echo "... Halloween-Laser_four_wire_pio_h"
	@echo "... Halloween-Laser_two_wire_pio_h"
	@echo "... Halloween-Laser_uart_pio_h"
	@echo "... PioasmBuild"
	@echo "... bs2_default_bin"
	@echo "... bs2_default_padded_checksummed_asm"
	@echo "... Halloween-Laser"
	@echo "... bs2_default"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
