// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <iterator>

void test_make_reverse_iterator() {
  std::reverse_iterator<int*> p{std::make_reverse_iterator((int*)0)};
}

int main() {
  test_make_reverse_iterator();
}
