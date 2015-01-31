// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template <typename R>
void test_range_based_for(R& r) {
  for (int v : r) {}
}

void test_array_range_based_for() {
  int r[3] = {0, 1, 2};
  test_range_based_for(r);
}

struct member {
  int x;
  int* begin() {
    return &x;
  }
  int* end() {
    return &x + 1;
  }
};

void test_member_range_based_for() {
  member r;
  test_range_based_for(r);
}

namespace adl {
  struct free {
    int x;
  };
  int* begin(free& r) {
    return &r.x;
  }
  int* end(free& r) {
    return &r.x + 1;
  }
}

void test_adl_range_based_for() {
  adl::free r;
  test_range_based_for(r);
}

int main() {
  test_array_range_based_for();
  test_member_range_based_for();
  test_adl_range_based_for();
}
