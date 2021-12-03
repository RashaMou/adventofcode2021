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
  if ($line[0] eq "forward"){
    $directions{forward} += $line[1];
  } elsif ($line[0] eq "up") {
    $directions{up} += $line[1];
  } else {
    $directions{down} += $line[1];
  }
};

my $total = $directions{forward} * ($directions{down} - $directions{up});

print($total);
