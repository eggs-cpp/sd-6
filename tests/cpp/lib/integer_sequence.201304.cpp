// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <utility>

void test_integer_sequence() {
  std::integer_sequence<std::size_t, 0, 1, 2>* is = 0;
  std::index_sequence<0, 1, 2>* ss = 0;
  std::make_integer_sequence<std::size_t, 3>* mis = 0;
  std::make_index_sequence<3>* mss = 0;
  std::index_sequence_for<int, int, int>* misf = 0;

  is = ss = mis = mss = misf;
}

int main() {
  test_integer_sequence();
}
