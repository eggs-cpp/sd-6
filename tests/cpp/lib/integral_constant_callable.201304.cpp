// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <type_traits>

void test_integral_constant_callable() {
  std::integral_constant<int, 0> ic;
  ic();
}

int main() {
  test_integral_constant_callable();
}
