// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

enum E : int;
enum class F;

void test_forward_decl_enum() {
  E* ep;
  F* fp;
}

int main() {
  test_forward_decl_enum();
}
