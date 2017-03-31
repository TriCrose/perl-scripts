# perl-scripts

## nqueens.pl
This script solves a more general form of the Eight queens puzzle (https://en.wikipedia.org/wiki/Eight_queens_puzzle). Usage `perl nqueens.pl <n>`. All solutions for `n` are given. The solutions are given as `n` comma-separated numbers (one for each column), with each number denoting which row the queen is in.

## bmp_colour_inverter.pl
This script simply takes a BMP file and inverts the colour of each pixel. The script is interactive and does not require any command-line parameters.

## sorting_algorithms.pl
This is a Perl implementation of the three main sorting algorithms (insertion sort, quicksort and merge sort). The script does not require command-line parameters, and asks for a list of comma-separated numbers upon execution.

## change.pl
This is an implementation of a dynamic programming algorithm to make the minimum change for a given amount (given a set of coin denominations). The function `change` takes the amount first, and then each subsequent parameter is a coin denomination. The return value is an array of the minimum coins required to make change.
