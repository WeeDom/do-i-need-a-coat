#! /usr/bin/perl

use warnings;
use strict;
use Test::More;
use JSON;
use Data::Dumper;

BEGIN {
	use lib "/home/weedom/doineedacoat/lib/";
	use_ok("doineedacoat::Model::Metoffice");
};



my $metoffice = doineedacoat::Model::Metoffice->new();

## use a blue-peter 3 hourly hash - here's one I prepared earlier
my $metoffice_forecast = mockMetForecast();
open(FAKEMETOFFICE, ">fakemetoffice-readable.txt");
print FAKEMETOFFICE Dumper {
   metoffice_forecast => $metoffice_forecast 
};
close FAKEMETOFFICE;

my $yes_or_no = $metoffice->_processForecast($metoffice_forecast);
is($yes_or_no,1,"You should take a coat");

done_testing();

sub mockMetForecast {
    my $json_string;
    {
        my $linebreak = $/;
        $/ = undef;
        open(JSON, "./fakemetoffice.json");
        $json_string = <JSON>;
        close JSON;
        $/ = $linebreak;
    }
    my $metoffice_forecast = decode_json($json_string);
    return $metoffice_forecast;
}
