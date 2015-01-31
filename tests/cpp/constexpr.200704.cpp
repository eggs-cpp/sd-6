// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_constexpr_variable() {
  constexpr int x = 0;
}

constexpr int function(int x) {
  return x * x;
}

void test_constexpr_function() {
  constexpr int r = function(0);
}

struct ctor {
  constexpr ctor() {}
};

void test_constexpr_constructor() {
  constexpr ctor x;
}

int main() {
  test_constexpr_variable();
  test_constexpr_function();
  test_constexpr_constructor();
}
