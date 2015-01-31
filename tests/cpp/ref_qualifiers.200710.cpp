// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

struct refquals {
  void f() & {}
  void f() && {}
};

void test_ref_qualifiers() {
  refquals rq;
  rq.f();
}

int main() {
  test_ref_qualifiers();
}
