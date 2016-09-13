valid_age = true
eats_garlic = true
wants_ins = true
result = "Results inconclusive."
valid_name = true

puts "What is your name?"
name = gets.chomp
name = name.downcase
if(name == "drake cula") || (name == "tu fang")
	valid_name = false
end

puts "How old are you? What year were you born?"
age = gets.chomp
birth_year = gets.chomp

if (2016 - birth_year) != age
	valid_age = false
end

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic = gets.chomp

if(garlic == "n")
	eats_garlic = false
end

puts "Would you like to enroll in the company’s health insurance? (y/n)"
health_ins = gets.chomp 

if(health_ins = "n")
	wants_ins = false
end

if valid_age && (eats_garlic || wants_ins)
	result = "Probably not a vampire."
elsif !valid_age && (!eats_garlic || !wants_ins)
	result = "Probably a vampire."
end
if !valid_age && !eats_garlic && !wants_ins
	result = "Almost certainly a vampire."
end
if !valid_name
	result = "Definitely a vampire."
end

puts "The results are in! #{result}"