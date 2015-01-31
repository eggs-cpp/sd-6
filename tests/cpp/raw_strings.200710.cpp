// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_raw_string_literals() {
  char const* rsl = R"()";
  wchar_t const* rwsl = LR"()";
}

int main() {
  test_raw_string_literals();
}
