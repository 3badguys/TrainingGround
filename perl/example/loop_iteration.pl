#!/usr/bin/perl

@aa = (1..9);
for $xx (@aa)
{
    print $xx;
} # => 123456789

@aa = (1..9);
for $xx (@aa)
{
    print $xx;
    if ($xx == 4)
    {
        last; # break
    }
} # => 1234

$x = 1;
while ($x <= 9)
{
    print $x, "\n";
    $x++;
}
