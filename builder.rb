#!/usr/bin/env ruby

##
#Most blocks of code are shamelessly stolen. Final version will include sourcing.
#Thanks to all the lovely programers out there :)
#
#
#Another option to randomize things would be to have all of the data
#banks start with a sequential number (this would make it easier to know
#how many questions there are) and just search for the line with a random 
#number between 1 and whatever the number on the last line is.
##

##
#Variables
##
FILES = [ "101.txt," "102.txt," "103.txt," "104.txt," "105.txt," "106.txt," "107.txt," "108.txt," "109.txt," "110.txt," "111.txt," "112.txt," "113.txt," "114.txt," "115.txt," "201.txt," "202.txt," "203.txt," "204.txt," "205.txt," "206.txt," ]

FILES.each { |file| 10.times { File.readlines(file).sample } }