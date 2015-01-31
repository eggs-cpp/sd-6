// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_exceptions() {
  try {
    try {
      throw 0;
    } catch (int) {
      throw;
    }
  } catch (...) {}
}

int main() {
  test_exceptions();
}
