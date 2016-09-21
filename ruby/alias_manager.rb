=begin

the fake_name algorithm takes in a string parameter.
	-splits the string into 2 words (first and last name)

	-for each word:
		-split the word into letters

		-for each letter:
			-is it a vowel?
				-if yes, return the next_vowel
			-else
				-return the next_consonant
	
	join the letters
	swap the order of the words
	return full fake name
=end

def next_letter(letter, list)
	if letter == list[-1]
		list[0]
	else
		list[list.index(letter) + 1]
	end 
end

def fake_name(name)
	name = name.downcase.split(' ')
	
	name.map! { |word|
		word.split('').map! { |letter|
			if "aeiou".index(letter) != nil
				next_letter(letter, "aeiou")
			else 
				next_letter(letter, "bcdfghjklmnpqrstvwxyz")
			end
		}
	}
	first = name[0].join('').capitalize
	last = name[1].join('').capitalize

	return last + " " + first

end

# TEST
# p fake_name("felicia torres") == "Vussit Gimodoe"

real_name = ""

puts "Enter a first name and a last name. Type 'QUIT' to terminate."
print ">"
until real_name.upcase == "QUIT"
	real_name = gets.chomp
	if real_name.upcase != "QUIT"
		if real_name.split(' ').length != 2
			puts "ERROR: Please enter a first and last name (e.g. John Doe)."
			print ">"
		else
			puts fake_name(real_name)
			print ">"
		end
	end
end
