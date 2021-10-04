#!/usr/bin/env perl
## A wrapper script to call chewBBACA.py and collect its output
use strict;
use warnings;
use Cwd;
use English;
use File::Copy;
use File::Basename;

# Parse arguments
my ($report_out,
    $allelic_profile,
    $amr,
	$contamination,
    $isolate_names_1,
    $isolates_1,
    $isolate_names_2,
    $isolates_2) = @ARGV;

# Run program
my $abs_path = Cwd::abs_path($PROGRAM_NAME);
my $scriptdir = dirname($abs_path);
my $python = "python $scriptdir/discover.py -i ion";

if ($isolate_names_1 ne "ERROR") {
  prepareEnvironment($isolates_1,$isolate_names_1,".");
  if ($isolates_2 ne "SINGLE") {
    prepareEnvironment($isolates_2,$isolate_names_2,".");
    $python = "python $scriptdir/discover.py -i illumina";
  }
  system("$python");
  collectOutput();
}
exit(0);

# Run prepareEnvironment, create the directory $indir with symlinks to the files listed in $inlist
sub prepareEnvironment {
    my ($inlist, $inlist_names, $indir) = @_;
    if ($inlist ne "NULL") {
      mkdir($indir);
      my @inputs = split(',', $inlist);
      if ($inlist_names ne "NULL") {
        my @inputs_names = split(',', $inlist_names);
        for my $i ( 0 .. $#inputs ){
          my $name = $inputs_names[$i];
          $name =~ s/ /_/g;
          $name =~ s/\//_/g;
          $name =~ s/\(/_/g;
          $name =~ s/\)/_/g;
          $name =~ s/\[/_/g;
          $name =~ s/\]/_/g;
          $name =~ s/\{/_/g;
          $name =~ s/\}/_/g;
          symlink($inputs[$i], $indir . "/" . $name);
        }
      }
      else {
        foreach my $i (@inputs){
          symlink($i, $indir . "/" . basename($i));
        }
      }
    }
    return 0;
}

# Collect output
sub collectOutput{
  copy("Tab_results.txt", $report_out) or die "Could not copy Tab_results.txt: $!\n";
  copy("Tab_AMR.txt", $amr) or die "Could not copy Tab_AMR.txt: $!\n";
  copy("Tab_cgMLST.txt", $allelic_profile) or die "Could not copy Tab_cgMLST.txt: $!\n";
  copy("Contamination_sheet.txt", $contamination) or die "Could not copy Contamination_sheet.txt: $!\n";
  return 0;
}

