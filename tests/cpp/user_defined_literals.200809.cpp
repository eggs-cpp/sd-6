// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <cstddef>

int operator "" _udl(unsigned long long) {
  return 0;
}

int operator "" _udl(long double) {
  return 0;
}

int operator "" _udl(char) {
  return 0;
}

int operator "" _udl(char const*, std::size_t) {
  return 0;
}

template <char...>
int operator "" _rudl() {
  return 0;
}

void test_user_defined_literals() {
  int iudl = 0_udl;
  int fudl = 0._udl;
  int cudl = '0'_udl;
  int sudl = ""_udl;
  int irudl = 0_rudl;
  int frudl = 0._rudl;
}

int main() {
  test_user_defined_literals();
}
