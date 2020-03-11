##
## **** CMake script and project from Thomas Paviot!!!
##
##
##
##Copyright (c) 2011-2018 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of PYTHONOCC.
##
##PYTHONOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##PYTHONOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with PYTHONOCC.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.12)
project(JAVAOCC)

# set JAVAOCC version
set(JAVAOCC_VERSION_MAJOR 7)
set(JAVAOCC_VERSION_MINOR 4)
set(JAVAOCC_VERSION_PATCH 0)
#  Empty for official releases, set to -dev, -rc1, etc for development releases
set(JAVAOCC_VERSION_DEVEL -dev)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

# for cmake 3.13 and newer, still use old swig style targets
cmake_policy(SET CMP0078 OLD)
cmake_policy(SET CMP0086 OLD)

## cmake policies
if (NOT CMAKE_VERSION VERSION_LESS "3.13")
    # CMP0077: option() honors normal variables
    # https://cmake.org/cmake/help/latest/policy/CMP0077.html
    cmake_policy(SET CMP0077 NEW)
    # CMP0078: UseSWIG generates standard target names.
    # https://cmake.org/cmake/help/latest/policy/CMP0078.html
    cmake_policy(SET CMP0078 OLD)
    # CMP0086: UseSWIG honors SWIG_MODULE_NAME via -module
    cmake_policy(SET CMP0086 OLD)
endif()

# Force C++ 11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT DEFINED JAVAOCC_BUILD_TYPE)
  set(JAVAOCC_BUILD_TYPE "Release" CACHE STRING "Build type") # By default set release build
endif(NOT DEFINED JAVAOCC_BUILD_TYPE)
set(CMAKE_BUILD_TYPE ${JAVAOCC_BUILD_TYPE} CACHE INTERNAL "Build type, immutable" FORCE)

message(STATUS " ${CMAKE_CXX_FLAGS}") 
set(BUILD_SHARED_LIBS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(APPLE)
  set(CMAKE_MACOSX_RPATH ON)
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;@loader_path/../../../")
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif(APPLE)

#############################
# Option_With_Default macro #
#############################
macro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)
  option(${OPTION_NAME} ${OPTION_STRING} ${OPTION_DEFAULT})
endmacro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)

########
# SWIG #
########
find_package(SWIG 3.0.11 REQUIRED)
include(${SWIG_USE_FILE})
set(SWIG_FILES_PATH src/swig/wrapper)
if(SWIG_HIDE_WARNINGS)
  message(STATUS "Disabled SWIG warnings")
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -O -w302,401,402,412,314,509,512,504,325,503,520,350,351,383,389,394,395,404 -java)
else()
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -java)
endif()
    
################################
# OCE include and lib location #
################################
if(OCE_HIDE_DEPRECATED)
  message(STATUS "Disabled deprecation warnings for oce")
  add_definitions(-DOCCT_NO_DEPRECATED)
endif(OCE_HIDE_DEPRECATED)

if(DEFINED OCE_INCLUDE_PATH)
  if(NOT DEFINED OCE_LIB_PATH)
    message(FATAL_ERROR "OCE_LIB_PATH must be defined")
  endif(NOT DEFINED OCE_LIB_PATH)
  set(OCE_INCLUDE_PATH ${OCE_INCLUDE_PATH} CACHE PATH "OCE include path")
  set(OCE_LIB_PATH ${OCE_LIB_PATH} CACHE PATH "OCE lib path")
  include_directories(${OCE_INCLUDE_PATH})
  link_directories(${OCE_LIB_PATH})
# if OCE_INCLUDE_PATH is not passed at command line,
# find OCE automatically
else(OCE_INCLUDE_PATH)
  find_package(OpenCASCADE 7.4.0 REQUIRED)
  
  include_directories(${OpenCASCADE_INCLUDE_DIR})
  if(OpenCASCADE_FOUND)
    message(STATUS "OpenCASCADE found.")
    include_directories(${OCE_INCLUDE_DIRS})
  else(OpenCASCADE_FOUND)  # set default paths
    set(OCE_INCLUDE_PATH /usr/local/include/oce CACHE PATH "OCE include path")
    set(OCE_LIB_PATH /usr/local/lib CACHE PATH "OCE lib path")
    include_directories(${OCE_INCLUDE_PATH})
    link_directories(${OCE_LIB_PATH})
  endif(OpenCASCADE_FOUND)
endif(DEFINED OCE_INCLUDE_PATH)

#############################################
# List of OCE shared libraries to link with #
#############################################
set(OCE_MODEL_LIBRARIES TKernel TKMath TKG2d TKG3d TKGeomBase TKBRep TKGeomAlgo
                        TKTopAlgo TKPrim TKBO TKShHealing TKBool TKHLR TKFillet
                        TKOffset TKFeat TKMesh TKXMesh)
set(OCE_VISUALIZATION_LIBRARIES TKService TKV3d TKOpenGl TKMeshVS)
set(OCE_DATAEXCHANGE_LIBRARIES TKXSBase TKSTEPBase TKSTEPAttr TKSTEP209 TKSTEP TKIGES
                               TKXCAF TKXDEIGES TKXDESTEP TKSTL TKVRML TKXmlXCAF TKBinXCAF)
set(OCE_OCAF_LIBRARIES TKCDF TKLCAF TKCAF TKBinL TKXmlL TKBin TKXml TKStdL
                       TKStd TKTObj TKBinTObj TKXmlTObj TKVCAF)

################
# Headers path #
################
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/swig/headers)

######################################################
# Configure Build settings according to the platform #
######################################################

# Mingw64 needs MS_WIN64 to be defined (otherwise link failures)
if(MINGW)
  message(STATUS "MinGW:")
  if(${CMAKE_SIZEOF_VOID_P} MATCHES "8")  # 64 bit check
      add_definitions(-DMS_WIN64)
  endif(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
endif(MINGW)

# MACOSX_DEPLOYEMENT_TARGET
# explicit link to libc++ for recent osx versions
if(APPLE)
  message(STATUS "Explicitely link to libc++ on modern osx versions")
  add_definitions(-stdlib=libc++)
endif(APPLE)

if(UNIX)
  if(APPLE)
    ######### MacOSX ###########
    set(PLATFORM Darwin)
  else(APPLE)
    ######### Unix/Linux ###########
    set(PLATFORM Unix)
  endif(APPLE)
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DHAVE_CONFIG_H)
  add_definitions(-DHAVE_CONFIG_H -DCSFDB)
else(UNIX)
  if(WIN32)
    ######### Windows ###########
    add_definitions(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
    set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DWIN32 -D_WINDOWS)
    set(PLATFORM win)
  else(WIN32)
    message(STATUS "Unknown platform")
  endif(WIN32)
endif(UNIX)

################################################
# Define output path for generated libraries:  #
# platform/compiler-build_type-bits            #
# for instance:                                #
#     ./win32/bin/vc7.1-release-64             #
#     ./win32/bin/vc9-debug-32                 #
#     ./Unix/i386-debug-64                     #
################################################
if(WIN32)
  if(MSVC) # The compiler used is MSVC
    message(STATUS "Found MSVC compiler: ${MSVC} ${MSVC_VERSION}")
    set(LIBRARY_OUTPUT_PATH bin/)
    # prevent bigobj fatal error C1148 issue, and remove C4244 verbose warning
    add_definitions("/bigobj /wd4244 /wd4251 /wd4275 /wd4290")
  elseif (BORLAND) # The compiler used is BORLAND
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  else()
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  endif()
  set(EXECUTABLE_OUTPUT_PATH ${LIBRARY_OUTPUT_PATH})
else(WIN32)
  set(LIBRARY_OUTPUT_PATH ${PLATFORM}/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_BUILD_TYPE}-${BIT})
endif(WIN32)
set(CMAKE_SWIG_OUTDIR ${LIBRARY_OUTPUT_PATH})

##################
# MODEL Toolkits #
##################
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
foreach(OCE_MODULE ${OCE_TOOLKIT_MODEL})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library (${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} Python3::Module)
endforeach(OCE_MODULE)

##############
# Tesselator #
##############
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Tesselator)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator)
set(TESSELATOR_SOURCE_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/ShapeTesselator.cpp)

swig_add_library(Tesselator LANGUAGE python SOURCES ${TESSELATOR_SOURCE_FILES} TYPE MODULE)
swig_link_libraries(Tesselator ${OCE_MODEL_LIBRARIES} shared)

################
# DataExchange #
################
if(JAVAOCC_WRAP_DATAEXCHANGE)
  foreach(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE} ${OCE_DATAEXCHANGE_LIBRARIES} Python3::Module)
  endforeach(OCE_MODULE)
endif(JAVAOCC_WRAP_DATAEXCHANGE)

########
# OCAF #
########
if(JAVAOCC_WRAP_OCAF)
  foreach(OCE_MODULE ${OCE_TOOLKIT_OCAF})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE}  ${OCE_OCAF_LIBRARIES} Python3::Module)
  endforeach(OCE_MODULE)
endif(JAVAOCC_WRAP_OCAF)