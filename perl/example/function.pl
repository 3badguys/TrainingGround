#!/usr/bin/perl

use Data::Dumper;
$Data::Dumper::Indent = 0;


### Define a function
sub ff {
    $a = $_[0]; # get the first arg
    $b = $_[1]; # get the second arg

    # The @_ a builtin variable. Arguments are automatically assigned to array @_.
    # So, $_[0] is the first element of the array @_.
    print Dumper(\@_); # prints the array @_

    # use "return" to return value and exit the function
    return $a + $b;
}

ff(3, 4, "rabbit"); # $VAR1 = [3, 4, 'rabbit'];


## optional parameters
# To define a function with optional parameters, just use defined($_[n]) to check if the argument is given.

# myFun(x, y) return x+y. y is optional and default to 1.
sub myFun {
    $x = $_[0];

    if (defined $_[1])
    {
        $y = $_[1];
    }
    else
    {
        $y = 1;
    }

    return $x + $y;
}

print myFun(3); # 4;
