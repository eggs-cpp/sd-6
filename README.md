**Eggs.SD-6**
==================

## Introduction ##

**Eggs.SD-6** is a _CMake_ based **SD-6** approximation.

> **Disclaimer:**
> This project started as an experiment on _CMake_. As such, it is likely to be
> incorrect, sub-optimal and/or simply non-idiomatic. Suggestions and
> pull-requests &mdash;against `develop`&mdash; to improve it are welcome.

[**SD-6**](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4200.htm
"Feature-testing recommendations for C++") is the sixth standing document
issued by the C++ standardization committee. It consists of guidelines for both
implementors and programmers concerning feature-test macros. Consider the
following excerpt of the document, depicting the status quo:

> Here is some code that attempts to determine whether rvalue references are
> available in the implementation in use:
>
> ```C++
> #ifndef __USE_RVALUE_REFERENCES
>   #if (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 3) || \
>       _MSC_VER >= 1600
>     #if __EDG_VERSION__ > 0
>       #define __USE_RVALUE_REFERENCES (__EDG_VERSION__ >= 410)
>     #else
>       #define __USE_RVALUE_REFERENCES 1
>     #endif
>   #elif __clang__
>     #define __USE_RVALUE_REFERENCES __has_feature(cxx_rvalue_references)
>   #else
>     #define __USE_RVALUE_REFERENCES 0
>   #endif
> #endif
> ```

The absence of a tested feature may result in a program with decreased
functionality, or the relevant functionality may be provided in a different
way.

```C++
template <typename T, typename U>
#if __USE_RVALUE_REFERENCES
void foo(T&& t, U&& u) // use perfect forwarding if available
#else
void foo(T t, U u) // otherwise resort to copies
#endif
{ /*...*/ }
```

For the sake of improved portability between partial implementations of various
C++ standards, WG21 recommends in this document that implementors who provide a
new feature define a macro to indicate the presence of support for that
feature, with specified names and values. This would allow programmers to
simply check for the corresponding macro &mdash;e.g., `__cpp_rvalue_references`
&mdash;.

Support for feature-testing recommendations varies across implementors, as it
slowly gains more coverage. However, pre-existing implementations at the time
the document was issued or the macro names were decided will not promote
supported features. While this is not in itself a problem &mdash;remaining
identifiers after macro expansion are replaced with the pp-number `0`&mdash;,
it would result in feature sub-utilization. For this reason, the status quo
will only be slightly affected during this initial phase.

**Eggs.SD-6** was created with the purpose of retrofiting these implementations
with the macros suggested by **SD-6**.

### How it works

#### Features

**Eggs.SD-6** is a _CMake_ module that runs a number of feature tests during
configuration. For each feature-test macro suggested in **SD-6**, a test is
first run to determine whether the macro is provided by the implementation.
If it isn't, then a feature-test is run in order to determine support. Finally,
for each supported feature a corresponding definition is added to the project.

The list of feature-test macros and their values can be found at [**SD-6**](
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4200.htm
"Feature-testing recommendations for C++").

#### Headers

Among WG21 feature-testing recommendations, the `__has_include` feature is
suggested for testing for the presence of a header. During configuration,
**Eggs.SD-6** tests for the availability of such feature and then tests for
the presence of known standard library headers, either by using the provided
feature or by running a feature-test that simply includes the given header
name.

> ```C++
> #ifdef __has_include
> #  if __has_include(<optional>)
> #    include <optional>
> #    define have_optional 1
> #  elif __has_include(<experimental/optional>)
> #    include <experimental/optional>
> #    define have_optional 1
> #    define experimental_optional
> #  else
> #    define have_optional 0
> #  endif
> #endif
> ```

Given that there is no known way to emulate this particular syntax,
**Eggs.SD-6** provides instead the macros `__cpp_has_include` and
`__cpp_has_include_experimental` which can only take a simple _header-name_ as
argument &mdash;`__cpp_has_include(optional)`&mdash;. If the implementation
provides the `__has_include` feature, then the macro is defined to leverage it:

```C++
#define __cpp_has_include(header_name) __has_include(<header_name>)
#define __cpp_has_include_experimental(header_name) __has_include(<experimental/header_name>)
```

Otherwise, then for each known header present a corresponding
`__cpp_has_include_<header-name>` macro is defined, and `__cpp_has_include` is
defined to evaluate to it when present:

```C++
#define __cpp_has_include_experimental_optional 1
#define __cpp_has_include(header_name) __cpp_has_include_##header_name
#define __cpp_has_include_experimental(header_name) __cpp_has_include_experimental_##header_name
```

#### Attributes

Among WG21 feature-testing recommendations, the `__has_cpp_attribute` feature
is suggested for testing for the support of an attribute. During configuration,
**Eggs.SD-6** tests for the availability of such feature.

> ```C++
> #ifdef __has_cpp_attribute
> #  if __has_cpp_attribute(deprecated)
> #    define ATTR_DEPRECATED(msg) [[deprecated(msg)]]
> #  else
> #    define ATTR_DEPRECATED(msg)
> #  endif
> #endif
> ```

**Eggs.SD-6** provides instead the macro `__cpp_has_attribute` &mdash;rationale
for this awkward name shift will become clear in the 'References' section
&mdash;. If the implementation provides the `__has_cpp_attribute` feature, then
the macro is defined to leverage it:

```C++
#define __cpp_has_attribute(attribute_token) __has_cpp_attribute(attribute_token)
```

Otherwise, the macro will always report no support for attributes, as currently
there is no fallback emulation for this feature.

### Reference

The **Eggs.SD-6** _CMake_ module provides a single macro: `Eggs_SD6_Setup`.

```CMake
 Eggs_SD6_Setup([PREFIX string]
                [UPPERCASE constant]
                [OUTPUT_FILE filename])
```

By default, each feature for which support is detected results in a
corresponding `add_definition` when the feature-test macro is not already
provided by the implementation.

If the `PREFIX` argument is given, the generated macro names will use it
instead of the suggested `__cpp` prefix. This argument results in definition
of macros for all supported features, even those provided by the implementation.

If the `UPPERCASE` argument is given and evaluates to true, the generated
macro names will be all uppercase. This argument results in definition of
macros for all supported features, even those provided by the implementation.

If the `OUTPUT_FILE` argument is given, the definitions will be provided in a
generated header file &mdash;via the usual `#define`s&mdash; instead of via
`add_definitions`.

---

> Copyright _Agustín Bergé_, _Fusion Fenix_ 2015
>
> Distributed under the Boost Software License, Version 1.0. (See accompanying
> file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
