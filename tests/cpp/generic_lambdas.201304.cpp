// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template <typename Callable>
void test_generic_lambda(Callable c) {
  int lrb = c(false);
  int lri = c(0);
  int lrs = c("");
}

void test_generic_lambdas() {
  test_generic_lambda([](auto v){ return 0; });
  test_generic_lambda([](auto... vs){ return 0; });
}

int main() {
  test_generic_lambdas();
}
