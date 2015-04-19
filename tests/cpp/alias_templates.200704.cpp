// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

using alias = int;

void test_alias() {
  alias x = 0;
  int* p = &x;
}

template <typename T>
using alias_template = T;

void test_alias_template() {
  alias_template<int> x = 0;
  int* p = &x;
}

int main() {
  test_alias();
  test_alias_template();
}
