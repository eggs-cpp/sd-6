// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <type_traits>

struct x final {};

void test_is_final() {
  int check_final[std::is_final<x>::value ? 1 : -1];
}

int main() {
  test_is_final();
}
