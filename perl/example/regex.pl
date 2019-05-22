#!/usr/bin/perl

### Check If String Match
# To check if a string matches a pattern, do str =~ m/regex_pattern/flags. Any captured pattern will be in predefined variable {$1, $2, …}.

# simple example of finding email address

$text = 'this xyz@exmaple.com that';

if ( $text =~ m/ (\w+@\w+\.com) / )
{
    print "$1", "\n"; # xyz@example.com
}
else
{
    print "no", "\n";
}

### Find and Replace
# To find and replace, do str =~ m/regex_pattern/replace/flags. Any captured pattern will be in predefined variable {$1, $2, …}

# simple example of using regrex to replace text

$text = "123123";
$text =~ s/2/8/g;  # g is a flag for global. meaning replace all occurrences
print $text, "\n";  # 183183

# Here is a more complex example, replacing all "git" image path to "png" in HTML file.
$myText = qq[<p><img src="./rabbits.gif" width="30" height="20">
and <img class="xyz" src="../cats.gif">,
but <img src ="tigers.gif">,
 <img src=
"bird.gif">!</p>];

$myText =~ s/src\s*=\s*"([^"]+)\.gif"/src="\1.png"/g;  # replacement on $myText

print $myText, "\n";

__END__

prints

<p><img src="./rabbits.png" width="30" height="20">
and <img class="xyz" src="../cats.png">,
but <img src="tigers.png">,
 <img src="bird.png">!</p>
