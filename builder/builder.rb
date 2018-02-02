#!/usr/bin/env ruby

require 'SecureRandom'

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
ALL_QUESTIONS = []
EXTRA_QUESTIONS = []
current_question = []


# Deletes any existing tests' or answer keys' contents, and then sets up the format.
def Prep

	if ( File.exist?("EIWS_Final_Test.txt") )
		File.open("Answer_Key.txt", "w") { |thing| thing.truncate(0) }
	end
	if ( File.exist?("Answer_Key.txt") )
		File.open("EIWS_Final_Test.txt", "w") { |thing| thing.truncate(0) }
	end

	version = SecureRandom.hex(10)

	File.open("EIWS_Final_Test.txt","a") do |thing|
		thing.puts("Name: ")
		thing.puts("Test Version: " + version.to_s)
		thing.puts
		thing.puts
	end

	File.open("Answer_Key.txt","a") do |thing|
		thing.puts("Key for test version: " + version.to_s)
		thing.puts
		thing.puts
	end

end


def randomizer (bank)
	werk = File.readlines(bank).sample
	if !ALL_QUESTIONS.include?(werk)
		ALL_QUESTIONS << werk
		puts ALL_QUESTIONS.size
	end
end


def Test
	question_number = 0

	while ALL_QUESTIONS.any? do

		question_number += 1
		current_question = ALL_QUESTIONS.shuffle!.shift
		current_question = current_question.split(" | ")
		question = current_question.shift
		correct = current_question[0]

		# Writing the question
		File.open("EIWS_Final_Test.txt","a") do |thing|
			thing.puts(" ")
			thing.puts(question_number.to_s + ". " + question)
		end

		i = 1

		# Writing the answer options in random order
		while current_question.any? do
			current_answer = []

			if i == 1
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     A. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". A")
					end
				end

			elsif i == 2
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     B. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". B")
					end
				end

			elsif i == 3
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     C. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". C")
					end
				end

			elsif i == 4
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     D. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". D")
					end
				end

			elsif i == 5
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     E. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". E")
					end
				end

			elsif i == 6
				File.open("EIWS_Final_Test.txt","a") do |thing|
					current_answer = current_question.shuffle!.shift
					thing.puts("     F. " + current_answer.to_s)
				end
				if correct.to_s == current_answer.to_s
					File.open("Answer_Key.txt","a") do |key|
						key.puts(question_number.to_s + ". F")
					end
				end

			end
			i += 1
		end
	end
end


def Extra
	extra = File.readlines("Extra_Credit.txt").sample
	if !EXTRA_QUESTIONS.include?(extra)
		EXTRA_QUESTIONS << extra
		puts EXTRA_QUESTIONS.size
	end
	while EXTRA_QUESTIONS.any? do
		current_question = EXTRA_QUESTIONS.shuffle!.shift
		File.open("EIWS_Final_Test.txt","a") do |thing|
			thing.puts("")
			thing.puts("")
			thing.puts(current_question)
		end
	end
end





####
#### This until block builds the test. to get an even number of questions...
#### 21 (files) * X (questions from each section) = Y (test size)
#### For my purposes, I will be aiming for at least 100 questions in the final version.
####
until ALL_QUESTIONS.size == 100
	ALL_QUESTIONS.clear
	puts "ALL_QUESTIONS cleared"
	FILES.each { |file| 7.times { randomizer(file) } }
end

Prep()
Test()
Extra()
