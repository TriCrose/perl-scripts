#!/usr/bin/perl
use strict;
use warnings;

sub get_next;		# returns an array of valid boards containing another queen
my $n;				# size of board

# get $n
if (@ARGV < 1) {
	print "n? ";
	$n = <STDIN>;
	chomp $n;
} else {
	$n = $ARGV[0];
}

my @solutions = get_next;

foreach my $i (1 .. $n-1) {					# keep adding queens until we have n of them
	my @temp_solutions;
	push (@temp_solutions, get_next @$_) foreach (@solutions);
	@solutions = @temp_solutions;
}

if (@solutions == 0) {
	print "No solutions exist.\n";
} else {
	print ($_ + 1, ": ", join(", ", @{$solutions[$_]}), "\n") foreach (0 .. $#solutions);
}

sub get_next {
	my @rows_available = (1) x $n;			# boolean array storing which rows can validly have a queen
	
	foreach (0 .. $#_) {
		my $row = $_[$_];
		$rows_available[$row] = 0;			# can't place a queen in the same row
		my $pos_diag = $row + @_ - $_;		# can't place a queen in the positive...
		my $neg_diag = $row - @_ + $_;		# ...or negative diagonal
		$rows_available[$pos_diag] = 0 if ($pos_diag < $n);
		$rows_available[$neg_diag] = 0 if ($neg_diag >= 0);
	}
	
	my @boards;								# array of valid boards with another queen
	
	foreach (0 .. $#rows_available) {		# create a new board (array of rows) for each available row
		push @boards, [@_, $_] if ($rows_available[$_]);
	}
	
	return @boards;
}