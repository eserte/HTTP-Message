package FakeTime;

use strict;
use warnings;

require Exporter;
our @ISA = 'Exporter';
our @EXPORT_OK = 'time';

sub import {
    my $pkg = shift;
    return unless @_;
    my $sym = shift;
    my $where = 'CORE::GLOBAL';
    $pkg->export($where, $sym, @_);
}

sub time () {
    if (defined $FakeTime::time) {
	#require Carp; Carp::carp("Faked time: $FakeTime::time");
	$FakeTime::time;
    } else {
	CORE::time();
    }
}

sub freeze {
    $FakeTime::time = CORE::time();
}

sub unfreeze {
    undef $FakeTime::time;
}

1;

__END__
