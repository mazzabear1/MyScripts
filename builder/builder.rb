#!/usr/bin/env ruby

#
# This script will take a bank of questions (the array FILES) and form them into
# a multiple choice test with equal weight on each bank of questions.
# The answer key will be generated using the created test document to
# search through the bank and match the answer to the
#

FILES = [ "101.txt", "102.txt", "103.txt", "104.txt", "105.txt", "106.txt",
	"107.txt", 	"108.txt", "109.txt", "110.txt", "111.txt", "112.txt", "113.txt",
	"114.txt", "115.txt", 	"201.txt", "202.txt", "203.txt", "204.txt", "205.txt",
	"206.txt", ]
CHOSEN = []
chosed = []

def randomizer (bank)
	werk = File.readlines(bank).sample
	if !CHOSEN.include?(werk)
		CHOSEN << werk
		puts CHOSEN.size
	end
end

def Key (question_number, letter)
	File.open("Key.txt","a") do |g|
		g.puts(question_number.to_s + ". " + letter)
	end
end

def Test
	question_number = 0

	while CHOSEN.any? do

		question_number += 1
		chosed = CHOSEN.shuffle!.shift
		chosed = chosed.split(" | ")
		question = chosed.shift

		# Writing the question
		File.open("Test.txt","a") do |f|
			f.puts(question_number.to_s + ". " + question)
		end

		i = 1

		# Writing the answer options in random order
		while chosed.any? do
			correct = chosed[0]

			if i == 1
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     A. " + current.to_s)
					if current == correct
						letter = "A"
						Key(question_number, letter)
					end
				end

			elsif i == 2
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     B. " + current.to_s)
					if current == correct
						letter = "B"
						Key(question_number, letter)
					end
				end

			elsif i == 3
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     C. " + current.to_s)
					if current == correct
						letter = "C"
						Key(question_number, letter)
					end
				end

			elsif i == 4
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     D. " + current.to_s)
					if current == correct
						letter = "D"
						Key(question_number, letter)
					end
				end

			elsif i == 5
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     E. " + current.to_s)
					if current == correct
						letter = "E"
						Key(question_number, letter)
					end
				end

			elsif i == 6
				File.open("Test.txt","a") do |f|
					current = chosed.shuffle!.shift
					f.puts("     F. " + current.to_s)
					if current == correct
						letter = "F"
						Key(question_number, letter)
					end
				end

			end
			i += 1
		end
	end
end

####
#### This until block builds the test. to get an even number of questions...
#### 21 (files) * X (questions from each section) = Y (test size)
#### For my purposes, I will be aiming for at least 100 questions in the final version.
####
until CHOSEN.size == 80
	CHOSEN.clear
	puts "cleared"
	FILES.each { |file| 5.times { randomizer(file) } }
end

puts
Test()
