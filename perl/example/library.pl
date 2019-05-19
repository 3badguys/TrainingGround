#!/usr/bin/perl

# In Perl, a library is called a module. The standard filename suffix is ".pm".
# For a script, the filename suffix is ".pl".

# load some commonly use packages
use Data::Dumper; # for printing list and array
use File::Find; # for traversing directories

# predefined variables @INC and %INC
print Dumper \@INC; # prints all module searching paths
print Dumper \%INC; # prints all loaded modules

# sample output:
# $VAR1 = [
#           '/etc/perl',
#           '/usr/local/lib/x86_64-linux-gnu/perl/5.24.1',
#           '/usr/local/share/perl/5.24.1',
#           '/usr/lib/x86_64-linux-gnu/perl5/5.24',
#           '/usr/share/perl5',
#           '/usr/lib/x86_64-linux-gnu/perl/5.24',
#           '/usr/share/perl/5.24',
#           '/usr/local/lib/site_perl',
#           '/usr/lib/x86_64-linux-gnu/perl-base'
#         ];
# $VAR1 = {
#           'warnings/register.pm' => '/usr/share/perl/5.24/warnings/register.pm',
#           'strict.pm' => '/usr/share/perl/5.24/strict.pm',
#           'XSLoader.pm' => '/usr/share/perl/5.24/XSLoader.pm',
#           'File/Spec/Unix.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/File/Spec/Unix.pm',
#           'List/Util.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/List/Util.pm',
#           '/etc/perl/sitecustomize.pl' => '/etc/perl/sitecustomize.pl',
#           'Scalar/Util.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/Scalar/Util.pm',
#           'File/Basename.pm' => '/usr/share/perl/5.24/File/Basename.pm',
#           'File/Find.pm' => '/usr/share/perl/5.24/File/Find.pm',
#           'bytes.pm' => '/usr/share/perl/5.24/bytes.pm',
#           'vars.pm' => '/usr/share/perl/5.24/vars.pm',
#           'Carp.pm' => '/usr/share/perl/5.24/Carp.pm',
#           'Cwd.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/Cwd.pm',
#           'Data/Dumper.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/Data/Dumper.pm',
#           'File/Spec.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/File/Spec.pm',
#           'constant.pm' => '/usr/share/perl/5.24/constant.pm',
#           'warnings.pm' => '/usr/share/perl/5.24/warnings.pm',
#           'overload.pm' => '/usr/share/perl/5.24/overload.pm',
#           'overloading.pm' => '/usr/share/perl/5.24/overloading.pm',
#           'Config.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.24/Config.pm',
#           'Exporter.pm' => '/usr/share/perl/5.24/Exporter.pm'
#         };
