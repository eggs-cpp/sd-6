// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_unicode_literals() {
  char const* rsl8 = u8R"()";
  char16_t const* rsl16 = uR"()";
  char32_t const* rsl32 = UR"()";
}

int main() {
  test_unicode_literals();
}
