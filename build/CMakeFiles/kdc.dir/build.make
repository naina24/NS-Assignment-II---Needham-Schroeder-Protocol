# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

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
CMAKE_COMMAND = /snap/cmake/936/bin/cmake

# The command to remove a file.
RM = /snap/cmake/936/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build"

# Include any dependencies generated for this target.
include CMakeFiles/kdc.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/kdc.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/kdc.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kdc.dir/flags.make

CMakeFiles/kdc.dir/key_distribution_center.cc.o: CMakeFiles/kdc.dir/flags.make
CMakeFiles/kdc.dir/key_distribution_center.cc.o: ../key_distribution_center.cc
CMakeFiles/kdc.dir/key_distribution_center.cc.o: CMakeFiles/kdc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kdc.dir/key_distribution_center.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/kdc.dir/key_distribution_center.cc.o -MF CMakeFiles/kdc.dir/key_distribution_center.cc.o.d -o CMakeFiles/kdc.dir/key_distribution_center.cc.o -c "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/key_distribution_center.cc"

CMakeFiles/kdc.dir/key_distribution_center.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kdc.dir/key_distribution_center.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/key_distribution_center.cc" > CMakeFiles/kdc.dir/key_distribution_center.cc.i

CMakeFiles/kdc.dir/key_distribution_center.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kdc.dir/key_distribution_center.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/key_distribution_center.cc" -o CMakeFiles/kdc.dir/key_distribution_center.cc.s

# Object files for target kdc
kdc_OBJECTS = \
"CMakeFiles/kdc.dir/key_distribution_center.cc.o"

# External object files for target kdc
kdc_EXTERNAL_OBJECTS =

kdc: CMakeFiles/kdc.dir/key_distribution_center.cc.o
kdc: CMakeFiles/kdc.dir/build.make
kdc: modules/DES/libdes.a
kdc: modules/UDP-Server/libudp.a
kdc: CMakeFiles/kdc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kdc"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kdc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kdc.dir/build: kdc
.PHONY : CMakeFiles/kdc.dir/build

CMakeFiles/kdc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kdc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kdc.dir/clean

CMakeFiles/kdc.dir/depend:
	cd "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles/kdc.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/kdc.dir/depend

