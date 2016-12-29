#!/usr/bin/perl
use warnings;
use strict;

sub insertion_sort;
sub quick_sort;
sub merge_sort;

print "Enter a sequence of numbers (comma separated) to be sorted:\n";
my $nums = <STDIN>; chomp $nums;
$nums =~ s/\s+//g;
my @numbers = split(",", $nums);
print "Insertion sort:\t", join(", ", insertion_sort @numbers), "\n";
print "Quick sort:\t", join(", ", quick_sort @numbers), "\n";
print "Merge sort:\t", join(", ", merge_sort @numbers), "\n";

sub insertion_sort {
	my @sorted = @_;
	foreach my $i (1 .. $#sorted) {
		my $curr = $sorted[$i];
		my $j;
		for ($j = $i; $j > 0 && $curr < $sorted[$j - 1]; $j--) {
			$sorted[$j] = $sorted[$j - 1];
		}
		$sorted[$j] = $curr;
	} @sorted;
}

sub quick_sort {
	return @_ if (@_ < 2);
	my $pivot = $_[0]; shift;
	quick_sort(grep $_ < $pivot, @_), $pivot, quick_sort(grep $_ >= $pivot, @_);
}

sub merge_sort {
	return @_ if @_ < 2;
	my $k = @_/2;
	my @left = merge_sort @_[0 .. $k - 1];
	my @right = merge_sort @_[$k .. $#_];
	my @result;
	push @result, ($left[0] < $right[0] ? shift @left : shift @right)
		while (@left > 0 && @right > 0);
	push @result, @left if (@left > 0);
	push @result, @right if (@right > 0);
	@result;
}
