# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/aidancrowther/Documents/Projects/pico/pico-sdk/tools/pioasm"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/pioasm"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/tmp"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/src/PioasmBuild-stamp"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/src"
  "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/src/PioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/src/PioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/aidancrowther/Documents/Projects/pico/Halloween Lasers/build/src/pioasm/src/PioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
