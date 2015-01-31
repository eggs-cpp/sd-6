// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <map>
#include <set>

struct key {};
struct lookup {};

bool operator<(key, key) {
  return false;
}

bool operator<(key, lookup) {
  return false;
}

bool operator<(lookup, key) {
  return false;
}

void test_generic_associative_map_lookup() {
  std::map<key, int, std::less<> > m;
  m.find(lookup());
}

void test_generic_associative_set_lookup() {
  std::set<key, std::less<> > m;
  m.find(lookup());
}

int main() {
  test_generic_associative_map_lookup();
  test_generic_associative_set_lookup();
}
