#!/usr/bin/perl

use strict;

if (0)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

if (0.0)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

if ("0")
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

if ("")
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

if (undef)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

my @myArray = ();
if (@myArray)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

my %myHash = ();
if (%myHash)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

if (1)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => yes

if ("0.0")
{
    print "yes\n";
}
else
{
    print "no\n";
} # => yes

if (".0")
{
    print "yes\n";
}
else
{
    print "no\n";
} # => yes

my $x = 5;
my $y;
if (defined($x))
{
    print "yes\n";
}
else
{
    print "no\n";
} # => yes
if (defined($y))
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no
if ($x == 0)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => no

my @myArray = ();
my $myArrayLength = scalar @myArray;
if ($myArrayLength == 0)
{
    print "yes\n";
}
else
{
    print "no\n";
} # => yes
