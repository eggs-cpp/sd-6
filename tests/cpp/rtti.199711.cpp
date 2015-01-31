// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <typeinfo>

struct base { virtual ~base(){} };
struct derived : base {};

void test_rtti() {
  derived d;
  base& b = d;
  std::type_info const& ti = typeid(b);
}

void test_dynamic_cast() {
  derived d;
  base& b = d;
  dynamic_cast<derived&>(b);
}

int main() {
  test_rtti();
  test_dynamic_cast();
}
