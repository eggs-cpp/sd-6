// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <exception>

void test_uncaught_exceptions() {
  int ue = std::uncaught_exceptions();
}

int main() {
  test_uncaught_exceptions();
}
