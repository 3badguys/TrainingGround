#!/usr/bin/perl

use Data::Dumper qw(Dumper); # load the Dumper function for printing array/hash

$Data::Dumper::Indent = 0; # make it print in compact style

# hash table
%hh = ('john'=>3, 'mary'=>4, 'joe'=>5, 'vicky'=>7);

print Dumper \%hh; # {'joe' => 5,'vicky' => 7,'mary' => 4,'john' => 3}

# get value from a key
print $hh{'mary'}; # 4

# delete a entry
delete $hh{'vicky'};
print Dumper \%hh; # {'john' => 3,'joe' => 5,'mary' => 4}

# get all keys
print Dumper [keys %hh]; # hh]; # ['john', 'joe', 'mary']

# get all values (Perl 5.12. release in 2010)
print Dumper [values %hh]; # [5,4,3]

# check if a key exists
print exists $hh{'mary'}; # returns 1, meaning true.
