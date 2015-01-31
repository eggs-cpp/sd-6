// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

auto f() { return 0; }
decltype(auto) g() { return 0; }

void test_auto_return_type_deduction() {
  f();
  g();
}

int main() {
  test_auto_return_type_deduction();
}
