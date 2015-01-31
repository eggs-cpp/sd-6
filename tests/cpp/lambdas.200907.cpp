// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template <typename Callable>
void test_lambda(Callable c) {
  int lr = c();
}

void test_lambdas() {
  test_lambda([]{ return 0; });
  test_lambda([](){ return 0; });
  test_lambda([=](){ return 0; });
  test_lambda([&](){ return 0; });
  test_lambda([]() mutable { return 0; });
}

int main() {
  test_lambdas();
}
