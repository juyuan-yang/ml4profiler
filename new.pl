#!/usr/bin/perl

use strict;
use Getopt::Long;
use File::Path qw(make_path);
use Cwd;
use Cwd 'abs_path';

my $cur_dir = getcwd;
my $num_runs = 5;
my $max_terms = 3;

    print "*** Building performance model\n";

    my $cmd = "octave -qf -p $cur_dir/ml/common $cur_dir/ml/stable/foba_poly_model_init.m output 1 $max_terms";
    print "Running command: $cmd ...\n";
    system($cmd) == 0 or die "Failed: $cmd: $!\n";

    my $cmd = "octave -qf -p $cur_dir/ml/common $cur_dir/ml/stable/foba_poly_model.m output 2 $max_terms";
    print "Running command: $cmd ...\n";
    system($cmd) == 0 or die "Failed: $cmd: $!\n";

