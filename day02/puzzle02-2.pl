use strict;
use warnings;
use Path::Tiny qw(path);

# if we have a forward, then we also do aim * the number, then add that to
# depth

my @input = path("puzzle02-input")->lines;
#my @input =  ('forward 5', 'down 5', 'forward 8', 'up 3', 'down 8', 'forward 2');

my %directions = (
   forward => 0,
   up => 0,   
   down => 0,
   aim => 0,
);

for (@input) {
  my @line = split(" ", $_);
  my $dir = $line[0];
  my $num = $line[1] + 0;
  if ($dir eq "forward") {
    $directions{forward} += $num;
    $directions{down} += ($directions{aim} * $num);
  } elsif ($line[0] eq "down") {
    $directions{aim} += $num;
  } elsif ($line[0] eq "up") {
    $directions{aim} -= $num;
  }
};

my $total = $directions{forward} * $directions{down};
print($total);
