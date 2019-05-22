#!/usr/bin/perl

use Data::Dumper;

@myList = map {$_ * 2} (1..5);

print Dumper(\@myList); # [2, 4, 6, 8, 10]

@myList = map {[$_ * 2, $_ * 3]} (1..5);

print Dumper(\@myList); # [ [ 2, 3 ], [ 4, 6 ], [ 6, 9 ], [ 8, 12 ], [ 10, 15 ] ]

@myList = ();
for $i (1..5)
{
    for $j (1..3)
    {
        push @myList, [$i, $j];
    }
}

$Data::Dumper::Indent = 0;
print Dumper(\@myList);

__END__

[
 [1,1],[1,2],[1,3],
 [2,1],[2,2],[2,3],
 [3,1],[3,2],[3,3],
 [4,1],[4,2],[4,3],
 [5,1],[5,2],[5,3]
]
