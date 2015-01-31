// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

struct special {
  special() {}
  special(special&&) {}
  special& operator=(special&&) { return *this; }
};

void test_rvalue_references() {
  int&& x = 0;

  special s;
  s = static_cast<special&&>(s);
}

template <typename T> struct is_lvref { enum { value = false }; };
template <typename T> struct is_lvref<T&> { enum { value = true }; };

template <typename D>
void test_forwarding_reference(D&& d) {
  int check_lvref[is_lvref<D>::value ? 1 : -1];
}

void test_forwarding_references() {
  int lv = 0;
  test_forwarding_reference<int&>(lv);
}

int main() {
  test_rvalue_references();
  test_forwarding_references();
}
