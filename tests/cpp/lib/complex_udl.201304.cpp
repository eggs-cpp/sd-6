// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <complex>

void test_complex_udl() {
  using namespace std::literals::complex_literals;
  std::complex<float> cf = 0if;
  std::complex<double> cd = 0i;
}

int main() {
  test_complex_udl();
}
