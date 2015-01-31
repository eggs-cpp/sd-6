# Eggs.SD-6
#
# Copyright Agustin K-ballo Berge, Fusion Fenix 2015
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

project(Eggs.SD6_Test CXX)

cmake_minimum_required(VERSION 2.8)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/..")

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++1z" EGGS_SD6_CXX1Z)
if(EGGS_SD6_CXX1Z)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1z")
else()
  CHECK_CXX_COMPILER_FLAG("-std=c++14" EGGS_SD6_CXX14)
  if(EGGS_SD6_CXX14)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
  else()
    CHECK_CXX_COMPILER_FLAG("-std=c++1y" EGGS_SD6_CXX1Y)
    if(EGGS_SD6_CXX1Y)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
    else()
      CHECK_CXX_COMPILER_FLAG("-std=c++11" EGGS_SD6_CXX11)
      if(EGGS_SD6_CXX11)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
      else()
        CHECK_CXX_COMPILER_FLAG("-std=c++0x" EGGS_SD6_CXX0X)
        if(EGGS_SD6_CXX0X)
          set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
        endif()
      endif()
    endif()
  endif()
endif()

include(EggsSD6)

Eggs_SD6_Setup(OUTPUT_FILE "${CMAKE_BINARY_DIR}/sd-6.hpp")
