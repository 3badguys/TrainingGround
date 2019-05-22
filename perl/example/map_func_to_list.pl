#!/usr/bin/perl

use Data::Dumper;
$Data::Dumper::Indent = 0;

# Use map to apply a function to a list.

# map { expression } list → Evaluates expression for each element of list. Any $_ in expression is replaced by a element in list. Returns the new list. (In scalar context, returns the list length.)
# map { f $_ } list → use function f on the elements.

sub ff {
    return $_[0] + 1;
}

print Dumper [ map { ff $_ } (1, 2, 3, 4)]; # => [2, 3, 4, 5]

# ff written as embedded expression
print Dumper [ map { $_ + 1 } (1, 2, 3, 4)] # => [2, 3, 4, 5]

# $_ → a builtin variable that represent a argument given to a subroutine. $_ is also the default input for regex to match, and in general $_ represents a default argument.
# @_ is the entire arguments as array.
# $_[0] → the first argument.
# The (0..10) generate a list from 0 to 10.
