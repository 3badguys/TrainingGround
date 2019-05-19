#!/usr/bin/perl

$x = 1;
if ($x == 1)
{
    print "x yes\n";
}
else
{
    print "x no\n"
} # => x yes

$y = 2;
if ($y == 1)
{
    print "y yes\n";
}
else
{
    print "y no\n";
} # => y no

$z = 2;
if ($z < 0)
{
    print "z neg\n";
}
elsif ($z == 0)
{
    print "z zero\n";
}
else
{
    print "z other\n";
} # => z other
