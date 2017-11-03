#!/usr/bin/env ruby

#
# This script will take a bank of questions (the array FILES) and form them into 
# a multiple choice test with equal weight on each bank of questions.
#

FILES = [ "101.txt", "102.txt", "103.txt", "104.txt", "105.txt", "106.txt", "107.txt", "108.txt", "109.txt", "110.txt", "111.txt", "112.txt", "113.txt", "114.txt", "115.txt", "201.txt", "202.txt", "203.txt", "204.txt", "205.txt", "206.txt", ]
CHOSEN = []
TEST = []
KEY = []


def randomizer (bank)
	werk = File.readlines(bank).sample
	if !CHOSEN.include?(werk) 
		CHOSEN << werk
	end
end


def Key
	
end

############################################
def Test 
	question = []
	while CHOSEN.any? do
		#puts CHOSEN.shuffle!.shift
		question << CHOSEN.shuffle!.shift
		#question.split
		puts question
	end
end
#################################################

until CHOSEN.size == 6 
	CHOSEN.clear
	FILES.each { |file| 5.times { randomizer(file) } }
end

puts
Test()


#	print CHOSEN.size
#	puts " questions"


https://stackoverflow.com/questions/975769/how-to-split-a-delimited-string-in-ruby-and-convert-it-to-an-array
https://stackoverflow.com/questions/15472902/splitting-a-string-and-assigning-to-different-variables
https://stackoverflow.com/questions/8751875/storing-output-into-a-variable-to-be-used-in-an-array