// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <initializer_list>
#include <iterator>
#include <vector>

template <typename Container>
void test_nonmember_container_access() {
  Container c = {1, 2, 3};
  std::size_t s = std::size(c);
  bool e = std::empty(c);
  int const* d = std::data(c);
}

void test_nonmember_container_access() {
  test_nonmember_container_access<std::vector<int>>();
  test_nonmember_container_access<int[3]>();
  test_nonmember_container_access<std::initializer_list<int>>();
}

int main() {
  test_nonmember_container_access();
}
