#!/usr/bin/perl

use Data::Dumper; # for printing array and hash
$Data::Dumper::Indent = 0; # set to print compact

$aa = 4; # scalar
@aa = (1, 2, 3); # array
%aa = ('e' => 4, 'f' => 5, 'g' => 6); # hash

print $aa, "\n"; # 4
print Dumper(\@aa), "\n"; # $VAR1 = [1,2,3];
print Dumper(\%aa), "\n"; # $VAR1 = {'g' => 6,'f' => 5,'e' => 4};

