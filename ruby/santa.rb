class Santa
	attr_reader :ethnicity, :age
	attr_accessor :gender
	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end 
	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end 
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end 

	
	def celebrate_birthday
		@age += 1 
	end 
	def get_mad_at(reindeer)
		@reindeer_ranking.delete(reindeer)
		@reindeer_ranking << reindeer
		puts "#{reindeer} is now ranked last."
	end

	#setter methods
	#def gender=(new_gender)
	#	@gender = new_gender
	#end

	#getter methods
	#def age 
	#	@age
	#end
	#def ethnicity
	#	@ethnicity
	#end 
end

#initialize new Santa
bob = Santa.new("gender fluid", "hispanic") 

#test Santa methods
bob.speak 
bob.eat_milk_and_cookies("chocolate chip cookie")

genders = ["none", "other", "fluid", "male", "female", "N/A"]
ethnicities = ["latino", "indian", "asian", "white", "black", "N/A"]
i = 0
santa_arr = []

while i < 6
	santa_arr << Santa.new(genders[i], ethnicities[i])
	i += 1
end


#test getter and setter methods
puts "Bob's current age is #{bob.age.to_s}"
bob.celebrate_birthday
puts "Bob just celebrated a birthday. They are now #{bob.age.to_s}"
bob.get_mad_at("Dasher")
bob.gender = "unicorn"
puts "Bob's current info:"
puts "Gender: #{bob.gender}" 
puts "Ethnicity: #{bob.ethnicity}"

