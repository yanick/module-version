package Module::Version;
# ABSTRACT: Get module versions

use strict;
use warnings;
use parent 'Exporter';

use Carp qw< croak >;
use ExtUtils::MakeMaker;

our @EXPORT_OK = 'get_version';

sub get_version {
    my $module = shift or croak 'Must get a module name';
    my $file   = MM->_installed_file_for_module($module);

    $file || return;

    return MM->parse_version($file);
}

1;

__END__

=head1 SYNOPSIS

This module fetches the version of any other module.

It comes with a CLI program C<mversion> which does the same.

    use Module::Version 'get_version';

    print get_version('Search::GIN'), "\n";

Or using C<mversion>:

    $ mversion Search::GIN
    0.04

    $ mversion Doesnt::Exist
    Warning: module 'Doesnt::Exist' does not seem to be installed.

    $ mversion --quiet Doesnt::Exist
    (no output)

    $ mversion --full Search::GIN Moose
    Search::GIN 0.04
    Moose 1.01

    $ mversion --input modules.txt
    Search::GIN 0.04
    Data::Collector 0.03
    Moose 1.01

=head1 EXPORT

=head2 get_version

C<get_version> will be exported if explicitly specified.

    use Module::Version 'get_version';

B<Nothing> is exported by default.

=head1 SUBROUTINES/METHODS

=head2 get_version

Accepts a module name and fetches the version of the module.

If the module doesn't exist, returns undef.

=head1 BUGS

Please report bugs and other issues on the bugtracker:

L<http://github.com/xsawyerx/module-version/issues>

=head1 SUPPORT

This module sports 100% test coverage, but in case you have more issues, please
see I<BUGS> above.
