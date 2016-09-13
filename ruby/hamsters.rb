
puts "What is your hamster's name?"
hamster_name = gets.chomp
hamster_name = hamster_name.capitalize

puts "On a scale from 1 - 10, how loud is your hamster?"
volume = gets.chomp
volume = volume.to_i
if volume <5
	volume = "soft"
elsif volume >=5 
	volume = "loud"
end

puts "What color is your hamster?"
color = gets.chomp

puts "Is your hamster good to adopt? (Y/N)"
adoption = gets.chomp
adoption = adoption.upcase
if adoption == "Y"
	adoption = "Great!"
elsif adoption == "N"
	adoption = "Not great!"
else 
	adoption = "Unknown"
end

puts  "How old is your hamster?"
age = gets.chomp
if age == "" 
	age = "Unknown"
else 
	age = age.to_i
end

puts "-------------------------"
puts "Summary:"
puts "Name: #{hamster_name}"
puts "Level of Noise: #{volume}"
puts "Color: #{color}"
puts "Adoptability Rating: #{adoption}"
puts "Age: #{age}"
puts "-------------------------"