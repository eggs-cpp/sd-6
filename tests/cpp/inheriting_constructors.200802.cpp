// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <initializer_list>

struct base {
  base(int) {}
};

struct derived : base {
  using base::base;
};

void test_inheriting_constructors() {
  derived d(0);
}

int main() {
  test_inheriting_constructors();
}
