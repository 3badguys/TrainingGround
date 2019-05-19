#!/usr/bin/perl

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(abs_path($0)); # add the current dir to @INC

use Data::Dumper;
print Dumper(\@INC);

use mymodule; # import the module
print mymodule::f1(5), "\n"; # call the function
