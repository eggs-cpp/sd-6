// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <utility>
#include <tuple>

void test_tuple_element_t() {
  std::tuple_element_t<0, std::tuple<int, double> > i = 0;
  int* pi = &i;
}

int main() {
  test_tuple_element_t();
}
