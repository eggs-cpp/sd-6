# Eggs.SD-6
#
# Copyright Agustin K-ballo Berge, Fusion Fenix 2015
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 2.8)

include (CMakeParseArguments)

set(_Eggs_SD6_ModulePath ${CMAKE_CURRENT_LIST_DIR})

set(_Eggs_SD6_Features
    "aggregate_nsdmi"
    "alias_templates"
    "attributes"
    "binary_literals"
    "constexpr"
    "decltype"
    "decltype_auto"
    "delegating_constructors"
    "digit_separators"
    "exceptions"
    "generic_lambdas"
    "inheriting_constructors"
    "initializer_lists"
    "init_captures"
    "lambdas"
    "nsdmi"
    "range_based_for"
    "raw_strings"
    "ref_qualifiers"
    "return_type_deduction"
    "rtti"
    "rvalue_references"
    "sized_deallocation"
    "static_assert"
    "unicode_characters"
    "unicode_literals"
    "user_defined_literals"
    "variable_templates"
    "lib_chrono_udl"
    "lib_complex_udl"
    "lib_exchange_function"
    "lib_generic_associative_lookup"
    "lib_integer_sequence"
    "lib_integral_constant_callable"
    "lib_is_final"
    "lib_is_null_pointer"
    "lib_make_reverse_iterator"
    "lib_make_unique"
    "lib_null_iterators"
    "lib_quoted_string_io"
    "lib_result_of_sfinae"
    "lib_robust_nonmodifying_seq_ops"
    "lib_shared_timed_mutex"
    "lib_string_udl"
    "lib_transformation_trait_aliases"
    "lib_transparent_operators"
    "lib_tuples_by_type"
    "lib_tuple_element_t")

set(_Eggs_SD6_Includes
  "algorithm"
  "array"
  "atomic"
  "bitset"
  "cassert"
  "ccomplex"
  "cctype"
  "cerrno"
  "cfenv"
  "cfloat"
  "chrono"
  "cinttypes"
  "ciso646"
  "climits"
  "clocale"
  "cmath"
  "codecvt"
  "complex"
  "condition_variable"
  "csetjmp"
  "csignal"
  "cstdalign"
  "cstdarg"
  "cstdbool"
  "cstddef"
  "cstdint"
  "cstdio"
  "cstdlib"
  "cstring"
  "ctgmath"
  "ctime"
  "cuchar"
  "cwchar"
  "cwctype"
  "deque"
  "exception"
  "forward_list"
  "fstream"
  "functional"
  "future"
  "initializer_list"
  "iomanip"
  "ios"
  "iosfwd"
  "iostream"
  "istream"
  "iterator"
  "limits"
  "list"
  "locale"
  "map"
  "memory"
  "mutex"
  "new"
  "numeric"
  "ostream"
  "queue"
  "random"
  "ratio"
  "regex"
  "scoped_allocator"
  "set"
  "shared_mutex"
  "sstream"
  "stack"
  "stdexcept"
  "streambuf"
  "string"
  "strstream"
  "system_error"
  "thread"
  "tuple"
  "type_traits"
  "typeindex"
  "typeinfo"
  "unordered_map"
  "unordered_set"
  "utility"
  "valarray"
  "vector")

set(_Eggs_SD6_Attributes
  "carries_dependency"
  "deprecated"
  "noreturn")

function(_Eggs_SD6_HasDefinedMacro macro output) # <value> <variable>
  set(_Eggs_SD6_MacroName ${macro})
  set(test "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${macro}.cpp")
  configure_file("${_Eggs_SD6_ModulePath}/tests/has_defined_macro.cpp" ${test})
  try_compile(result "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${test})
  set(${output} ${result} PARENT_SCOPE)
  file(REMOVE ${test})
endfunction()

function(_Eggs_SD6_TestPPExpression id expression output) # <value> <value> <variable>
  set(_Eggs_SD6_PPExpression ${expression})
  set(test "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${id}.cpp")
  configure_file("${_Eggs_SD6_ModulePath}/tests/test_pp_expression.cpp" ${test})
  try_compile(result "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${test})
  set(${output} ${result} PARENT_SCOPE)
  file(REMOVE ${test})
endfunction()

function(_Eggs_SD6_HasInclude header_name output) # <value> <variable>
  set(_Eggs_SD6_HeaderName ${header_name})
  set(test "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${header_name}.cpp")
  configure_file("${_Eggs_SD6_ModulePath}/tests/has_include.cpp" ${test})
  try_compile(result "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${test})
  set(${output} ${result} PARENT_SCOPE)
  file(REMOVE ${test})
endfunction()

function(_Eggs_SD6_FeatureTest macro macro_value source output output_provided) # <value> <value> <path> <variable> <variable>
  if(DEFINED _Eggs_SD6${macro})
    list(GET _Eggs_SD6${macro} 0 result)
    if(${result} LESS macro_value AND NOT ${result} EQUAL 0)
      unset(_Eggs_SD6${macro} CACHE)
    endif()
  endif()

  if(DEFINED _Eggs_SD6${macro})
    list(GET _Eggs_SD6${macro} 0 result)
    list(GET _Eggs_SD6${macro} 1 provided)
  else()
    _Eggs_SD6_HasDefinedMacro(${macro} provided)
    if(provided)
      _Eggs_SD6_TestPPExpression("${macro}" "${macro} >= ${macro_value}" result)
    else()
      try_compile(result "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${source})
    endif()

    if(result)
      set(result ${macro_value})
    else()
      set(result 0)
    endif()

    if(NOT ${macro_value} GREATER 199711)
      set(cxx "C++98")
    elseif(NOT ${macro_value} GREATER 201103)
      set(cxx "C++11")
    elseif(NOT ${macro_value} GREATER 201402)
      set(cxx "C++14")
    else()
      set(cxx "C++1z")
    endif()
    message(STATUS "Eggs.SD-6 ${macro} (${cxx}): ${result}")
    set(_Eggs_SD6${macro} ${result} ${provided} CACHE INTERNAL "${macro}")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

function(_Eggs_SD6_AddFeatureTest feature output output_provided) # <value> <variable> <variable>
  set(glob "${_Eggs_SD6_ModulePath}/tests/cpp/${feature}.*.cpp")
  string(REPLACE "/tests/cpp/lib_" "/tests/cpp/lib/" glob ${glob})

  file(GLOB feature_tests ${glob})
  foreach(feature_test ${feature_tests})
    get_filename_component(feature_test_ext ${feature_test} EXT)
    string(REGEX MATCH "[0123456789]+" feature_test_value ${feature_test_ext})

    _Eggs_SD6_FeatureTest("__cpp_${feature}" "${feature_test_value}" "${feature_test}" result provided)
    set(${output} ${result} PARENT_SCOPE)
    set(${output_provided} ${provided} PARENT_SCOPE)
  endforeach()
endfunction()

function(_Eggs_SD6_IncludeTest header_name output output_provided) # <value> <variable> <variable>
  if(DEFINED _Eggs_SD6__has_include_${header_name})
    list(GET _Eggs_SD6__has_include_${header_name} 0 result)
    list(GET _Eggs_SD6__has_include_${header_name} 1 provided)
  else()
    if(DEFINED _Eggs_SD6__has_include)
      set(has_include ${_Eggs_SD6__has_include})
    else()
      _Eggs_SD6_HasDefinedMacro("__has_include" has_include)
      set(_Eggs_SD6__has_include ${has_include} CACHE INTERNAL "__has_include")
    endif()

    if(has_include)
      _Eggs_SD6_TestPPExpression("${header_name}" "__has_include(<${header_name}>)" result)
    else()
      _Eggs_SD6_HasInclude(${header_name} result)
    endif()

    if(result)
      set(result "1")
    else()
      set(result "0")
    endif()
    set(provided ${has_include})

    message(STATUS "Eggs.SD-6 __cpp_has_include(${header_name}): ${result}")
    set(_Eggs_SD6__has_include_${header_name} ${result} ${provided} CACHE INTERNAL "__cpp_has_include(${header_name})")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

function(_Eggs_SD6_AttributeTest attribute output output_provided) # <value> <variable> <variable>
  if(DEFINED _Eggs_SD6__has_attribute_${attribute})
    list(GET _Eggs_SD6__has_attribute_${attribute} 0 result)
    list(GET _Eggs_SD6__has_attribute_${attribute} 1 provided)
  else()
    if(DEFINED _Eggs_SD6__has_attribute)
      set(has_attribute ${_Eggs_SD6__has_attribute})
    else()
      _Eggs_SD6_HasDefinedMacro("__has_cpp_attribute" has_attribute)
      set(_Eggs_SD6__has_attribute ${has_attribute} CACHE INTERNAL "__has_attribute")
    endif()

    if(has_attribute)
      _Eggs_SD6_TestPPExpression("${attribute}" "__has_cpp_attribute(${attribute})" result)
    else()
      # _Eggs_SD6_HasAttribute(${attribute} result)
      set(result FALSE)
    endif()

    if(result)
      set(result "1")
    else()
      set(result "0")
    endif()
    set(provided ${has_attribute})

    message(STATUS "Eggs.SD-6 __cpp_has_attribute(${attribute}): ${result}")
    set(_Eggs_SD6__has_attribute_${attribute} ${result} ${provided} CACHE INTERNAL "__cpp_has_attribute(${attribute})")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

macro(_Eggs_SD6_AddDefinition output name value provided) # <variable> <value> <value> <value>
  if(DEFINED ${output})
    if(${provided})
      set(${output} "${${output}}//")
    endif()
    set(${output} "${${output}}#define ${name} ${value}\n")
  elseif(NOT ${provided})
    add_definitions("-D\"${name}=${value}\"")
  endif()
endmacro()

macro(Eggs_SD6_Setup) # PREFIX UPPERCASE OUTPUT_FILE
  if(NOT DEFINED _Eggs_SD6_Setup)
    CMAKE_PARSE_ARGUMENTS(_Eggs_SD6 "" "PREFIX;UPPERCASE;OUTPUT_FILE" "" ${ARGN})
    if(NOT DEFINED _Eggs_SD6_PREFIX)
      set(_Eggs_SD6_PREFIX "__cpp")
    endif()
    if(DEFINED _Eggs_SD6_OUTPUT_FILE)
      set(_Eggs_SD6_Content "")
    endif()

    # process features
    foreach(feature ${_Eggs_SD6_Features})
      _Eggs_SD6_AddFeatureTest(${feature} _Eggs_SD6_Value _Eggs_SD6_Provided)
      if(_Eggs_SD6_Value)
        set(_Eggs_SD6_MacroName "${_Eggs_SD6_PREFIX}_${feature}")
        if(_Eggs_SD6_UPPERCASE)
          string(TOUPPER ${_Eggs_SD6_MacroName} _Eggs_SD6_MacroName)
        endif()
        if(NOT _Eggs_SD6_PREFIX STREQUAL "__cpp" OR DEFINED _Eggs_SD6_UPPERCASE)
          set(_Eggs_SD6_Provided FALSE)
        endif()

        _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
             "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" ${_Eggs_SD6_Provided})
      endif()
    endforeach()

    # process includes
    foreach(header_name ${_Eggs_SD6_Includes})
      _Eggs_SD6_IncludeTest(${header_name} _Eggs_SD6_Value _Eggs_SD6_Provided)
      if(_Eggs_SD6_Value AND NOT _Eggs_SD6_Provided)
        set(_Eggs_SD6_MacroName "${_Eggs_SD6_PREFIX}_has_include_${header_name}")
        if(_Eggs_SD6_UPPERCASE)
          string(TOUPPER ${_Eggs_SD6_MacroName} _Eggs_SD6_MacroName)
        endif()

        _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
            "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" FALSE)
      endif()
    endforeach()

    set(_Eggs_SD6_MacroName "${_Eggs_SD6_PREFIX}_has_include")
    if(_Eggs_SD6_UPPERCASE)
      string(TOUPPER ${_Eggs_SD6_MacroName} _Eggs_SD6_MacroName)
    endif()

    if(_Eggs_SD6_Provided)
      _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
          "${_Eggs_SD6_MacroName}(SD6_header_name)" "__has_include(<SD6_header_name>)" FALSE)
    else()
      _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
          "${_Eggs_SD6_MacroName}(SD6_header_name)" "${_Eggs_SD6_MacroName}_##SD6_header_name" FALSE)
    endif()

    # process attributes
    foreach(attribute ${_Eggs_SD6_Attributes})
      _Eggs_SD6_AttributeTest(${attribute} _Eggs_SD6_Value _Eggs_SD6_Provided)
      if(_Eggs_SD6_Value AND NOT _Eggs_SD6_Provided)
        set(_Eggs_SD6_MacroName "${_Eggs_SD6_PREFIX}_has_attribute_${attribute}")
        if(_Eggs_SD6_UPPERCASE)
          string(TOUPPER ${_Eggs_SD6_MacroName} _Eggs_SD6_MacroName)
        endif()

        _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
            "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" FALSE)
      endif()
    endforeach()

    set(_Eggs_SD6_MacroName "${_Eggs_SD6_PREFIX}_has_attribute")
    if(_Eggs_SD6_UPPERCASE)
      string(TOUPPER ${_Eggs_SD6_MacroName} _Eggs_SD6_MacroName)
    endif()

    if(_Eggs_SD6_Provided)
      _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
          "${_Eggs_SD6_MacroName}(SD6_attribute)" "__has_cpp_attribute(#SD6_attribute)" FALSE)
    else()
      _Eggs_SD6_AddDefinition(_Eggs_SD6_Content
          "${_Eggs_SD6_MacroName}(SD6_attribute)" "${_Eggs_SD6_MacroName}_##SD6_attribute" FALSE)
    endif()

    # generate output file
    if(DEFINED _Eggs_SD6_OUTPUT_FILE)
      if(_Eggs_SD6_PREFIX STREQUAL "__cpp")
        set(_Eggs_SD6_PREFIX "EGGS")
      endif()

      file(WRITE ${_Eggs_SD6_OUTPUT_FILE}
"// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#ifndef ${_Eggs_SD6_PREFIX}_SD6_HPP
#define ${_Eggs_SD6_PREFIX}_SD6_HPP

${_Eggs_SD6_Content}
#endif
")
    endif()
    set(_Eggs_SD6_Setup TRUE CACHE INTERNAL "Eggs_SD6_Setup")
  endif()
endmacro()
