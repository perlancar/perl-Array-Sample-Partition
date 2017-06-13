package Array::Sample::Partition;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(sample_partition);

sub sample_partition {
    my ($ary, $n, $opts) = @_;
    $opts //= {};

    $n = @$ary if $n > @$ary;

    my @res;
    for my $i (1..$n) {
        my $idx = int($i*@$ary/($n+1));
        push @res, $opts->{pos} ? $idx : $ary->[$idx];
    }

    @res;
}

1;
# ABSTRACT: Sample elements from an array by equal partitions

=head1 SYNOPSIS

 use Array::Sample::Partition qw(sample_partition);

 sample_partition([0,1,2,3,4], 1); => (2)
 sample_partition([0,1,2,3,4], 2); => (1,3)
 sample_partition([0,1,2,3,4], 3); => (1,2,3)

 sample_partition([0,1,2,3,4,5], 1); => (3)
 sample_partition([0,1,2,3,4,5], 2); => (2,4)
 sample_partition([0,1,2,3,4,5], 3); => (1,3,4)
 sample_partition([0,1,2,3,4,5], 4); => (1,2,3,4)


=head1 DESCRIPTION


=head1 FUNCTIONS

All functions are not exported by default, but exportable.

=head2 sample_partition

Syntax: sample_partition(\@ary, $n [ , \%opts ]) => list

Options:

=over * pos => bool

If set to true, will return positions instead of the elements.

=over


=head1 SEE ALSO

L<Array::Sample::SysRand>

=cut
