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

	# initialize the return value
	client_hash = {}

	# ask for name (string)
	puts "Enter client's name:"
	client_hash[:name] = gets.chomp.capitalize

	# ask for age (integer)
	# request birth year so info gets updated automatically each yr
	puts "What year was the client born in? YYYY"
	birth_year = gets.chomp.to_i
	client_hash[:age] = Time.new.year - birth_year

	# number of children (integer)
	puts "How many children does the client have?"
	client_hash[:children] = gets.chomp.to_i

	#decor theme (string)
	puts "What is the decor theme?"
	client_hash[:decor] = gets.chomp 

	# ask if picky client (boolean)
	puts "Is this client generally picky? (y/n)"
	picky = gets.chomp 
	if picky == "y"
		client_hash[:picky] = true 
	else
		client_hash[:picky] = false
	end

	# budget (integer)
	puts "What is their budget?"
	client_hash[:budget] = gets.chomp.to_i 

	#print the hash
	puts "Here is the current info on file for #{client_hash[:name]}:"
	puts client_hash
	puts ""
	#ask the user if there are changes to make to the dataset
	puts "Do you have any changes? Type 'NONE' if the info is complete."
	puts "Otherwise, type the category you wish to change or add. (i.e., favorite color)"
	changes = gets.chomp.downcase

	#if there are no changes, the program will terminate.
	if changes == "none"
		puts "Thanks for using the client information program."
	#else if the user wants to change or add a key, ask for the value
	else
		puts "Please enter info for the category '#{changes.upcase}':"
		new_info = gets.chomp

		#replace all spaces in the category name with underscores
		changes = changes.gsub(' ','_')

		#convert string into a symbol
		changes = changes.to_sym

		client_hash[changes] = new_info
		puts ""
		puts "Thanks for entering your changes. Here is the updated info:"
		puts client_hash
	end
	puts "Program will now terminate."

end

client_info







