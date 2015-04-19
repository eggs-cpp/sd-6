// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

void test_noexcept() noexcept {
}

void test_noexcept_if() noexcept(true) {
}

void test_noexcept_expr() noexcept(noexcept(test_noexcept())) {
  int check_noexcept[noexcept(test_noexcept()) ? 1 : -1];
  int check_noexcept_if[noexcept(test_noexcept_if()) ? 1 : -1];
  int check_noexcept_expr[noexcept(test_noexcept_expr()) ? 1 : -1];
}

int main() {
  test_noexcept();
  test_noexcept_if();
  test_noexcept_expr();
}
