// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#include <chrono>

void test_chrono_udl() {
  using namespace std::literals::chrono_literals;
  std::chrono::hours h = 0h;
  std::chrono::minutes min = 0min;
  std::chrono::seconds s = 0s;
  std::chrono::milliseconds ms = 0ms;
  std::chrono::microseconds us = 0us;
  std::chrono::nanoseconds ns = 0ns;
}

int main() {
  test_chrono_udl();
}
