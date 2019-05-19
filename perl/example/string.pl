#!/usr/bin/perl

$a = 'this and
 that';
print $a, "\n"; # prints 2 lines

$a = "this\nand that";
print $a, "\n"; # prints 2 lines

$a = 4;
$b = "this is $a";
print $b, "\n"; # this is 4

# the following are all same
$a = q(this 'n' that);
$b = q[this 'n' that];
$c = q{this 'n' that};
$d = q|this 'n' that|;
$e = "this 'n' that";
$f = 'this \'n\' that';
print "a=$a\n";
print "b=$b\n";
print "c=$c\n";
print "d=$d\n";
print "e=$e\n";
print "f=$f\n";

print substr("012345", 2, 2), "\n"; # 23

print length("abc"), "\n"; # 3

$a = "a" . "b";
print $a, "\n"; # ab

print "abc" x 2, "\n"; # abcabc
