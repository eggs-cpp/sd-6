// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


void test_init_captures() {
  int x = 0;
  [x = x + 1](){};
  [&r = x](){};
}

int main() {
  test_init_captures();
}
