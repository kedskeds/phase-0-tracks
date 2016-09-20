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




colors = ["blue", "green", "red", "orange"]

people_colors = {
	bob: "blue",
	gary: "green",
	roy: "red",
	ollie: "orange"
}


colors.delete_if {|color| color.length < 5}
p colors

p people_colors.delete_if{|person, color| color == "red" }


colors = ["blue", "green", "red", "orange"]

people_colors = {
	bob: "blue",
	gary: "green",
	roy: "red",
	ollie: "orange"
}

colors.select! {|color| color.length < 5}
p colors

p people_colors.select!{|person, color| color == "orange" || color == "green"}

colors = ["blue", "green", "red", "orange"]

people_colors = {
	bob: "blue",
	gary: "green",
	roy: "red",
	ollie: "orange"
}

p colors.take_while {|color| color.index("r") == nil}

p people_colors.keep_if {|person, color| person != :roy }

colors = ["blue", "green", "red", "orange"]
p colors.drop_while{|color| color.length < 5 }

