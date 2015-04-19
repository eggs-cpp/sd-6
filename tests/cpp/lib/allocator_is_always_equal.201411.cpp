// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <memory>

void test_allocator_is_always_equal() {
  int check_iae[std::allocator<int>::is_always_equal::value ? 1 : -1];
}

int main() {
  test_allocator_is_always_equal();
}
