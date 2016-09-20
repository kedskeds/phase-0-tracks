colors = ["blue", "green", "red", "orange"]

people_colors = {
	bob: "blue",
	gary: "green",
	roy: "red",
	ollie: "orange"
}

puts "This is the color array before calling .each:"
p colors 

puts "This is the .each output:"
colors.each {|color| p "#{color} is awesome!"}

puts "Color array after .each:"
p colors

puts "color array after .map!"
colors.map! {|color| "#{color} is awesome!"}
p colors

puts "People_colors hash before .each:"
p people_colors

puts "People_colors hash after .each:"
people_colors.each {|name, color| p name.capitalize}

