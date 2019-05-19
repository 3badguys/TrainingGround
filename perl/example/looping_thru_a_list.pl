#!/usr/bin/perl

### Removing Elements in a List
# Use "grep" to remove elements in a list. The form is one of:
# grep {true/false function name $_} array
# grep {expression on $_ ;} array

use Data::Dumper;

sub ff {
    return $_[0] % 2 == 0; # return true if divisible by 2
}

print Dumper[grep {ff $_} (0..10)]; # => [0, 2, 4, 6, 8, 10]

# @_ → a builtin variable that's all the arguments passed to a subroutine, as array. So, $_[0] is the first argument passed.
# $_ → a builtin variable that's the default input for regex to match, and in general represents a default argument.
# The (0..10) generate a list from 0 to 10.
# The % above is the operator for computing remainder of a division.
# The Data::Dumper module is to import the “Dumper” function for printing list.



### Applying Element in a List
$Data::Dumper::Indent = 0;

sub ff {
    # The ** is the exponential operator.
    return ($_[0]**2); # square a number
}

print Dumper [map {ff($_)} (0..10)];
# => $VAR1 = ['0','1','4',9,'16',25,36,49,'64',81,100];
