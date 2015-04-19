// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <unordered_map>

void test_unordered_map_try_emplace() {
  std::unordered_map<int, int> um;
  typedef std::unordered_map<int, int>::iterator iterator;

  std::pair<iterator, bool> te = um.try_emplace(0, 0);
  iterator teh = um.try_emplace(um.begin(), 0, 0);
  std::pair<iterator, bool> ioa = um.insert_or_assign(0, 0);
  iterator ioah = um.insert_or_assign(um.begin(), 0, 0);
}

int main() {
  test_unordered_map_try_emplace();
}
