// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <utility>
#include <tuple>

void test_tuples_by_type() {
  std::tuple<int, double> t(1, 2.);
  int& i = std::get<int>(t);
}

int main() {
  test_tuples_by_type();
}
