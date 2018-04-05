#!/bin/bash

mkdir -p .ekstazi/results
rm -rf .ekstazi/results/*

# Measure compile time
CC=clang CXX=clang++ perf stat -o .ekstazi/results/compile.txt make -j8

# Measure test time
CC=clang CXX=clang++ perf stat -o .ekstazi/results/test.txt make check -j8

# Measure e2e time
make clean
CC=clang CXX=clang++ perf stat -o .ekstazi/results/e2e.txt make check -j8
