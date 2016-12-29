#!usr/bin/perl
use strict;
use warnings;

my $filename;
my $bmp = "";
if (@ARGV == 1) {
	$filename = $ARGV[0];
} else {
	print "Enter BMP filename: ";
	$filename = <STDIN>; chomp $filename;
}

# Open file and get data as string
print "Reading $filename...\n";
open(BMPFILE, $filename) || die "Cannot open file $filename: $!";
binmode(BMPFILE);
read(BMPFILE, $bmp, -s $filename, 0);
close(BMPFILE);
print "Finished reading $filename.\n";

# Get data as an integer array and invert each value
print "Inverting colours...\n";
my @data = map { 0xFF - ord($_) } split("", substr($bmp, 54));
print "Finished inverting colours.\n";

# Convert back to string
print "Converting to string...\n";
my $inverted = join("", map(chr, @data));
$inverted = substr($bmp, 0, 54) . $inverted;
print "Finished converting to string...\n";

# Open file for writing and write inverted BMP
print "Enter new filename: ";
my $new_filename = <STDIN>; chomp $new_filename;
print "Writing to $new_filename...\n";
open(BMPFILE, ">", $new_filename) || die "Cannot open $filename for writing: $!";
binmode(BMPFILE);
print BMPFILE $inverted;
close(BMPFILE);

print "Done.";