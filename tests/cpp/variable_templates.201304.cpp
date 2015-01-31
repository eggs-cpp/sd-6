// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

template<typename T>
T pi = T(3.1415926535897932385);

void test_variable_templates() {
  float pif = pi<float>;
  double pid = pi<double>;
}

int main() {
  test_variable_templates();
}
