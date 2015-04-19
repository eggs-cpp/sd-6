// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_type(char16_t const*){}
void test_type(char32_t const*){}
void test_type(char const*){}
void test_type(signed char const*){}
void test_type(unsigned char const*){}
void test_type(short const*){}
void test_type(unsigned short const*){}
void test_type(int const*){}
void test_type(unsigned int const*){}
void test_type(long const*){}
void test_type(unsigned long const*){}
void test_type(wchar_t const*){}

void test_types() {
  test_type((char16_t*)0);
  test_type((char32_t*)0);
}

void test_character_literals() {
  char16_t cl16 = u'0';
  char32_t cl32 = U'0';
}

void test_string_literals() {
  char const* sl8 = u8"";
  char16_t const* sl16 = u"";
  char32_t const* sl32 = U"";
}

int main() {
  test_types();
  test_character_literals();
  test_string_literals();
}
