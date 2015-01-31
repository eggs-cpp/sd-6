// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <algorithm>

void test_robust_nonmodifying_seq_ops_equal() {
  std::equal((int*)0, (int*)0, (int*)0, (int*)0);
}

void test_robust_nonmodifying_seq_ops_mismatch() {
  std::mismatch((int*)0, (int*)0, (int*)0, (int*)0);
}

void test_robust_nonmodifying_seq_ops_is_permutation() {
  std::is_permutation((int*)0, (int*)0, (int*)0, (int*)0);
}

int main() {
  test_robust_nonmodifying_seq_ops_equal();
  test_robust_nonmodifying_seq_ops_mismatch();
  test_robust_nonmodifying_seq_ops_is_permutation();
}
