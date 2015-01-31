// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

constexpr void void_function() {}

void test_constexpr_void() {
  constexpr int r = (void_function(), 0);
}

constexpr int function(int x) {
  if (x) {}
  switch (x) { default: break; }
  for (int i = 0; i < x; ++i) {}
  while (x){}
  do {} while(x);
  return x;
}

void test_constexpr_function() {
  constexpr int r = function(0);
}

struct ctor {
  constexpr ctor() {}
  constexpr void f() {}
  constexpr void f() const {}
};

constexpr void test_constexpr_non_const() {
  constexpr ctor x;
  x.f();
}

int main() {
  test_constexpr_void();
  test_constexpr_function();
  test_constexpr_non_const();
}
