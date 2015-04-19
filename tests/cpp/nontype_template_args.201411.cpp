// Eggs.SD-6
//
// Copyright Agustin K-ballo Berge, Fusion Fenix 2015
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

int x;
int arr[10];
void fun() {}
struct s { static int sm; } so;

template <typename T, T*> struct ptr {};

void test_ptr_nontype_template_args() {
  ptr<int const, &x> q;
  ptr<int, arr> a;
  ptr<void(), fun> f;
  ptr<int, &so.sm> sm;
  ptr<int, nullptr> np;
}

template <typename T, T&> struct ref {};

void test_ref_nontype_template_args() {
  ref<int const, x> q;
  ref<int, so.sm> sm;
}

template <typename T, typename C, T C::*> struct mem_ptr {};

void test_mem_ptr_nontype_template_args() {
  mem_ptr<int, s, nullptr> np;
}

void test_nontype_template_args() {
  test_ptr_nontype_template_args();
  test_ref_nontype_template_args();
  test_mem_ptr_nontype_template_args();
}

int main() {
  test_nontype_template_args();
}
