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
include CMakeFiles/thor.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/thor.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/thor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/thor.dir/flags.make

CMakeFiles/thor.dir/thor.cc.o: CMakeFiles/thor.dir/flags.make
CMakeFiles/thor.dir/thor.cc.o: ../thor.cc
CMakeFiles/thor.dir/thor.cc.o: CMakeFiles/thor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/thor.dir/thor.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/thor.dir/thor.cc.o -MF CMakeFiles/thor.dir/thor.cc.o.d -o CMakeFiles/thor.dir/thor.cc.o -c "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/thor.cc"

CMakeFiles/thor.dir/thor.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/thor.dir/thor.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/thor.cc" > CMakeFiles/thor.dir/thor.cc.i

CMakeFiles/thor.dir/thor.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/thor.dir/thor.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/thor.cc" -o CMakeFiles/thor.dir/thor.cc.s

# Object files for target thor
thor_OBJECTS = \
"CMakeFiles/thor.dir/thor.cc.o"

# External object files for target thor
thor_EXTERNAL_OBJECTS =

thor: CMakeFiles/thor.dir/thor.cc.o
thor: CMakeFiles/thor.dir/build.make
thor: modules/DES/libdes.a
thor: modules/UDP-Server/libudp.a
thor: CMakeFiles/thor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable thor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/thor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/thor.dir/build: thor
.PHONY : CMakeFiles/thor.dir/build

CMakeFiles/thor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/thor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/thor.dir/clean

CMakeFiles/thor.dir/depend:
	cd "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build" "/home/naina/Desktop/Assignment 2/Needham-Schroeder-Protocol/build/CMakeFiles/thor.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/thor.dir/depend

