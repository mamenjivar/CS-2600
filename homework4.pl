#!/usr/bin/perl

# Name: Miguel Menjivar
# Course: CS 2600
# Assignment: HW 04
# Due Date: 11/13/18

print "Process Lister\n\n";

@array = (); # to save contents of piped command
@split = (); # to split each array index to strings
@slice = (); # to slice index 10 and up
$count = 0; # keeps track how many lines for piped command

# get contents of piped command and save to array
while (<>) {
#  print $_;
  $array[ $count ] = $_;
  $count = $count + 1;
}

# will split contents of array to print desired information
for( $i = 0; $i < $count; $i++){
  @split = split(" ", $array[ $i ]);
  print "$split[6]   ";

  @slice = @split[ 10..30 ];
  foreach (@slice) {
    print "$_ ";
  }
  print "\n";
}
