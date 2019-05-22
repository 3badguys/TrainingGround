#!/usr/bin/perl

use Data::Dumper;
$Data::Dumper::Indent = 0; # set it to print in a compact way

@ss = (3, 4, 5);
%ss = qw(mary 17 joe 18 alice 19);
# qw for autoquote, same as ('mary' => 17, 'joe' => 18, 'alice' => 19)

print Dumper(\@ss), "\n"; # $VAR1 = [3,4,5];
print Dumper(\%ss), "\n"; # $VAR1 = {'joe' => '18','mary' => '17','alice' => '19'};

# For formating strings, you can use "sprintf", which is like other language's "format".
# Or, you can use "printf", which is equivalent to print sprintf(FORMAT, LIST).

# interger
printf '%d', 1234;
print "\n";

# padding by space
printf '%4d', 12;
print "\n";

# float. 2 interger, 4 decimal
printf "%2.4f", 3.123456789;
print "\n";

# string
printf '%5s', 'cats';
print "\n";
printf '%2s', 'cats';
print "\n";

printf ('%2d◇%6d◇%2.4f◇%s', 1234, 5678, 3.1415926, 'cats');
print "\n";
