// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <type_traits>

template <typename T, typename = void>
struct has_type { enum { value = false }; };

template <typename T>
struct has_type<T, std::void_t<typename T::type>> { enum { value = true }; };

struct e {};
struct tt { typedef int type; };

void test_void_t() {
  int check_htn[!has_type<e>::value ? 1 : -1];
  int check_ht[has_type<tt>::value ? 1 : -1];
}

int main() {
  test_void_t();
}
