// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template <typename T> struct is_lvref { enum { value = false }; };
template <typename T> struct is_lvref<T&> { enum { value = true }; };

template <typename T> struct is_rvref { enum { value = false }; };
template <typename T> struct is_rvref<T&&> { enum { value = true }; };

void test_decltype() {
  int lv = 0;
  decltype((lv)) ilv = (lv);
  int check_lvref[is_lvref<decltype(ilv)>::value ? 1 : -1];
  decltype(static_cast<int&&>(lv)) irv = static_cast<int&&>(lv);
  int check_rvref[is_rvref<decltype(irv)>::value ? 1 : -1];
}

int main() {
  test_decltype();
}
