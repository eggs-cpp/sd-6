// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <map>

void test_map_try_emplace() {
  std::map<int, int> m;
  typedef std::map<int, int>::iterator iterator;

  std::pair<iterator, bool> te = m.try_emplace(0, 0);
  iterator teh = m.try_emplace(m.begin(), 0, 0);
  std::pair<iterator, bool> ioa = m.insert_or_assign(0, 0);
  iterator ioah = m.insert_or_assign(m.begin(), 0, 0);
}

int main() {
  test_map_try_emplace();
}
