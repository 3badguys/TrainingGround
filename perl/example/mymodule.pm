#!/usr/bin/perl

package mymodule; # declaring the module

sub f1($) {
    $_[0] + 1 # module body
}

1 # module must return a true value

