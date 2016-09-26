class Santa
	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		age = 0
	end 
	def about
		puts "Gender: #{@gender}"
		puts "Ethnicity: #{@ethnicity}"
	end
	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end 
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end 
end

#initialize new Santa
bob = Santa.new("gender fluid", "hispanic") 

#test Santa methods
bob.speak 
bob.eat_milk_and_cookies("chocolate chip cookie")
bob.about 

genders = ["none", "other", "fluid", "male", "female", "N/A"]
ethnicities = ["latino", "indian", "asian", "white", "black", "N/A"]
i = 0
santa_arr = []

while i < 6
	santa_arr << Santa.new(genders[i], ethnicities[i])
	i += 1
end

p santa_arr