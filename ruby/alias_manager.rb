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

# returns the next letter in a list of consonants OR vowels
def next_letter(letter, list)
	if letter == list[-1]
		list[0]
	else
		list[list.index(letter) + 1]
	end 
end

def fake_name(name)
	#separate the name into 2 words
	name = name.downcase.split(' ')
	
	#on each word:
	name.map! { |word|
		#split the word into individual characters:
		word.split('').map! { |letter|
			#on each character:
			#is it a vowel?
			if "aeiou".index(letter) != nil
				next_letter(letter, "aeiou")
			#otherwise, it's a consonant
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
names_hash = {}
counter = 0

puts "Enter a first name and a last name. Type 'QUIT' to terminate."
print ">"
until real_name.upcase == "QUIT"
	real_name = gets.chomp
	if real_name.upcase != "QUIT"
		#check for invalid input
		if real_name.split(' ').length != 2
			puts "ERROR: Please enter a first and last name (e.g. John Doe)."
			print ">"
		else
			#turn counter variable into a symbol
			idx = counter.to_s.to_sym

			#store names inside array inside hash
			names_hash[idx] = [fake_name(real_name), real_name]
			
			puts fake_name(real_name)
			print ">"
		end
	end
	counter += 1
end

names_hash.each {|index, names|
	puts names[0] + " is actually " + names[1] + "!"
}