# Eggs.SD-6
#
# Copyright Agustin K-ballo Berge, Fusion Fenix 2015
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 2.8)

include (CMakeParseArguments)

set(_Eggs_SD6_ModulePath ${CMAKE_CURRENT_LIST_DIR})

macro(_Eggs_SD6_Feature name values) # <string> <list> [<list>]
  set(_Eggs_SD6_Feature_${name} ${values})
  set(_Eggs_SD6_Feature_${name}_prelude "")
  foreach(include ${ARGV2})
    set(_Eggs_SD6_Feature_${name}_prelude
        "${_Eggs_SD6_Feature_${name}_prelude}#include <${include}>\n")
  endforeach()

  list(APPEND _Eggs_SD6_Features ${name})
endmacro()

_Eggs_SD6_Feature("aggregate_nsdmi" "201304")
_Eggs_SD6_Feature("alias_templates" "200704")
_Eggs_SD6_Feature("attributes" "200809")
_Eggs_SD6_Feature("binary_literals" "201304")
_Eggs_SD6_Feature("constexpr" "200704;201304")
_Eggs_SD6_Feature("decltype" "200707")
_Eggs_SD6_Feature("decltype_auto" "201304")
_Eggs_SD6_Feature("delegating_constructors" "200604")
_Eggs_SD6_Feature("fold_expressions" "201411")
_Eggs_SD6_Feature("enumerator_attributes" "201411")
_Eggs_SD6_Feature("exceptions" "199711")
_Eggs_SD6_Feature("explicit_conversions" "200710")
_Eggs_SD6_Feature("forward_decl_enum" "200809")
_Eggs_SD6_Feature("generic_lambdas" "201304")
_Eggs_SD6_Feature("inheriting_constructors" "200802")
_Eggs_SD6_Feature("initializer_lists" "200806")
_Eggs_SD6_Feature("init_captures" "201304")
_Eggs_SD6_Feature("lambdas" "200907")
_Eggs_SD6_Feature("namespace_attributes" "201411")
_Eggs_SD6_Feature("nested_namespace_definitions" "201411")
_Eggs_SD6_Feature("noexcept" "201003")
_Eggs_SD6_Feature("nontype_template_args" "201411")
_Eggs_SD6_Feature("nsdmi" "200809")
_Eggs_SD6_Feature("range_based_for" "200907")
_Eggs_SD6_Feature("raw_strings" "200710")
_Eggs_SD6_Feature("ref_qualifiers" "200710")
_Eggs_SD6_Feature("return_type_deduction" "201304")
_Eggs_SD6_Feature("rtti" "199711")
_Eggs_SD6_Feature("rvalue_references" "200610")
_Eggs_SD6_Feature("sized_deallocation" "201309")
_Eggs_SD6_Feature("static_assert" "200410;201411")
_Eggs_SD6_Feature("unicode_characters" "200704;201411")
_Eggs_SD6_Feature("unicode_literals" "200710")
_Eggs_SD6_Feature("user_defined_literals" "200809")
_Eggs_SD6_Feature("variable_templates" "201304")
_Eggs_SD6_Feature("lib_allocator_is_always_equal" "201411" "memory;scoped_allocator;string;deque;forward_list;list;vector;map;set;unordered_map;unordered_set")
_Eggs_SD6_Feature("lib_allocator_traits_is_always_equal" "201411" "memory;scoped_allocator;string;deque;forward_list;list;vector;map;set;unordered_map;unordered_set")
_Eggs_SD6_Feature("lib_chrono_udl" "201304" "chrono")
_Eggs_SD6_Feature("lib_complex_udl" "201304" "complex")
_Eggs_SD6_Feature("lib_exchange_function" "201304" "utility")
_Eggs_SD6_Feature("lib_generic_associative_lookup" "201304" "map;set")
_Eggs_SD6_Feature("lib_integer_sequence" "201304" "utility")
_Eggs_SD6_Feature("lib_integral_constant_callable" "201304" "type_traits")
_Eggs_SD6_Feature("lib_invoke" "201411" "functional")
_Eggs_SD6_Feature("lib_is_final" "201402" "type_traits")
_Eggs_SD6_Feature("lib_is_null_pointer" "201309" "type_traits")
_Eggs_SD6_Feature("lib_make_reverse_iterator" "201402" "iterator")
_Eggs_SD6_Feature("lib_make_unique" "201304" "memory")
_Eggs_SD6_Feature("lib_map_insertion" "201411" "map")
_Eggs_SD6_Feature("lib_map_try_emplace" "201411" "map")
_Eggs_SD6_Feature("lib_nonmember_container_access" "201411" "iterator;array;deque;forward_list;list;map;regex;set;string;unordered_map;unordered_set;vector")
_Eggs_SD6_Feature("lib_null_iterators" "201304" "iterator")
_Eggs_SD6_Feature("lib_quoted_string_io" "201304" "iomanip")
_Eggs_SD6_Feature("lib_result_of_sfinae" "201210" "type_traits")
_Eggs_SD6_Feature("lib_robust_nonmodifying_seq_ops" "201304" "algorithm")
_Eggs_SD6_Feature("lib_shared_timed_mutex" "201402" "shared_mutex")
_Eggs_SD6_Feature("lib_string_udl" "201304" "string")
_Eggs_SD6_Feature("lib_transformation_trait_aliases" "201304" "type_traits")
_Eggs_SD6_Feature("lib_transparent_operators" "201210" "functional")
_Eggs_SD6_Feature("lib_tuples_by_type" "201304" "utility")
_Eggs_SD6_Feature("lib_tuple_element_t" "201402" "utility")
_Eggs_SD6_Feature("lib_uncaught_exceptions" "201411" "exception")
_Eggs_SD6_Feature("lib_unordered_map_insertion" "201411" "unordered_map")
_Eggs_SD6_Feature("lib_unordered_map_try_emplace" "201411" "unordered_map")
_Eggs_SD6_Feature("lib_void_t" "201411" "type_traits")

macro(_Eggs_SD6_Include header_name) # <string>
  list(APPEND _Eggs_SD6_Includes ${header_name})
endmacro()

_Eggs_SD6_Include("algorithm")
_Eggs_SD6_Include("array")
_Eggs_SD6_Include("atomic")
_Eggs_SD6_Include("bitset")
_Eggs_SD6_Include("cassert")
_Eggs_SD6_Include("ccomplex")
_Eggs_SD6_Include("cctype")
_Eggs_SD6_Include("cerrno")
_Eggs_SD6_Include("cfenv")
_Eggs_SD6_Include("cfloat")
_Eggs_SD6_Include("chrono")
_Eggs_SD6_Include("cinttypes")
_Eggs_SD6_Include("ciso646")
_Eggs_SD6_Include("climits")
_Eggs_SD6_Include("clocale")
_Eggs_SD6_Include("cmath")
_Eggs_SD6_Include("codecvt")
_Eggs_SD6_Include("complex")
_Eggs_SD6_Include("condition_variable")
_Eggs_SD6_Include("csetjmp")
_Eggs_SD6_Include("csignal")
_Eggs_SD6_Include("cstdalign")
_Eggs_SD6_Include("cstdarg")
_Eggs_SD6_Include("cstdbool")
_Eggs_SD6_Include("cstddef")
_Eggs_SD6_Include("cstdint")
_Eggs_SD6_Include("cstdio")
_Eggs_SD6_Include("cstdlib")
_Eggs_SD6_Include("cstring")
_Eggs_SD6_Include("ctgmath")
_Eggs_SD6_Include("ctime")
_Eggs_SD6_Include("cuchar")
_Eggs_SD6_Include("cwchar")
_Eggs_SD6_Include("cwctype")
_Eggs_SD6_Include("deque")
_Eggs_SD6_Include("exception")
_Eggs_SD6_Include("forward_list")
_Eggs_SD6_Include("fstream")
_Eggs_SD6_Include("functional")
_Eggs_SD6_Include("future")
_Eggs_SD6_Include("initializer_list")
_Eggs_SD6_Include("iomanip")
_Eggs_SD6_Include("ios")
_Eggs_SD6_Include("iosfwd")
_Eggs_SD6_Include("iostream")
_Eggs_SD6_Include("istream")
_Eggs_SD6_Include("iterator")
_Eggs_SD6_Include("limits")
_Eggs_SD6_Include("list")
_Eggs_SD6_Include("locale")
_Eggs_SD6_Include("map")
_Eggs_SD6_Include("memory")
_Eggs_SD6_Include("mutex")
_Eggs_SD6_Include("new")
_Eggs_SD6_Include("numeric")
_Eggs_SD6_Include("ostream")
_Eggs_SD6_Include("queue")
_Eggs_SD6_Include("random")
_Eggs_SD6_Include("ratio")
_Eggs_SD6_Include("regex")
_Eggs_SD6_Include("scoped_allocator")
_Eggs_SD6_Include("set")
_Eggs_SD6_Include("shared_mutex")
_Eggs_SD6_Include("sstream")
_Eggs_SD6_Include("stack")
_Eggs_SD6_Include("stdexcept")
_Eggs_SD6_Include("streambuf")
_Eggs_SD6_Include("string")
_Eggs_SD6_Include("strstream")
_Eggs_SD6_Include("system_error")
_Eggs_SD6_Include("thread")
_Eggs_SD6_Include("tuple")
_Eggs_SD6_Include("type_traits")
_Eggs_SD6_Include("typeindex")
_Eggs_SD6_Include("typeinfo")
_Eggs_SD6_Include("unordered_map")
_Eggs_SD6_Include("unordered_set")
_Eggs_SD6_Include("utility")
_Eggs_SD6_Include("valarray")
_Eggs_SD6_Include("vector")
_Eggs_SD6_Include("experimental/algorithm")
_Eggs_SD6_Include("experimental/any")
_Eggs_SD6_Include("experimental/chrono")
_Eggs_SD6_Include("experimental/deque")
_Eggs_SD6_Include("experimental/execution_policy")
_Eggs_SD6_Include("experimental/filesystem")
_Eggs_SD6_Include("experimental/forward_list")
_Eggs_SD6_Include("experimental/functional")
_Eggs_SD6_Include("experimental/future")
_Eggs_SD6_Include("experimental/list")
_Eggs_SD6_Include("experimental/map")
_Eggs_SD6_Include("experimental/memory")
_Eggs_SD6_Include("experimental/memory_resource")
_Eggs_SD6_Include("experimental/numeric")
_Eggs_SD6_Include("experimental/optional")
_Eggs_SD6_Include("experimental/ratio")
_Eggs_SD6_Include("experimental/regex")
_Eggs_SD6_Include("experimental/set")
_Eggs_SD6_Include("experimental/string")
_Eggs_SD6_Include("experimental/string_view")
_Eggs_SD6_Include("experimental/system_error")
_Eggs_SD6_Include("experimental/tuple")
_Eggs_SD6_Include("experimental/type_traits")
_Eggs_SD6_Include("experimental/unordered_map")
_Eggs_SD6_Include("experimental/unordered_set")
_Eggs_SD6_Include("experimental/utility")
_Eggs_SD6_Include("experimental/vector")

macro(_Eggs_SD6_Attribute attribute_name) # <string>
  list(APPEND _Eggs_SD6_Attributes ${attribute_name})
endmacro()

_Eggs_SD6_Attribute("carries_dependency")
_Eggs_SD6_Attribute("deprecated")
_Eggs_SD6_Attribute("noreturn")

function(_Eggs_SD6_HasDefinedMacro macro prelude output) # <value> <value> <variable>
  set(_Eggs_SD6_MacroName ${macro})
  set(_Eggs_SD6_Prelude ${prelude})
  set(test "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${macro}.cpp")
  configure_file("${_Eggs_SD6_ModulePath}/tests/has_defined_macro.cpp" ${test})
  try_compile(result "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${test})
  set(${output} ${result} PARENT_SCOPE)
  file(REMOVE ${test})
endfunction()

function(_Eggs_SD6_TestPPExpression id expression prelude output) # <value> <value> <value> <variable>
  set(_Eggs_SD6_PPExpression ${expression})
  set(_Eggs_SD6_Prelude ${prelude})
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

function(_Eggs_SD6_FeatureTest name output output_provided) # <value> <variable> <variable>
  if(DEFINED _Eggs_SD6_Feature_${name}_result)
    list(GET _Eggs_SD6_Feature_${name}_result 0 result)
    list(GET _Eggs_SD6_Feature_${name}_result 1 provided)
  else()
    set(values "${_Eggs_SD6_Feature_${name}}")
    set(prelude "${_Eggs_SD6_Feature_${name}_prelude}")

    set(result 0)
    foreach(value ${values})
      _Eggs_SD6_HasDefinedMacro("__cpp_${name}" "${prelude}" provided)
      if(provided)
        _Eggs_SD6_TestPPExpression("__cpp_${name}" "__cpp_${name} >= ${value}" "${prelude}" test)
      else()
        set(source "${_Eggs_SD6_ModulePath}/tests/cpp/${name}.${value}.cpp")
        string(REPLACE "/tests/cpp/lib_" "/tests/cpp/lib/" source "${source}")

        try_compile(test "${CMAKE_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}" ${source})
      endif()

      if(test)
        set(result ${value})
      endif()
    endforeach()

    message(STATUS "Eggs.SD-6 __cpp_${name}: ${result}")
    set(_Eggs_SD6_Feature_${name}_result
        ${result} ${provided} CACHE INTERNAL "${name}")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

function(_Eggs_SD6_IncludeTest header_name output output_provided) # <value> <variable> <variable>
  if(DEFINED _Eggs_SD6_Include_${header_name}_result)
    list(GET _Eggs_SD6_Include_${header_name}_result 0 result)
    list(GET _Eggs_SD6_Include_${header_name}_result 1 provided)
  else()
    if(DEFINED _Eggs_SD6_Feature_has_include)
      set(has_include ${_Eggs_SD6_Feature_has_include})
    else()
      _Eggs_SD6_HasDefinedMacro("__has_include" "" has_include)
      set(_Eggs_SD6_Feature_has_include
          ${has_include} CACHE INTERNAL "__has_include")
    endif()

    if(has_include)
      _Eggs_SD6_TestPPExpression("${header_name}" "__has_include(<${header_name}>)" "" result)
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
    set(_Eggs_SD6_Include_${header_name}_result
        ${result} ${provided} CACHE INTERNAL "__cpp_has_include(${header_name})")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

function(_Eggs_SD6_AttributeTest attribute output output_provided) # <value> <variable> <variable>
  if(DEFINED _Eggs_SD6_Attribute_${attribute}_result)
    list(GET _Eggs_SD6_Attribute_${attribute}_result 0 result)
    list(GET _Eggs_SD6_Attribute_${attribute}_result 1 provided)
  else()
    if(DEFINED _Eggs_SD6_Feature_has_attribute)
      set(has_attribute ${_Eggs_SD6_Feature_has_attribute})
    else()
      _Eggs_SD6_HasDefinedMacro("__has_cpp_attribute" "" has_attribute)
      set(_Eggs_SD6_Feature_has_attribute
          ${has_attribute} CACHE INTERNAL "__has_attribute")
    endif()

    if(has_attribute)
      _Eggs_SD6_TestPPExpression("${attribute}" "__has_cpp_attribute(${attribute})" "" result)
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
    set(_Eggs_SD6_Attribute_${attribute}_result
        ${result} ${provided} CACHE INTERNAL "__cpp_has_attribute(${attribute})")
  endif()

  set(${output} ${result} PARENT_SCOPE)
  set(${output_provided} ${provided} PARENT_SCOPE)
endfunction()

macro(Eggs_SD6_Setup) # PREFIX UPPERCASE OUTPUT_FILE
  CMAKE_PARSE_ARGUMENTS(_Eggs_SD6 "" "PREFIX;UPPERCASE;OUTPUT_FILE" "" ${ARGN})
  if(NOT DEFINED _Eggs_SD6_PREFIX)
    set(_Eggs_SD6_PREFIX "__cpp")
  endif()

  macro(_Eggs_SD6_SetMacroName output name) # <variable> <value>
    set(${output} "${_Eggs_SD6_PREFIX}_${name}")
    if(NOT _Eggs_SD6_PREFIX STREQUAL "__cpp" OR _Eggs_SD6_UPPERCASE)
      string(TOUPPER ${output} "${output}")
    endif()
  endmacro()

  macro(_Eggs_SD6_AddDefinition name value provided) # <value> <value> <value>
    if(DEFINED _Eggs_SD6_OUTPUT_FILE)
      if(${provided})
        set(_Eggs_SD6_Content "${_Eggs_SD6_Content}//")
      endif()
      set(_Eggs_SD6_Content "${_Eggs_SD6_Content}#define ${name} ${value}\n")
    elseif(NOT ${provided})
      add_definitions("-D\"${name}=${value}\"")
    endif()
  endmacro()

  # process features
  foreach(name ${_Eggs_SD6_Features})
    _Eggs_SD6_FeatureTest(${name} _Eggs_SD6_Value _Eggs_SD6_Provided)
    if(_Eggs_SD6_Value)
      _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "${name}")
      if(NOT _Eggs_SD6_PREFIX STREQUAL "__cpp" OR DEFINED _Eggs_SD6_UPPERCASE)
        set(_Eggs_SD6_Provided FALSE)
      endif()

      _Eggs_SD6_AddDefinition(
            "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" ${_Eggs_SD6_Provided})
    endif()
  endforeach()

  # process includes
  foreach(header_name ${_Eggs_SD6_Includes})
    _Eggs_SD6_IncludeTest(${header_name} _Eggs_SD6_Value _Eggs_SD6_Provided)
    if(_Eggs_SD6_Value)
      string(REPLACE "/" "_" header_name "${header_name}")
      _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "has_include_${header_name}")

      _Eggs_SD6_AddDefinition(
          "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" ${_Eggs_SD6_Provided})
    endif()
  endforeach()

  _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "has_include")
  if(_Eggs_SD6_Provided)
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_header_name)"
        "__has_include(<SD6_header_name>)" FALSE)
  else()
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_header_name)"
        "${_Eggs_SD6_MacroName}_##SD6_header_name" FALSE)
  endif()

  _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "has_include_experimental")
  if(_Eggs_SD6_Provided)
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_header_name)"
        "__has_include(<experimental/SD6_header_name>)" FALSE)
  else()
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_header_name)"
        "${_Eggs_SD6_MacroName}_##SD6_header_name" FALSE)
  endif()

  # process attributes
  foreach(attribute_name ${_Eggs_SD6_Attributes})
    _Eggs_SD6_AttributeTest(${attribute_name} _Eggs_SD6_Value _Eggs_SD6_Provided)
    if(_Eggs_SD6_Value)
      _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "_has_attribute_${attribute_name}")

      _Eggs_SD6_AddDefinition(
          "${_Eggs_SD6_MacroName}" "${_Eggs_SD6_Value}" ${_Eggs_SD6_Provided})
    endif()
  endforeach()

  _Eggs_SD6_SetMacroName(_Eggs_SD6_MacroName "has_attribute")
  if(_Eggs_SD6_Provided)
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_attribute_name)"
        "__has_cpp_attribute(SD6_attribute_name)" FALSE)
  else()
    _Eggs_SD6_AddDefinition(
        "${_Eggs_SD6_MacroName}(SD6_attribute_name)"
        "${_Eggs_SD6_MacroName}_##SD6_attribute_name" FALSE)
  endif()

  # generate output file
  if(DEFINED _Eggs_SD6_OUTPUT_FILE)
    if(_Eggs_SD6_PREFIX STREQUAL "__cpp")
      set(_Eggs_SD6_PREFIX "EGGS")
    endif()

    file(WRITE ${_Eggs_SD6_OUTPUT_FILE}
        "// Eggs.SD-6\n"
        "//\n"
        "// Copyright Agustin K-ballo Berge, Fusion Fenix 2015\n"
        "//\n"
        "// Distributed under the Boost Software License, Version 1.0. (See accompanying\n"
        "// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)\n"
        "\n"
        "#ifndef ${_Eggs_SD6_PREFIX}_SD6_HPP\n"
        "#define ${_Eggs_SD6_PREFIX}_SD6_HPP\n"
        "\n"
        "${_Eggs_SD6_Content}\n"
        "#endif\n")
  endif()
endmacro()
