#!/usr/bin/perl

# common helpers
# (c) 2011-2012 Florian Staudacher
# http://github.com/Raven24/webmize
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Log functions
sub log_err {
    logf(shift, "error");
    exit 1;
}

sub log_info {
    logf(shift, "info");
}

# logger
sub logf {
    my $msg = shift;
    my $lvl = shift;
    my $lvlLen = 7;
    my $out = "";

    if( !$lvl || $lvl eq "" ) {
        $out .= "-" x ($lvlLen+2);
    } else {
        $out .= "[". sprintf('%*s', $lvlLen, $lvl) . "]";
    }
    $out .= "  " . $msg . "\n";
    print $out;
}

# round a number up to the next multiple of 8
sub round_eight {
    my $num = shift;
    return ($num + 7) & ~7;
}

# load a CPAN module for further usage
sub load_module {
    # get the module name
    my $name = shift;

    eval "use $name";

    if ($@) {
        log_err("you need the module $name from CPAN!");
    }

    return 1;
}

# trim whitespace around a string
sub trim
{
    my $string = shift;
    $string =~ s/^\s+//;
    $string =~ s/\s+$//;
    return $string;
}

return 1;
exit;