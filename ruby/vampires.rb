valid_age = true
eats_garlic = true
wants_ins = true
result = "Results inconclusive."
valid_name = true
likes_sunshine = true

puts "How many employees will be processed?"
num_employees = gets.chomp 

i = 1

until i > num_employees.to_i

	puts "What is your name?"
	name = gets.chomp
	name = name.downcase
	if(name == "drake cula") || (name == "tu fang")
		valid_name = false
	end

	puts "How old are you? What year were you born?"
	age = gets.chomp
	birth_year = gets.chomp

	if (2016 - birth_year.to_i) != age.to_i
		valid_age = false
	end

	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	garlic = gets.chomp

	if(garlic == "n")
		eats_garlic = false
	end

	puts "Would you like to enroll in the company’s health insurance? (y/n)"
	health_ins = gets.chomp 

	if(health_ins == "n")
		wants_ins = false
	end

	allergies = ""

	puts "what are you allergic to? Type 'done' when finished."
	until allergies == "done"
		
		allergies = gets.chomp
		if allergies == "sunshine"
			likes_sunshine = false
			break
		end
	end

	if valid_age && (eats_garlic || wants_ins)
		result = "Probably not a vampire."
	end
	if (!valid_age && (!eats_garlic || !wants_ins)) || (likes_sunshine == false)
		result = "Probably a vampire."
	end
	if !valid_age && !eats_garlic && !wants_ins
		result = "Almost certainly a vampire."
	end
	if !valid_name
		result = "Definitely a vampire."
	end

	puts "-----------------------------------"
	puts "Employee #{i}: #{result}"
	puts "-----------------------------------"

	i += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
