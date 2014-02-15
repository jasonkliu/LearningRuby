#!/usr/bin/env ruby

=begin
Write a Deaf Grandma program.

Whatever you say to grandma (whatever you type in), she should respond with 
"HUH?! SPEAK UP, SONNY!", unless you shout it (type in all capitals).

If you shout, she can hear you (or at least she thinks so) and yells back, 
"NO, NOT SINCE 1938!" or other silly grandma phrases she has in her small 
repertoire. 

To make your program really believable, have grandma shout a different year 
each time; maybe any year at random between 1930 and 1950. You can't stop 
talking to grandma until you shout BYE. Except she doesn't want you to leave, 
so you have to shout BYE three times in a row.

Make sure to test your program: if you shout BYE three times, but not in a 
row, you should still be talking to grandma.

Hints
Don't forget about chomp! 'BYE' with an Enter is not the same as 'BYE' 
without one! Try to think about what parts of your program should happen over
and over again. All of those should be in your while loop.

(adapted from Chris Pine's "LearnToProgram" http://pine.fm/LearnToProgram/?Chapter=06)
=end

puts 'HELLO I AM GRANDMA'

$num_bye = 0
$last = 3

while $num_bye < $last do

	text = gets.chomp  # Get text from stdin keyboard input

	if text == text.upcase  # text.capitalize also works
		if text == "BYE" 
			$num_bye = $num_bye + 1
			puts "WHAT ARE YOU SAYING?"
			#puts $num_bye.to_s
		else
			$num_bye = 0 
			puts "NO, NOT SINCE " + Random.rand(1930..1950).to_s + "!"
		end
	else
		$num_bye = 0
		puts "HUH?! SPEAK UP, SONNY!"
	end
	puts ""

end
	 