// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <type_traits>

struct callable {
  int operator()(){ return 0; }
};

template <typename T>
void test_result_of_sfinae(T&&, ...) {}

template <typename T>
void test_result_of_sfinae(T&&, typename std::result_of<T(int)>::type) {}

void test_result_of_sfinae() {
  test_result_of_sfinae(callable(), 0);
}

int main() {
  test_result_of_sfinae();
}
