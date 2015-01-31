// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

struct aggregate {
  int x;
  int y = 0;
};

void test_aggregate_nsdmi() {
  aggregate c = {0};
}

int main() {
  test_aggregate_nsdmi();
}
