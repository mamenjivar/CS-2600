#!/usr/bin/perl

# Miguel Menjivar
# Homework 05
# CS 2600
# Unix and Scripting
#
# Due: 12/7/2018
# homework5.pl

# What's on

print "What's on right now\n\n";

# instantiate arrays for different channels
@channelOne = ();
@channelTwo = ();
@channelThree = ();

# will read information from piped text file
while($line = <>){
  $string .= $line;
}

# will parse through string and find specific data that contains title for specific channel
@channelOne = $string =~ /<b>2.1<\/b>\s*<\/th>\s*<td.*>\s*<span.*<\/span>\s*<b.*>(.*)<\/b>/;
@channelTwo = $string =~ /<b>4.1<\/b>\s*<\/th>\s*<td.*>\s*<span.*<\/span>\s*<b.*>(.*)<\/b>/;
@channelThree = $string =~ /<b>7.1<\/b>\s*<\/th>\s*<td.*>\s*<span.*<\/span>\s*<b.*>(.*)<\/b>/;

# print out results
print "2.1 - " . join('', @channelOne) . "\n";
print "4.1 - " . join('', @channelTwo) . "\n";
print "7.1 - " . join('', @channelThree) . "\n";
