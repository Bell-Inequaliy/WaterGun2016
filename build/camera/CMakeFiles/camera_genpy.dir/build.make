# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/student/watergun_2016/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/student/watergun_2016/build

# Utility rule file for camera_genpy.

# Include the progress variables for this target.
include camera/CMakeFiles/camera_genpy.dir/progress.make

camera/CMakeFiles/camera_genpy:

camera_genpy: camera/CMakeFiles/camera_genpy
camera_genpy: camera/CMakeFiles/camera_genpy.dir/build.make
.PHONY : camera_genpy

# Rule to build all files generated by this target.
camera/CMakeFiles/camera_genpy.dir/build: camera_genpy
.PHONY : camera/CMakeFiles/camera_genpy.dir/build

camera/CMakeFiles/camera_genpy.dir/clean:
	cd /home/student/watergun_2016/build/camera && $(CMAKE_COMMAND) -P CMakeFiles/camera_genpy.dir/cmake_clean.cmake
.PHONY : camera/CMakeFiles/camera_genpy.dir/clean

camera/CMakeFiles/camera_genpy.dir/depend:
	cd /home/student/watergun_2016/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/student/watergun_2016/src /home/student/watergun_2016/src/camera /home/student/watergun_2016/build /home/student/watergun_2016/build/camera /home/student/watergun_2016/build/camera/CMakeFiles/camera_genpy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : camera/CMakeFiles/camera_genpy.dir/depend

