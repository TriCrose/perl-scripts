use strict;
use warnings;

sub change {
    my ($n, @coins) = @_;

    my @min_coins = (0);
    my @last_coin;

    for (1 .. $n) {
        for my $coin (@coins) {
            my $prev_index = $_ - $coin;
            next if $prev_index < 0;
            my $prev = $min_coins[$prev_index];
            next if not defined $prev;

            if (not defined $min_coins[$_] or $prev + 1 < $min_coins[$_]) {
                $min_coins[$_] = $prev + 1;
                $last_coin[$_] = $coin;
            }
        }
    }

    return () if not defined $min_coins[$n];

    my @solution;
    my $index = $n;
    while ($index) {
        push @solution, $last_coin[$index];
        $index -= $last_coin[$index];
    }

    return @solution;
}

print join(", ", change(15, 4, 7));