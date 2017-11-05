#!/usr/bin/env ruby

#
# This script will take a bank of questions (the array FILES) and form them into 
# a multiple choice test with equal weight on each bank of questions.
# The answer key will be generated using the created test document to 
# search through the bank and match the answer to the 
#

FILES = [ "101.txt", "102.txt", "103.txt", "104.txt", "105.txt", "106.txt", "107.txt", "108.txt", "109.txt", "110.txt", "111.txt", "112.txt", "113.txt", "114.txt", "115.txt", "201.txt", "202.txt", "203.txt", "204.txt", "205.txt", "206.txt", ]
CHOSEN = []
TEST = []
KEY = []
chosed = []

def randomizer (bank)
	werk = File.readlines(bank).sample
	if !CHOSEN.include?(werk) 
		CHOSEN << werk
	end
end


##### var is the array of answers only. var[0] is the answer.
##### Need to locate var[0] in the test file and fetch first letter.
##### Super broken. not working.
def Key (var)
	File.open('Test.txt').each do |line|
		puts line =~ var
		puts var
	end
end


def Test
	num = 0
	while CHOSEN.any? do
		num += 1
		chosed = CHOSEN.shuffle!.shift  
		chosed = chosed.split(" | ")
		question = chosed.shift
		File.open("Test.txt","a") do |f|
			f.puts(num.to_s + ". " + question)
		end
		var = chosed[0]
		i = 1
		while chosed.any? do
			if i == 1
				File.open("Test.txt","a") do |f|
					f.puts("     A. " + chosed.shuffle!.shift)
				end
			elsif i == 2
				File.open("Test.txt","a") do |f|
					f.puts("     B. " + chosed.shuffle!.shift)
				end			
			elsif i == 3
				File.open("Test.txt","a") do |f|
					f.puts("     C. " + chosed.shuffle!.shift)
				end			
			elsif i == 4
				File.open("Test.txt","a") do |f|
					f.puts("     D. " + chosed.shuffle!.shift)
				end			
			end
			i += 1
		end
		#Key (var)
	end
end


until CHOSEN.size == 6 
	CHOSEN.clear
	FILES.each { |file| 5.times { randomizer(file) } }
end

puts 
Test()

