use strict;
use warnings;
use Path::Tiny qw(path);

my @input = path("puzzle02-input")->lines;

my %directions = (
   forward => 0,
   up => 0,   
   down => 0,
);

for (@input) {
  my @line = split(" ", $_);
  $directions{$line[0]} += $line[1];
};

my $total = $directions{forward} * ($directions{down} - $directions{up});

print($total);
