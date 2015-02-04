// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <utility>

void test_exchange_function() {
  bool b = false;
  bool e = std::exchange(b, true);
}

int main() {
  test_exchange_function();
}
