# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # [fill in any steps here]
  # iterate through each item in the string => key
  # set default quantity => value
  # print the list to the console using the print-list method
# output: hash [what data type goes here, array or hash?]
$list = {}

def create_list(str)
	str = str.split(' ')

	str.each do |item|
		$list[item] = 1
	end
	print_list
end



# Method to add an item to a list
# input: item name and optional quantity
# steps:
	# add the key with either given quantity or default value
# output: integer

def add_item(item, quantity=1)
	$list[item] = quantity
	print_list
end	



# Method to remove an item from the list
# input: item name 
# steps:
	# use hash.delete method to remove given key, value pair from list
# output: hash

def remove_item(item)
	$list.delete(item)
	print_list
end	



# Method to update the quantity of an item
# input: item and quantity
# steps:
	# iterate through keys to search for item name
	# if found, update the value with quantity
# output: hash

def update_quantity(item, quantity)
	if $list.has_key?(item)
		$list[item] = quantity 
	end
	print_list
end	



# Method to print a list and make it look pretty
# input: hash
# steps:
	# iterate through each key-value pair and print formatted list
# output: nil

def print_list
	puts "Current List:"
	$list.each do |item, quantity|
		puts "#{item}.......#{quantity}"
	end
	puts "--------------"
end

=begin
create_list("")
add_item("Lemonade",2)
add_item("Tomatoes",3)
add_item("Onions",1)
add_item("Ice Cream",4)
remove_item("Lemonade")
update_quantity("Ice Cream",1)
print_list
=end

## REFLECTION

=begin 

pseudocode is an important element to writing clean
code. If you know what a method should return ahead
of time, it's easy to see when something is broken.

using nested arrays to store the information would
have been more challenging to update and iterate
through. a hash is a better choice for this program
so that each key/value pair can be easily accessed.

a method returns the last line of code.

you can pass any instance of a class into a method
as an argument. You can also pass a hardcoded value,
such as the default quantity value.

you can pass information between methods by accepting
that information as an argument

the difference between using global/local variables
was cleared up for me. 

=end