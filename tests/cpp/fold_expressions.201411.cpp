// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template<typename... Args>
void test_fold_expression(Args... args) {
  bool cl = (... && args);
  bool cr = (args && ...);
}

void test_fold_expressions() {
  test_fold_expression(true, true, true, false);
}

int main() {
  test_fold_expressions();
}
