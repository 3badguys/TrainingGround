#!/usr/bin/perl

use Data::Dumper; # loads the list-printing module
# $Data::Dumper::Indent = 0;

@a = (0, 1, 2, 'three', 4, 5, 6, 7); # assigns a list to @a
print '@a is: ', Dumper(\@a);

@a = (4, 5, 6); # a list
print scalar(@a); # prints 3. The length
print @a + 0; # prints 3. The + forces a scalar context.

@b = (1, 9);
push (@b, 3); # add a element to @b, at the end
print Dumper(\@b); # [1, 9, 3]

@a = (1, 9);
@b = (3, 4);
@c = ();
push (@c, @a, @b); # @c is the joined list of @a and @b
print Dumper(\@c); # [1, 9, 3, 4]

@a = (1, 9);
@b = (5, 6);
# create a nested list
push (@a, [@b]);
print Dumper(\@a); # [1, 9, [5, 6]]

@a = (1, 8); # array
@b = [1, 8]; # reference of array
print Dumper(\@a);
print Dumper(@b);

@a = (0, 1, 2, 'three', 4, 5, 6, 7);
@b = @a[3, 1, 5]; # ['three', 1, 5]
$c = @a[2]; # gets 2
print Dumper \@b; # ['three', 1, 5]
print $c, "\n"; # 2

@b = @a[1..4]; # the 1..4 create a range
print Dumper \@b; # [1, 2, 'three', 4]

@a = (0, 1, 2, 'three', 4);
@a[3] = 'new';
print Dumper(\@a); # # [ 0, 1, 2, 'new', 4 ]

@b = (4, 5, [1, 2, [9, 8]], 7); # nested list
print Dumper \@b; # [ 4, 5, [ 1, 2, [ 9, 8 ] ], 7 ]

# embed a array as a nested list into another array.
# For example @b = (4, 5, \@myarray, 7)
@a=(1, 2, 3);
@b = (4, 5, \@a, 7);  # embed @a as sublist.
print '@b', Dumper \@b; # [ 4, 5, [ 1, 2, 3 ], 7 ]

@b = (1, 2, ['x', 'y'], 3);
$c = $b[2]->[1];
print $c, "\n"; # 'y'

@b = (1, 2, ['x', [4, 5], 7], 3);
$c = $b[2]->[1]->[1];
print $c, "\n"; # 5
