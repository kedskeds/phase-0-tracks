=begin 

prompt user for information 
store info in hash, convert info to correct data types

when done, print hash

ask if any updates are needed
	if "none", end 
	else
		store user input as a key and request value
		print new hash

exit program.

=end

def client_info
	# ask for name (string)
	puts "Enter client's name:"
	name = gets.chomp.capitalize

	# ask for age (integer)
	# request birth year so info gets updated automatically each yr
	puts "What year was the client born in? YYYY"
	birth_year = gets.chomp.to_i
	age = Time.new.year - birth_year

	# number of children (integer)
	puts "How many children do you have?"
	num_children = gets.chomp.to_i

	#decor theme (string)
	puts "What is the decor theme?"
	decor = gets.chomp 

	# ask if picky client (boolean)
	puts "Is this client generally picky? (y/n)"
	picky = gets.chomp 
	if picky == "y"
		picky = true 
	else
		picky = false
	end

	# budget (integer)
	puts "What is their budget?"
	budget = gets.chomp.to_i 
	
end